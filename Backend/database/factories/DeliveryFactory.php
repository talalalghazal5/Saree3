<?php

namespace Database\Factories;

use App\Models\Order;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Delivery>
 */
class DeliveryFactory extends Factory
{
    /**
     * Define the model's default status.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'order_id' => Order::factory(),
            'name' => $this->faker->name(),
            'phone_number' => $this->faker->phoneNumber(),
            'expected_delivery_time' => $this->faker->dateTimeBetween('+1 days', '+7 days'),
            'status' => $this->faker->randomElement(['pending', 'on_the_way', 'delivered', 'canceled']),
        ];
    }
}
