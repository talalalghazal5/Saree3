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
        if ($request->has('minPrice') && $request->input('minPrice') != '') {
            $query->where('price', '>=', convertPriceToCents($request->input('minPrice')));
        }
        if ($request->has('maxPrice') && $request->input('maxPrice') != '') {
            $query->where('price', '<=', convertPriceToCents($request->input('maxPrice')));
        }

        // Filter by rating range
        if ($request->has('minRating') && $request->input('minRating') != '') {
            $query->where('total_rating', '>=', convertRatingToPercentage($request->input('minRating')));
        }
        if ($request->has('maxRatin') && $request->input('maxRating') != '') {
            $query->where('total_rating', '<=', convertRatingToPercentage($request->input('maxRatin')));
        }

        // Filter by category 
        if ($request->has('categoryId') && $request->input('categoryId') != '') {
            $categoryIds = explode('-', $request->input('categoryId'));
            $query->whereIn('category_id', $categoryIds);
        }

        // Sorting
        if ($request->has('sortBy') && $request->has('sortOrder') && $request->input('sortBy') != '' && $request->input('sortOrder') != '') {
            $query->orderBy($request->input('sortBy'), $request->input('sortOrder'));
        }

        return $query;
    }
}
