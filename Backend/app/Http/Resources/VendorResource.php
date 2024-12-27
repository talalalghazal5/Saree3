<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class VendorResource extends JsonResource
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
            'user_id' => $this->user_id,
            'name' => $this->name,
            'description' => $this->description,
            'total_rating' => $this->total_rating,
            'total_review_count' => $this->total_review_count,
            'contact_number' => $this->contact_number,
            'address' => $this->address,
            'email' => $this->email,
            'products' => ProductResource::collection($this->whenLoaded('products')),
        ];
    }
}
