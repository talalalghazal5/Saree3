<?php

namespace Database\Factories;

use App\Models\Category;
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
            'rating_percentage' => convertRatingToPercentage($this->faker->randomFloat(5, 0, 5)),
            'price' => convertPriceToCents($this->faker->randomFloat(5, 100, 10000)),
            'stock_quantity' => $this->faker->numberBetween(0, 100),
            'total_review_count' => $this->faker->numberBetween(0, 500),
            'category_id' => Category::factory()
        ];
    }
}
