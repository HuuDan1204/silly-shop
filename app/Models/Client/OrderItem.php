<?php

namespace App\Models\Client;

use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    protected $table = 'order_items';

    protected $fillable = [
        'order_id',
        'product_variant_id',
        'product_id',
        'product_name',
        'product_image_url',
        'import_price',
        'listed_price',
        'sale_price',
        'quantity',
        'promotion_type',
        'size_name',
        'color_name',
    ];

    public function order()
    {
        return $this->belongsTo(Order::class);
    }
}