<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class FlashSaleItem extends Model
{
    protected $fillable = [
        'product_variant_id',
        'flash_sale_id',
        'product_id',
        'color_id',
        'size_id',
        'price_at_flash_sale',
        'max_quantity',
        'sold_quantity',
        'stock_quantity',
        'variant_image_url',
        'name',
        'slug'
    ];

    // Flash sale cha
    public function flashSale()
    {
        return $this->belongsTo(FlashSale::class);
    }

    // Product
    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    // Variant
    public function variant()
    {
        return $this->belongsTo(ProductVariant::class, 'product_variant_id');
    }

    // Color
    public function color()
    {
        return $this->belongsTo(Color::class);
    }

    // Size
    public function size()
    {
        return $this->belongsTo(Size::class);
    }

    // % đã bán
    public function percentSold()
    {
        if ($this->max_quantity == 0) return 0;
        return ($this->sold_quantity / $this->max_quantity) * 100;
    }

    // còn hàng không
    public function isAvailable()
    {
        return $this->stock_quantity > 0
            && $this->sold_quantity < $this->max_quantity;
    }
}