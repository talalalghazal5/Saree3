<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Vendor>
 */
class VendorFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'user_id' => User::factory(),
            'name' => $this->faker->company,
            'description' => $this->faker->paragraph,
            'total_rating' => convertRatingToPercentage($this->faker->randomFloat(5, 0, 5)),
            'total_review_count' => $this->faker->numberBetween(0, 500),
            'contact_number' => $this->faker->phoneNumber,
            'address' => $this->faker->address,
            'email' => $this->faker->companyEmail,
        ];
    }
}
