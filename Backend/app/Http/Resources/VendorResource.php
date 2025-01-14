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
            'user' => new UserResource($this->whenLoaded('user')),
            'name' => $this->name,
            'description' => $this->description,
            'totalRating' => convertRatingToMax5($this->total_rating),
            'totalReviewCount' => $this->total_review_count,
            'contactNumber' => $this->contact_number,
            'address' => $this->address,
            'email' => $this->email,
            'products' => ProductResource::collection($this->whenLoaded('products')),
        ];
    }
}
