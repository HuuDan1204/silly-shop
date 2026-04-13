<?php

namespace App\Models\Client;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $table = 'orders';

    protected $fillable = [
        'user_id',
        'name',
        'phone',
        'address',
        'province_code',
        'ward_code',
        'total_amount',
        'final_amount',
        'discount_amount',
        'status',
        'code_order',
        'pay_method',
        'status_pay',
        'notes',
        'shipping_method',
        'shipping_fee',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function items()
    {
        return $this->hasMany(OrderItem::class);
    }

    // public function histories()
    // {
    //     return $this->hasMany(OrderHistory::class);
    // }
}