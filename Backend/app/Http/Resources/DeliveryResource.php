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
        $deliveryStatus = $this->status;
        if($deliveryStatus === 'on_the_way'){
            $deliveryStatus = 'onTheWay';
        }
     
        return [
            'id' => $this->id,
            'orderId' => $this->order_id,
            'name' => $this->name,
            'phoneNumber' => $this->phone_number,
            'expectedDeliveryTime' => $this->expected_delivery_time,
            'status' => $deliveryStatus,
            'order'=> $this->whenLoaded('order', $this->order),
        ];
    }
}
