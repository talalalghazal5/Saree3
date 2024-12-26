<?php

namespace Database\Seeders;

use App\Models\Category;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Product;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Product::factory()->count(10)->create();
        
        Category::factory(3)->create()->each(function ($category) {
            Product::factory(30)->create(['category_id' => $category->id]);
        });
        
        Category::factory(3)->create()->each(function ($category) {
            Product::factory(40)->create(['category_id' => $category->id]);
        });
        
        Category::factory(3)->create()->each(function ($category) {
            Product::factory(50)->create(['category_id' => $category->id]);
        });
    }
}
