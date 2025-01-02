<?php

namespace App\Services;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductQueryService
{
    public function query(Request $request)
    {
        $query = Product::query();
        $query->with(['vendor', 'category']);

        // Filter by price range
        if ($request->has('min_price')) {
            $query->where('price', '>=', convertPriceToCents($request->input('min_price')));
        }
        if ($request->has('max_price')) {
            $query->where('price', '<=', convertPriceToCents($request->input('max_price')));
        }

        // Filter by rating range
        if ($request->has('min_rating')) {
            $query->where('total_rating', '>=', convertRatingToPercentage($request->input('min_rating')));
        }
        if ($request->has('max_rating')) {
            $query->where('total_rating', '<=', convertRatingToPercentage($request->input('max_rating')));
        }

        // Filter by category 
        if ($request->has('category_id')) {
            $categoryIds = explode('-', $request->input('category_id'));
            $query->whereIn('category_id', $categoryIds);
        }

        // Sorting
        if ($request->has('sort_by') && $request->has('sort_order')) {
            $query->orderBy($request->input('sort_by'), $request->input('sort_order'));
        }

        return $query;
    }
}
