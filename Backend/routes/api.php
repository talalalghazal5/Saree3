<?php

use App\Http\Controllers\ProductController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\SearchController;
use App\Http\Controllers\VendorController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware(['auth:sanctum']);

// Product
Route::get('products', [ProductController::class, 'index']);
Route::post('products', [ProductController::class, 'store'])->middleware(['auth:sanctum']);
Route::get('products/{id}', [ProductController::class, 'show']);
Route::put('products/{id}', [ProductController::class, 'update'])->middleware(['auth:sanctum']);
Route::delete('products/{id}', [ProductController::class, 'destroy'])->middleware(['auth:sanctum']);

// Category
Route::get('categories', [CategoryController::class, 'index']);
Route::post('categories', [CategoryController::class, 'store'])->middleware(['auth:sanctum']);
Route::get('categories/{id}', [CategoryController::class, 'show']);
Route::put('categories/{id}', [CategoryController::class, 'update'])->middleware(['auth:sanctum']);
Route::delete('categories/{id}', [CategoryController::class, 'destroy'])->middleware(['auth:sanctum']);

// Vendor
Route::get('/vendors', [VendorController::class, 'index']);
Route::post('/vendors', [VendorController::class, 'store'])->middleware(['auth:sanctum']);
Route::get('/vendors/{id}', [VendorController::class, 'show']);
Route::put('/vendors/{id}', [VendorController::class, 'update'])->middleware(['auth:sanctum']);
Route::delete('/vendors/{id}', [VendorController::class, 'destroy'])->middleware(['auth:sanctum']);

// Search
Route::get('/search', [SearchController::class, 'search']);

// Order
Route::middleware(['auth:sanctum'])->group(function () {
    Route::get('/myorders', [OrderController::class, 'index']);
    Route::post('/myorders', [OrderController::class, 'store']);
    Route::get('/myorders/{id}', [OrderController::class, 'show']);
    Route::put('/myorders/{id}', [OrderController::class, 'update']);
    Route::post('/myorders/{id}/cancel', [OrderController::class, 'cancel']);
    Route::post('/myorders/clearhistory', [OrderController::class, 'clearHistory']);
});
