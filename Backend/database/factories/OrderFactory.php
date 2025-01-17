<?php

namespace Database\Factories;

use App\Models\OrderItem;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Order>
 */
class OrderFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $status = $this->faker->randomElement(['pending', 'completed', 'canceled']);
        $closed_at = $status === 'pending' ? null : $this->faker->dateTimeThisYear();

        return [
            'user_id' => User::factory(),
            'total_price' => convertPriceToCents($this->faker->randomFloat(2, 10, 1000)),
            'status' => $status,
            'closed_at' => $closed_at,
        ];
    }
}
