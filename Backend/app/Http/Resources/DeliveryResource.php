<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class DeliveryResource extends JsonResource
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
            'orderId' => $this->order_id,
            'name' => $this->name,
            'phoneNumber' => $this->phone_number,
            'expectedDeliveryTime' => $this->expected_delivery_time,
            'state' => $this->state
        ];
    }
}
