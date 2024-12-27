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
            'total_rating' => $this->faker->numberBetween(1,500), //todo update with helper function
            'contact_number' => $this->faker->phoneNumber,
            'address' => $this->faker->address,
            'email' => $this->faker->companyEmail,
        ];
    }
}
