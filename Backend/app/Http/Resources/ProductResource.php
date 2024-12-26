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
            'stock_quantity' => $this->stock_quantity,
            'total_rating' => $this->total_rating,
            'total_review_count' => $this->total_review_count,
            'created_at' => $this->created_at,
        ];
    }
}
