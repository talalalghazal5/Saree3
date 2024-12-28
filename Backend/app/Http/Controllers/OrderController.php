<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    /**
     * Display a listing of all Users Orders.
     */
    public function index(Request $request)
    {
        $orders = $request->user()->orders()->with('orderItems.product')->get();
        return response()->json($orders);
    }

    /**
     * Store a newly created Order in the database.
     */
    public function store(Request $request)
    {
        $order = new Order([
            'user_id' => $request->user()->id,
            'total_price' => 0, // This will be calculated 
            'order_status' => 'pending'
        ]);
        $order->save();

        $totalPrice = 0;
        foreach ($request->items as $item) {
            $orderItem = $this->addNewOrderItemToOrder($order, $item);
            $totalPrice += $orderItem->price;
        }
        $order->update(['total_price' => $totalPrice]);
        return response()->json($order, 201);
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
        return response()->json($order);
    }

    /**
     * Update the specified Order in the database.
     */
    public function update(Request $request, $id)
    {
        $order = $request->user()->orders()->find($id);
        if (!$order) {
            return response()->json(['message' => 'Order not found'], 404);
        }
        if ($order->order_status !== 'pending') {
            return response()->json(['message' => 'Only pending orders can be updated'], 403);
        }

        // Update order items and recalculate total price 
        $totalPrice = 0;
        foreach ($request->items as $item) {
            $orderItem = OrderItem::where('order_id', $order->id)->where('product_id', $item['product_id'])->first();
            if ($orderItem) {
                $orderItem = $this->updateOrderItem($orderItem, $item);
            } else {
                $orderItem = $this->addNewOrderItemToOrder($order, $item);
            }
            $totalPrice += $orderItem->price;
        }
        $order->update(['total_price' => $totalPrice]);
        return response()->json($order);
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

        if ($order->order_status !== 'pending') {
            return response()->json(['message' => 'Only pending orders can be canceled'], 403);
        }

        $order->delete();
        return response()->json(['message' => 'Order canceled successfully'], 200);
    }


    private function addNewOrderItemToOrder(Order $order, OrderItem $item)
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

    private function updateOrderItem(OrderItem $oldItem, OrderItem $newItem)
    {
        $oldItem->quantity = $newItem['quantity'];
        $oldItem->price = $newItem['quantity'] * $oldItem->product->price;
        $oldItem->save();
        return $oldItem;
    }
}
