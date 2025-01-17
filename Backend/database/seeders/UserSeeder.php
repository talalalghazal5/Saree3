<?php

namespace Database\Seeders;

use App\Models\Delivery;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $user = User::factory()->create([
            'name' => 'Test User',
            'phone_number' => getenv('TWILIO_TRIAL_PHONE_NUMBER'),
            'password' => password_hash("password", M_1_PI)
        ]);

        Order::factory(4)->create(['user_id' => $user->id])->each(function ($order) {
            OrderItem::factory()->count(random_int(1, 15))->create(['order_id' => $order->id,]);
        });

        Order::factory(4)->create(['user_id' => $user->id])->each(function ($order) {
            OrderItem::factory()->count(random_int(1, 15))->create(['order_id' => $order->id,]);
            Delivery::factory()->count(1)->create([
                'order_id' => $order->id,
            ]);
        });
    }
}
