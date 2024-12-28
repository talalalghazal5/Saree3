<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Category::factory(1)->create([
            "parent_category_id" => null
        ]);

        Category::factory(3)->create();

        Category::factory(3)->create()->each(function ($category) {
            Product::factory(30)->create(['category_id' => $category->id]);
        });
        
        Category::factory(3)->create()->each(function ($category) {
            Product::factory(25)->create(['category_id' => $category->id]);
        });
        
        Category::factory(3)->create()->each(function ($category) {
            Product::factory(50)->create(['category_id' => $category->id]);
        });
    }
}
