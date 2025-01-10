<?php

namespace App\Http\Controllers;

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
            ->get(['id', 'name', 'description', 'price', 'total_rating as rating']);

        // Search vendors
        $vendors = Vendor::where('name', 'like', "%{$query}%")
            ->orWhere('description', 'like', "%{$query}%")
            ->get(['id', 'name', 'description', 'total_rating as rating']);

        // Search categories
        $categories = Category::where('name', 'like', "%{$query}%")
            ->orWhere('description', 'like', "%{$query}%")
            ->get(['id', 'name', 'description']);

        return response()->json([
            'searchResult' => [
                'products' => $products,
                'vendors' => $vendors,
                'categories' => $categories,
            ]
        ], 200);
    }
}
