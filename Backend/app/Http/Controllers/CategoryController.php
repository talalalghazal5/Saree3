<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreCategoryRequest;
use App\Http\Requests\UpdateCategoryRequest;
use App\Http\Resources\CategoryResource;
use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function index(Request $request)
    {
        $categories = Category::query()->with(['children', 'parent']);
        $perPage = $request->input('per_page', 10);
        $categories = $categories->paginate($perPage);

        return CategoryResource::collection($categories);
    }
    public function store(StoreCategoryRequest $request)
    {
        $category = Category::create($request->all());

        // If parent_category_id is provided, associate the category with its parent
        if ($request->parent_category_id) {
            $parentCategory = Category::find($request->parent_category_id);
            $parentCategory->children()->save($category);
        }

        return new CategoryResource($category);
    }
    public function show($id)
    {
        $category = Category::with(['children', 'parent'])->findOrFail($id);
        if (!$category) {
            return response()->json(['message' => 'Category not found'], 404);
        }

        return new CategoryResource($category);
    }
    public function update(UpdateCategoryRequest $request, $id)
    {
        $category = Category::find($id);
        if (!$category) {
            return response()->json(['message' => 'Category not found'], 404);
        }

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

        return new CategoryResource($category);
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
