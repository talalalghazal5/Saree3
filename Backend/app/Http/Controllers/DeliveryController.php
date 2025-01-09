<?php

namespace App\Http\Controllers;

use App\Models\Delivery;
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

     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Delivery $delivery)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Delivery $delivery)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Delivery $delivery)
    {
        //
    }
}
