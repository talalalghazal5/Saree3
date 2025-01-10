<?php

namespace App\Http\Controllers;

use App\Models\Delivery;
use App\Models\Order;
use Illuminate\Http\Request;

class DeliveryController extends Controller
{
    /**
     * Create a new delivery for a specific order.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'order_id' => 'required|exists:orders,id|unique:deliveries,order_id',
            'name' => 'required|string|max:255',
            'phone_number' => 'required|string|max:15',
            'expected_delivery_time' => 'required|date|after:now',
        ]);

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
    public function completeDelivery(Request $request, $id)
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
        $delivery->order->update(['status' => 'completed']);

        return response()->json([
            'message' => 'Delivery completed successfully.',
            'delivery' => $delivery,
        ], 200);
    }

    /**
     * Cancel a delivery.
     */
    public function cancelDelivery(Request $request, $id)
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
        $delivery->order->update(['status' => 'canceled']);

        return response()->json([
            'message' => 'Delivery canceled successfully.',
            'delivery' => $delivery,
        ], 200);
    }

    /**
     * Reset a delivery to "pending".
     */
    public function resetToPending(Request $request, $id)
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
        $delivery->order->update(['status' => 'pending']);

        return response()->json([
            'message' => 'Delivery reset to pending successfully.',
            'delivery' => $delivery,
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Delivery $delivery)
    {
        //
    }
}
