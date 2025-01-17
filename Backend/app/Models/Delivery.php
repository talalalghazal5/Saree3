<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Delivery extends Model
{
    use HasFactory;

    protected $fillable = [
        'order_id',
        'name',
        'phone_number',
        'expected_delivery_time',
        'state'
    ];

    public function order()
    {
        return $this->belongsTo(Order::class);
    }
}
