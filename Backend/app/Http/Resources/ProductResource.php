<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
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
            'name' => $this->name,
            'description' => $this->description,
            'category' => $this->whenLoaded('category', function () {
                return [
                    'id' => $this->category->id,
                    'name' => $this->category->name,
                ];
            }),
            'rating' => $this->rating,
            'price' => $this->price,
            'stockQuantity' => $this->stock_quantity,
            'totalRating' => $this->total_rating,
            'totalReviewCount' => $this->total_review_count,
            'createdAt' => $this->created_at,
        ];
    }
}
