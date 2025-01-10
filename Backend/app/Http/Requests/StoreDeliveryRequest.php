<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreDeliveryRequest extends FormRequest
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
            'orderId' => 'required|exists:orders,id|unique:deliveries,order_id',
            'name' => 'required|string|max:255',
            'phoneNumber' => 'required|string|max:15',
            'expectedDeliveryTime' => 'required|date|after:now',
        ];
    }
}
