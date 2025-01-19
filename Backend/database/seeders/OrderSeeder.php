<?php

namespace Database\Seeders;

use App\Models\Delivery;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class OrderSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Order::factory(3)->create()->each(function ($order) {
            if ($order->status === 'pending') {
                rand(0, 1) > 0.5 ? $deliveryStatus = $order->status : $deliveryStatus = 'on_the_way';
            } else if ($order->status === 'completed') {
                $deliveryStatus = 'delivered';
            } else {
                $deliveryStatus = $order->status;
            }

            OrderItem::factory()->count(5)->create(['order_id' => $order->id,]);
            Delivery::factory()->count(1)->create([
                'order_id' => $order->id,
                'status' => $deliveryStatus,
            ]);
        });

        Order::factory(2)->create()->each(function ($order) {
            OrderItem::factory()->count(5)->create(['order_id' => $order->id,]);
        });
    }
}
