<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Product;
use Exception;

class OrderController extends Controller
{
    public function index()
    {
        $orders = Order::with('orderDetails.product')->get(); // Temporarily remove pagination for debugging

        return response()->json($orders);
    }
    public function show($id)
    {
        $order = Order::with('orderDetails.product')->find($id);

        if (!$order) {
            return response()->json(['message' => 'Order not found'], 404);
        }

        return response()->json($order);
    }

    public function createOrder(Request $request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'order_details' => 'required|array',
            'order_details.*.product_id' => 'required|exists:products,id',
            'order_details.*.qty' => 'required|integer|min:1',
            'order_details.*.price' => 'required|numeric|min:0'
        ]);
    
        DB::beginTransaction();
        try {
            // Check for existing pending order
            $order = Order::where('user_id', $request->user_id)
                    ->where('status', 'pending')
                    ->first();
    
            if (!$order) {
                // Create new order
                $order = Order::create([
                    'user_id' => $request->user_id,
                    'total_amount' => 0, // Initialize total_amount
                    'total_qty' => 0, // Initialize total_qty
                    'status' => 'pending'
                ]);
            }
    
            // Update existing order details or add new ones
            foreach ($request->order_details as $detail) {
                $product = Product::find($detail['product_id']);
                if (!$product || $product->qty < $detail['qty']) {
                    // Handle insufficient stock
                    throw new \Exception("Insufficient stock for product ID: " . $detail['product_id']);
                }
    
                // Deduct the quantity from product inventory
                $product->decrement('qty', $detail['qty']);
    
                $orderDetail = OrderDetail::where('order_id', $order->id)
                    ->where('product_id', $detail['product_id'])
                    ->first();
    
                if ($orderDetail) {
                    $orderDetail->update([
                        'qty' => $orderDetail->qty + $detail['qty'],
                        'price' => $detail['price'],
                        'total_price' => ($orderDetail->qty + $detail['qty']) * $detail['price']
                    ]);
                } else {
                    OrderDetail::create([
                        'order_id' => $order->id,
                        'product_id' => $detail['product_id'],
                        'qty' => $detail['qty'],
                        'price' => $detail['price'],
                        'total_price' => $detail['qty'] * $detail['price']
                    ]);
                }
            }
    
            // Recalculate total amount and total quantity for the order
            $order->update([
                'total_amount' => $order->orderDetails()->sum(DB::raw('qty * price')),
                'total_qty' => $order->orderDetails()->sum('qty')
            ]);
    
            DB::commit();
            return response()->json(['message' => 'Order updated successfully', 'order_id' => $order->id]);
    
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['error' => 'Order update failed', 'details' => $e->getMessage()], 500);
        }
    }

    public function removeItem(Request $request)
    {
        // Validate the request
        $request->validate([
         'user_id' => 'required|exists:users,id',
         'order_id' => 'required|exists:orders,id',
         'product_id' => 'required|exists:products,id'
        ]);

        DB::beginTransaction();

        try {
         // Find the order for the user
            $order = Order::where('id', $request->order_id)
                    ->where('user_id', $request->user_id)
                    ->where('status', 'pending')
                    ->firstOrFail();

            // Find the order detail
            $orderDetail = $order->orderDetails()
                ->where('product_id', $request->product_id)
                ->firstOrFail();

            // Decrease the quantity by 1
            if ($orderDetail->qty > 1) {
              $orderDetail->decrement('qty');
              $orderDetail->update(['total_price' => $orderDetail->qty * $orderDetail->price]);
              // Increment the product's stock by 1
              $product = Product::find($request->product_id);
                if ($product) {
                 $product->increment('qty');
                }
            } else {
              // If quantity is 1, remove the item from the order and increment product stock
              $orderDetail->delete();
              $product = Product::find($request->product_id);
                if ($product) {
                 $product->increment('qty');
                }
            }

             // Recalculate total amount for the order
             $order->update(['total_amount' => $order->orderDetails()->sum(DB::raw('qty * price'))]);

              DB::commit();
              return response()->json(['message' => 'Item removed successfully', 'order_id' => $order->id]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['error' => 'Failed to remove item', 'details' => $e->getMessage()], 500);
        } 
    }

    public function removeProductFromOrder(Request $request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'order_id' => 'required|exists:orders,id',
            'product_id' => 'required|exists:products,id'
        ]);
    
        try {
            // Retrieve the order for the given user
            $order = Order::where('id', $request->order_id)
                          ->where('user_id', $request->user_id)
                          ->firstOrFail();
    
            // Find the order detail to be removed
            $orderDetail = $order->orderDetails()
                                 ->where('product_id', $request->product_id)
                                 ->first();
    
            if ($orderDetail) {
                $removedQuantity = $orderDetail->qty; // Store the quantity of the product being removed
                $orderDetail->delete();
    
                // Update the product's stock
                $product = Product::find($request->product_id);
                if ($product) {
                    $product->increment('qty', $removedQuantity);
                }
    
                // Update order's total quantity
                $order->total_qty -= $removedQuantity;
                $order->save();
    
                // Check if there are no more items in the order
                if ($order->orderDetails()->count() == 0) {
                    // If no more items, delete the order
                    $order->delete();
                    return response()->json(['message' => 'Product removed and order deleted successfully']);
                }
    
                return response()->json(['message' => 'Product removed successfully']);
            } else {
                return response()->json(['message' => 'Product not found in order'], 404);
            }
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

}
