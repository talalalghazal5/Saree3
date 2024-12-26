<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;
use App\Http\Resources\ProductResource;
use App\Services\ProductQueryService;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    protected $productQueryService;
    public function __construct(ProductQueryService $productQueryService)
    {
        $this->productQueryService = $productQueryService;
    }

    // Get a paginated list of products
    public function index(Request $request)
    {
        $query = $this->productQueryService->query($request);
        $perPage = $request->input('per_page', 10);
        $products = $query->paginate($perPage);

        return ProductResource::collection($products);
    }

    // Store a new product
    public function store(StoreProductRequest $request)
    {
        $product = Product::create($request->validated());
        return new ProductResource($product);
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

        return new ProductResource($product);
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
        return new ProductResource($product);
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
