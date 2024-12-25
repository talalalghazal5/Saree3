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
            'name' => 'sometimes|required|string|max:255',
            'description' => 'sometimes|required|string',
            'rating' => 'sometimes|required|integer|min:0',
            'price' => 'sometimes|required|integer|min:0',
            'stock_quantity' => 'sometimes|required|integer|min:0',
            'total_rating' => 'sometimes|required|integer|min:0',
            'total_review_count' => 'sometimes|required|integer|min:0',
        ];
    }
}
