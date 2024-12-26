<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function index()
    {
        $categories = Category::with('children')->get();
        return response()->json($categories);
    }
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255|unique:categories,name',
            'description' => 'nullable|string',
            'parent_category_id' => 'nullable|exists:categories,id',
        ]);
        $category = Category::create($request->all());

        // If parent_category_id is provided, associate the category with its parent
        if ($request->parent_category_id) {
            $parentCategory = Category::find($request->parent_category_id);
            $parentCategory->children()->save($category);
        }

        return response()->json($category, 201);
    }
    public function show($id)
    {
        $category = Category::with('children')->find($id);
        if (!$category) {
            return response()->json(['message' => 'Category not found'], 404);
        }
        return response()->json($category);
    }
    public function update(Request $request, $id)
    {
        $category = Category::find($id);
        if (!$category) {
            return response()->json(['message' => 'Category not found'], 404);
        }
        $request->validate([
            'name' => 'sometimes|required|string|max:255|unique:categories,name,' . $id,
            'description' => 'nullable|string',
            'parent_category_id' => 'nullable|exists:categories,id'
        ]);
        $category->update($request->all());

        // If parent_category_id is provided, associate the category with its parent
        if ($request->parent_category_id) {
            $parentCategory = Category::find($request->parent_category_id);
            $parentCategory->children()->save($category);
        } else {
            // Detach from any existing parent if parent_category_id is null 
            $category->parent()->dissociate();
            $category->save();
        }

        return response()->json($category);
    }
    public function destroy($id)
    {
        $category = Category::find($id);
        if (!$category) {
            return response()->json(['message' => 'Category not found'], 404);
        }
        $category->delete();
        return response()->json(['message' => 'Category deleted successfully'], 200);
    }
}
