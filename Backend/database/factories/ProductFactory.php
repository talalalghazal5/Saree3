<?php

namespace Database\Factories;

use App\Models\Category;
use App\Models\Vendor;
use Illuminate\Database\Eloquent\Factories\Factory;
use Faker\Factory as FakerFactory;
use \Bezhanov\Faker\Provider\Commerce;
use Illuminate\Support\Facades\Storage;

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

        // Assuming you have a dataset of images in the 'public/products' folder
        // If you have a directory containing image files, you can select one randomly.
        $imageFile = $this->getRandomImagePath();

        return [
            'name' => $faker->productName,
            'description' => $this->faker->paragraph,
            'total_rating' => convertRatingToPercentage($this->faker->randomFloat(5, 0, 5)),
            'price' => convertPriceToCents($this->faker->randomFloat(5, 100, 10000)),
            'stock_quantity' => $this->faker->numberBetween(0, 100),
            'total_review_count' => $this->faker->numberBetween(0, 500),
            'category_id' => Category::factory(),
            'vendor_id' => Vendor::factory(),
            'image_path' => $imageFile,
        ];
    }

    /**
     * Get a random image from the products folder (assuming the images are in storage/app/public/products).
     */
    private function getRandomImagePath()
    {
        // Get a list of all images in the public/products folder (you can adjust the folder path)
        $imageFiles = Storage::disk('public')->files('products');

        if (empty($imageFiles)) {
            return null;
        }

        // Pick a random image file from the array
        $imageFile = $imageFiles[array_rand($imageFiles)];

        return $imageFile; // Store image path relative to public disk
    }
}
