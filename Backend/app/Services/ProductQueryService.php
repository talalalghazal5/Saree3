<?php

namespace App\Services;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductQueryService
{
    public function query(Request $request)
    {
        $query = Product::query()->with('category');

        // Filter by price range
        if ($request->has('min_price')) {
            $query->where('price', '>=', $request->input('min_price'));
        }
        if ($request->has('max_price')) {
            $query->where('price', '<=', $request->input('max_price'));
        }

        // Filter by rating range
        if ($request->has('min_rating')) {
            $query->where('rating', '>=', $request->input('min_rating'));
        }
        if ($request->has('max_rating')) {
            $query->where('rating', '<=', $request->input('max_rating'));
        }

        // Sorting
        if ($request->has('sort_by') && $request->has('sort_order')) {
            $query->orderBy($request->input('sort_by'), $request->input('sort_order'));
        }

        return $query;
    }
}
