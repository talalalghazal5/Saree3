<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vendor extends Model
{
    /** @use HasFactory<\Database\Factories\VendorFactory> */
    use HasFactory;

    protected $fillable = [
        'user_id',
        'name',
        'description',
        'total_rating',
        'contact_number',
        'address',
        'email',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    
    public function products()
    {
        return $this->hasMany(Product::class);
    }
}
