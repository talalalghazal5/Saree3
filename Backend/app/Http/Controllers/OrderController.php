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
use Illuminate\Support\Facades\DB;

class OrderController extends Controller
{
    /**
     * Display a listing of all Users Orders.
     */
    public function index(Request $request)
    {
        $orders = $request->user()->orders()->with('orderItems.product')
            ->where('cleared_at', null)
            ->get();

        return response()->json(OrderResource::collection($orders));
    }

    /**
     * Store a newly created Order in the database.
     */
    public function store(StoreOrderRequest $request)
    {
        DB::beginTransaction(); // Start a transaction

        try {
            $order = new Order([
                'user_id' => $request->user()->id,
                'status' => 'pending',
                'total_price' => 0, // This will be calculated
            ]);
            $order->save();

            $totalPrice = 0;
            foreach ($request->items as $item) {
                $product = Product::find($item['product_id']);
                if (!$product) {
                    throw new \Exception("Product with ID {$item['product_id']} not found.");
                }

                if (!$this->validateSufficientStock($product, $item['quantity'])) {
                    throw new \Exception("Insufficient stock for product {$product->name}.");
                }

                $orderItem = $this->addNewOrderItemToOrder($order, $item);
                $totalPrice += $orderItem->price;

                // Deduct stock
                $product->decrement('stock_quantity', $item['quantity']);
            }

            // Update the total price
            $order->update(['total_price' => $totalPrice]);

            DB::commit(); // Commit the transaction

            return response()->json(new OrderResource($order), 201);
        } catch (\Exception $e) {
            DB::rollBack(); // Roll back the transaction

            return response()->json([
                'error' => 'Order creation failed',
                'message' => $e->getMessage(),
            ], 400);
        }
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

        $totalPrice = 0;
        // Get the list of product IDs from the request
        $updatedProductIds = collect($request->items)->pluck('product_id')->toArray();

        // Restore stock for items not in the updated list
        $order->orderItems()
            ->whereNotIn('product_id', $updatedProductIds)
            ->get()
            ->each(function ($orderItem) {
                $orderItem->product->increment('stock_quantity', $orderItem->quantity);
                $orderItem->delete();
            });

        // Update or create order items
        foreach ($request->items as $item) {
            $product = Product::find($item['product_id']);
            if (!$product) {
                return $this->productNotFoundResponse($item['product_id']);
            }

            $orderItem = $order->orderItems()->where('product_id', $item['product_id'])->first();

            if ($orderItem) {
                // Calculate the stock difference
                $stockDifference = $orderItem->quantity - $item['quantity'];

                // Validate stock BEFORE modifying it
                if ($stockDifference < 0 && !$this->validateSufficientStock($product, $stockDifference)) {
                    return $this->insufficientStockResponse($product);
                }

                // Adjust stock based on the new quantity
                $product->increment('stock_quantity', $stockDifference);
                $orderItem = $this->updateOrderItem($orderItem, $item);
            } else {
                if (!$this->validateSufficientStock($product, $item['quantity'])) {
                    return $this->insufficientStockResponse($product);
                }

                $orderItem = $this->addNewOrderItemToOrder($order, $item);
                $product->decrement('stock_quantity', $item['quantity']);
            }

            $totalPrice += $orderItem->price;
        }

        $order->load('orderItems.product');
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

    private function validateSufficientStock(Product $product, int $quantity)
    {
        return $product->stock_quantity >= $quantity;
    }

    private function insufficientStockResponse(Product $product)
    {
        return response()->json([
            'error' => 'Insufficient Stock',
            'message' => "The requested quantity for {$product->name} is not available.",
        ], 400);
    }

    private function productNotFoundResponse($productId)
    {
        return response()->json([
            'error' => 'Product Not Found',
            'message' => "Product with ID {$productId} does not exist.",
        ], 404);
    }
}
