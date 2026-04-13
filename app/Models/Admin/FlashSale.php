<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class FlashSale extends Model
{
    protected $fillable = [
        'start_date',
        'end_date',
        'status',
        'discount',
        'slot_time',
        'user_id'
    ];

    // Quan hệ: 1 flash sale có nhiều item
    public function items()
    {
        return $this->hasMany(FlashSaleItem::class);
    }

    // Check đang active
    public function isActive()
    {
        return $this->status === 'active'
            && now()->between($this->start_date, $this->end_date);
    }
}