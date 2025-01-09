<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class OrderResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'userId' => $this->user_id,
            'totalPrice' => convertPriceToDollars($this->total_price),
            'orderStatus' => $this->status,
            'createdAt'=> $this->created_at,
            'closedAt' => $this->closed_at,
            'orderItems' => OrderItemResource::collection($this->whenLoaded('orderItems'))
        ];
    }
}
