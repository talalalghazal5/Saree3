<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateProductRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
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
            'name' => 'sometimes|required|string|max:255',
            'description' => 'sometimes|required|string',
            'category_id' => 'sometimes|required|integer|exists:categories,id',
            'vendor_id' => 'sometimes|required|exists:vendors,id',
            'total_rating' => 'sometimes|required|integer|min:0',
            'price' => 'sometimes|required|integer|min:0',
            'stock_quantity' => 'sometimes|required|integer|min:0',
            'total_review_count' => 'sometimes|required|integer|min:0',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ];
    }

    protected function prepareForValidation(): void
    {
        /**
         * $request->input('field_name') ?: null: 
         * 
         * Checks if the field is present in the request.
         *  If the field is not present, it sets it to null,
         *  which will be filtered out by array_filter
         */
        $this->merge(array_filter([
            'category_id' => $this->categoryId ?: null,
            'vendor_id' => $this->vendorId ?: null,
            'total_rating' => convertRatingToPercentage($this->rating) ?: null,
            'stock_quantity' => $this->stockQuantity ?: null,
            'total_review_count' => $this->totalReviewCount ?: null,
            'price' => convertPriceToCents($this->price) ?: null,
        ]));
    }
}
