<?php

namespace Database\Factories;

use App\Models\Category;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Category>
 */
class CategoryFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $categoies = Category::pluck('id')->toArray();

        return [
            "name" => $this->faker->unique()->word,
            "description" => $this->faker->sentence,
            'parent_category_id' => $this->faker->optional()->randomElement($categoies),
        ];
    }
}
