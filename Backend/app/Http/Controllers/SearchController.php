<?php

namespace App\Http\Controllers;

use App\Http\Resources\CategoryResource;
use App\Http\Resources\ProductResource;
use App\Http\Resources\VendorResource;
use App\Models\Product;
use App\Models\Vendor;
use App\Models\Category;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    public function search(Request $request)
    {
        $query = $request->has('searchQuery') ? $request->input('searchQuery') : "";

        if ($query == "") {
            return response()->json([
                'message' => 'no search query provided'
            ], 400);
        }

        // Search products
        $products = Product::where('name', 'like', "%{$query}%")
            ->orWhere('description', 'like', "%{$query}%")
            ->get();

        // Search vendors
        $vendors = Vendor::where('name', 'like', "%{$query}%")
            ->orWhere('description', 'like', "%{$query}%")
            ->get();

        // Search categories
        $categories = Category::where('name', 'like', "%{$query}%")
            ->orWhere('description', 'like', "%{$query}%")
            ->get();

        return response()->json([
            'data' => [
                'products' => ProductResource::collection($products),
                'vendors' => VendorResource::collection($vendors),
                'categories' => CategoryResource::collection($categories),
            ]
        ], 200);
    }
}
