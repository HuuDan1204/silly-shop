<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    protected $table = 'order_items';

    protected $fillable = [
        'order_id',
        'product_variant_id',
        'flash_sale_items_id',
        'product_id',
        'product_name',
        'product_image_url',
        'import_price',
        'listed_price',
        'sale_price',
        'quantity',
        'promotion_type',
        'color_name',
        'size_name'
    ];

    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    public function productVariant()
    {
        return $this->belongsTo(ProductVariant::class, 'product_variant_id');
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
