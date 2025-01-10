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
            'categoryId'=> $this->whenLoaded('category', $this->category->id),
            'categoryName'=> $this->whenLoaded('category', $this->category->name),
            'vendorId'=> $this->whenLoaded('vendor', $this->vendor->id),
            'vendorName'=> $this->whenLoaded('vendor', $this->vendor->name),
            'rating' => convertRatingToMax5($this->total_rating),
            'price' => convertPriceToDollars($this->price),
            'stockQuantity' => $this->stock_quantity,
            'totalReviewCount' => $this->total_review_count,
            'createdAt' => $this->created_at,
        ];
    }
}
