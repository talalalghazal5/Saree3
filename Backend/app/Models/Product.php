<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    /** @use HasFactory<\Database\Factories\ProductFactory> */
    use HasFactory;
    protected $fillable = [
        'name',
        'description',
        'category_id',
        'rating_percentage',
        'price',
        'stock_quantity',
        'total_review_count',
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }
}
