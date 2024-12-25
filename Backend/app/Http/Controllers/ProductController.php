<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;

class ProductController extends Controller
{
    // Get a paginated list of products
    public function index()
    {
        $products = Product::paginate(10);
        return response()->json($products);
    }

    // Store a new product
    public function store(StoreProductRequest $request)
    {
        $product = Product::create($request->validated());
        return response()->json($product, 201);
    }

    // Show a single product
    public function show($id)
    {
        $product = Product::find($id);

        if (!$product) {
            return response()->json([
                'error' => true,
                'message' => 'Product not found'
            ], 404);
        }

        return response()->json($product);
    }

    // Update an existing product
    public function update(UpdateProductRequest $request, $id)
    {
        $product = Product::find($id);

        if (!$product) {
            return response()->json([
                'error' => true,
                'message' => 'Product not found'
            ], 404);
        }

        $product->update($request->validated());
        return response()->json($product);
    }

    // Delete a product
    public function destroy($id)
    {
        $product = Product::find($id);

        if (!$product) {
            return response()->json([
                'error' => true,
                'message' => 'Product not found'
            ], 404);
        }

        $product->delete();
        return response()->json([
            'message' => 'Product deleted successfully'
        ], 200);
    }
}
