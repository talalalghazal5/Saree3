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
            'rating' => convertRatingToMax5($this->rating_percentage),
            'price' => convertPriceToDollars($this->price),
            'stockQuantity' => $this->stock_quantity,
            'totalReviewCount' => $this->total_review_count,
            'createdAt' => $this->created_at,
        ];
    }
}
