<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
 
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;

class ProductController extends Controller
{
    public function index()
    {
        $products = Product::all();
        return response()->json($products);
    }
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'pname' => 'required|max:255',
            'bcode' => 'required',
            'brandname' => 'required',
            'color' => 'required',
            'category' => 'required',
            'qty' => 'required|integer',
            'price' => 'required|numeric',
            'description' => 'required',
            'image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
        ]);
    
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }
    
        $data = $validator->validated();
    
        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('products', 'public');
            $data['image'] = $imagePath;
        }
    
        $product = Product::create($data);
        return response()->json($product, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $product = Product::find($id);
        return $product ? response()->json($product) : response()->json(['message' => 'Product not found'], 404);
     
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    } 

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $product = Product::find($id);
        if (!$product) {
            return response()->json(['error' => 'Product not found'], 404);
        }
    
        $validator = Validator::make($request->all(), [
            'pname' => 'nullable|max:255',
            'bcode' => 'nullable|max:255',
            'brandname' => 'nullable|max:255',
            'color' => 'nullable|max:255',
            'category' => 'nullable|max:255',
            'qty' => 'nullable|max:255',
            'price' => 'nullable|max:255',
            'description' => 'nullable|max:255',
            'image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
            // ... other validation rules ...
        ]);
    
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }
    
        $data = $validator->validated();
    
        if ($request->hasFile('image')) {
            // Delete the old image if it exists
            if ($product->image && Storage::disk('public')->exists($product->image)) {
                Storage::disk('public')->delete($product->image);
            }
            // Store the new image and update the image path
            $imagePath = $request->file('image')->store('products', 'public');
            $data['image'] = $imagePath;
        }
    
        $product->update($data);
        return response()->json($product);
    } 

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $product = Product::find($id);
        if (!$product) {
            return response()->json(['error' => 'Product not found'], 404);
        }
    
        // Check if the product has an image and delete it from storage
        if ($product->image && Storage::disk('public')->exists($product->image)) {
            Storage::disk('public')->delete($product->image);
        }
    
        // Delete the product from the database
        $product->delete();
    
        return response()->json(['message' => 'Product deleted successfully']);
    
    }
}
