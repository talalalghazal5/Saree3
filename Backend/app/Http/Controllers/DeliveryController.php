<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreDeliveryRequest;
use App\Models\Delivery;
use App\Models\Order;
use Illuminate\Http\Request;

class DeliveryController extends Controller
{
    /**
     * Create a new delivery for a specific order.
     */
    public function store(StoreDeliveryRequest $request)
    {
        $validated = $request->validated();

        // Fetch the order to check its status
        $order = Order::find($validated['order_id']);

        if ($order->status !== 'pending') {
            return response()->json([
                'message' => 'Delivery can only be created for orders with pending status.'
            ], 400);
        }

        $delivery = Delivery::create([
            'order_id' => $validated['order_id'],
            'name' => $validated['name'],
            'phone_number' => $validated['phone_number'],
            'expected_delivery_time' => $validated['expected_delivery_time'],
            'state' => 'pending',
        ]);

        return response()->json([
            'message' => 'Delivery created successfully.',
            'delivery' => $delivery,
        ], 201);
    }


    /**
     * Mark a delivery as "on the way".
     */
    public function markAsOnTheWay($id)
    {
        $delivery = Delivery::find($id);

        if (!$delivery) {
            return response()->json(['message' => 'Delivery not found'], 404);
        }

        if ($delivery->state !== 'pending') {
            return response()->json(['message' => 'Delivery must be pending to mark as on the way.'], 400);
        }

        // Update delivery and associated order state
        $delivery->update(['state' => 'on_the_way']);

        return response()->json([
            'message' => 'Delivery is on the way.',
            'delivery' => $delivery,
        ], 200);
    }

    /**
     * Mark a delivery as "delivered".
     */
    public function completeDelivery($id)
    {
        $delivery = Delivery::find($id);

        if (!$delivery) {
            return response()->json(['message' => 'Delivery not found'], 404);
        }

        if ($delivery->state !== 'on_the_way') {
            return response()->json(['message' => 'Delivery must be on the way to complete.'], 400);
        }

        // Update delivery and associated order state
        $delivery->update(['state' => 'delivered']);
        $delivery->order->update([
            'status' => 'completed',
            'closed_at' => now()
        ]);

        return response()->json([
            'message' => 'Delivery completed successfully.',
            'delivery' => $delivery,
        ], 200);
    }

    /**
     * Cancel a delivery.
     */
    public function cancelDelivery($id)
    {
        $delivery = Delivery::find($id);

        if (!$delivery) {
            return response()->json(['message' => 'Delivery not found'], 404);
        }

        if ($delivery->state === 'delivered') {
            return response()->json(['message' => 'Delivered delivery cannot be canceled.'], 400);
        }

        // Update delivery and associated order state
        $delivery->update(['state' => 'canceled']);
        $delivery->order->update([
            'status' => 'canceled',
            'closed_at' => now()
        ]);

        return response()->json([
            'message' => 'Delivery canceled successfully.',
            'delivery' => $delivery,
        ], 200);
    }

    /**
     * Reset a delivery to "pending".
     */
    public function resetToPending($id)
    {
        $delivery = Delivery::find($id);

        if (!$delivery) {
            return response()->json(['message' => 'Delivery not found'], 404);
        }

        if ($delivery->state === 'delivered') {
            return response()->json(['message' => 'Delivered delivery cannot be reset to pending.'], 400);
        }

        // Update delivery and associated order state
        $delivery->update(['state' => 'pending']);
        $delivery->order->update([
            'status' => 'pending',
            'closed_at' => null
        ]);

        return response()->json([
            'message' => 'Delivery reset to pending successfully.',
            'delivery' => $delivery,
        ], 200);
    }

    /**
     * Show the details of a specific delivery for the current user's orders.
     */
    public function show(Request $request, $id)
    {
        $userId = $request->user()->id;

        $delivery = Delivery::with('order')
            ->whereHas('order', function ($query) use ($userId) {
                $query->where('user_id', $userId);
            })
            ->find($id);

        if (!$delivery) {
            return response()->json(['message' => 'Delivery not found'], 404);
        }

        return response()->json(['delivery' => $delivery], 200);
    }

    /**
     * List all deliveries for the current user's orders.
     */
    public function index(Request $request)
    {
        $userId = $request->user()->id;

        $deliveries = Delivery::with('order')
            ->whereHas('order', function ($query) use ($userId) {
                $query->where('user_id', $userId);
            })
            ->get();

        return response()->json(['deliveries' => $deliveries], 200);
    }
}
