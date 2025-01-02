<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateVendorRequest extends FormRequest
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
            'description' => 'nullable|string',
            'total_rating' => 'sometimes|required|integer|min:0|max:500',
            'contact_number' => 'nullable|string|max:255',
            'address' => 'nullable|string|max:255',
            'email' => 'nullable|string|email|max:255',
        ];
    }
}
