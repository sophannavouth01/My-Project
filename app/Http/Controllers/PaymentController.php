<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Payment;
use App\Models\Order; 
class PaymentController extends Controller
{
    public function index()
    {
        $payments = Payment::all(); // Fetch all payments
        return response()->json($payments);
    }

    public function store(Request $request)
{
    $validatedData = $request->validate([
        'user_id' => 'required|exists:users,id',
        'order_id' => 'required|exists:orders,id',
        'amount' => 'required|numeric',
        'payment_method' => 'nullable',
        'customer_name' => 'nullable',
        'address' => 'nullable',
        'phone_number' => 'nullable'
    ]);

    $payment = Payment::create($validatedData);

    // Update the order status upon successful payment
    $order = Order::find($validatedData['order_id']);
    $order->update(['status' => 'completed']);

    return response()->json([
        'message' => 'Payment processed successfully', 
        'payment_id' => $payment
    ]);
}

}
