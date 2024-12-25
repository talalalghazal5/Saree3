<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Faker\Factory as FakerFactory;
use \Bezhanov\Faker\Provider\Commerce;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {

        $faker = FakerFactory::create();
        $faker->addProvider(new Commerce($faker));

        return [
            'name' => $faker->productName,
            'description' => $this->faker->paragraph,
            'rating' => $this->faker->numberBetween(0, 5),
            'price' => $this->faker->numberBetween(100, 10000),
            'stock_quantity' => $this->faker->numberBetween(0, 100),
            'total_rating' => $this->faker->numberBetween(0, 1000),
            'total_review_count' => $this->faker->numberBetween(0, 500),
        ];
    }
}
