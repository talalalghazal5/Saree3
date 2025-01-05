<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreOrderRequest;
use App\Http\Requests\UpdateOrderRequest;
use App\Http\Resources\OrderResource;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use Date;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    /**
     * Display a listing of all Users Orders.
     */
    public function index(Request $request)
    {
        $orders = $request->user()->orders()->with('orderItems.product')
            ->where(['cleared_at' => null])
            ->get();

        return response()->json(OrderResource::collection($orders));
    }

    /**
     * Store a newly created Order in the database.
     */
    public function store(StoreOrderRequest $request)
    {
        $order = new Order([
            'user_id' => $request->user()->id,
            'total_price' => 0, // This will be calculated 
        ]);
        $order->save();

        $totalPrice = 0;
        foreach ($request->items as $item) {
            $orderItem = $this->addNewOrderItemToOrder($order, $item);
            $totalPrice += $orderItem->price;
        }
        $order->update(['total_price' => $totalPrice]);
        return response()->json(new OrderResource($order), 201);
    }

    /**
     * Display the specified Order.
     */
    public function show(Request $request, $id)
    {
        $order = $request->user()->orders()->with('orderItems.product')->find($id);
        if (!$order) {
            return response()->json(['message' => 'Order not found'], 404);
        }
        return response()->json(new OrderResource($order), 200);
    }

    /**
     * Update the specified Order in the database.
     */
    public function update(UpdateOrderRequest $request, $id)
    {
        $order = $request->user()->orders()->with('orderItems.product')->find($id);
        if (!$order) {
            return response()->json(['message' => 'Order not found'], 404);
        }
        if ($order->status !== 'pending') {
            return response()->json(['message' => 'Only pending orders can be updated'], 403);
        }

        // Update order items and recalculate total price 

        $totalPrice = 0;
        // Get the list of product IDs from the request
        $updatedProductIds = collect($request->items)->pluck('product_id')->toArray();

        // Delete items that are in the order but not in the request
        $order->orderItems()
            ->whereNotIn('product_id', $updatedProductIds)
            ->delete();

        // Update or create order items
        foreach ($request->items as $item) {
            $orderItem = $order->orderItems()->where('product_id', $item['product_id'])->first();

            if ($orderItem) {
                // Update existing order item
                $orderItem = $this->updateOrderItem($orderItem, $item);
            } else {
                // Add new order item
                $orderItem = $this->addNewOrderItemToOrder($order, $item);
            }

            $totalPrice += $orderItem->price;
        }
        $order->load('orderItems.product');

        // Update the total price of the order
        $order->update(['total_price' => $totalPrice]);

        return response()->json(new OrderResource($order), 200);
    }

    /**
     * Cancel pending Order and remove it from the database.
     */
    public function cancel(Request $request, $id)
    {
        $order = $request->user()->orders()->find($id);
        if (!$order) {
            return response()->json(['message' => 'Order not found'], 404);
        }
        if ($order->status !== 'pending') {
            return response()->json(['message' => 'Only pending orders can be canceled'], 403);
        }

        $order->update([
            'status' => 'canceled',
            'closed_at' => Date::now()
        ]);

        return response()->json(['message' => 'Order canceled successfully'], 200);
    }


    private function addNewOrderItemToOrder(Order $order, array $item)
    {
        $product = Product::find($item['product_id']);
        $orderItem = new OrderItem([
            'order_id' => $order->id,
            'product_id' => $product->id,
            'quantity' => $item['quantity'],
            'price' => $item['quantity'] * $product->price
        ]);
        $orderItem->save();
        return $orderItem;
    }

    private function updateOrderItem(OrderItem $oldItem, array $newItem)
    {
        $oldItem->quantity = $newItem['quantity'];
        $oldItem->price = $newItem['quantity'] * $oldItem->product->price;
        $oldItem->save();
        return $oldItem;
    }

    /**
     * Clears the user history by giving a value to cleared_at column
     */
    public function clearHistory(Request $request)
    {
        $request->user()->orders()->update(['cleared_at' => now()]);

        return response()->json(['message' => 'Order history cleared successfully'], 200);
    }
}
