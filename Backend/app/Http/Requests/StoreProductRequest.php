<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreProductRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        //todo add authorization for admin/owner only
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'name' => 'required|string|max:255',
            'description' => 'required|string',
            'category_id' => 'required|integer|exists:categories,id',
            'vendor_id' => 'required|exists:vendors,id',
            'total_rating' => 'required|integer|min:0',
            'price' => 'required|integer|min:0',
            'stock_quantity' => 'required|integer|min:0',
            'total_review_count' => 'required|integer|min:0',
        ];
    }

    protected function prepareForValidation(): void
    {
        $this->merge([
            'category_id' => $this->categoryId,
            'vendor_id' => $this->vendorId,
            'total_rating' => convertRatingToPercentage($this->rating),
            'stock_quantity' => $this->stockQuantity,
            'total_review_count' => $this->totalReviewCount,
            'price' => convertPriceToCents($this->price),
        ]);
        
    }
}
