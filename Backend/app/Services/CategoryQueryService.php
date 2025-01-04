<?php

namespace App\Services;

use App\Models\Category;
use Illuminate\Http\Request;

class CategoryQueryService
{
    public function query(Request $request)
    {

        $query = Category::query();
        $query->with(['products', 'children', 'parent']);

        // Filter by has products or not
        if ($request->has('hasProducts')) {
            $query->whereHas('products');
        }

        return $query;
    }
}
