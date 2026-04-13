<?php

namespace App\Models\Client;

use App\Models\Admin\Product;
use App\Models\Admin\ProductVariant;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;

    protected $table = 'carts';

    protected $fillable = [
        'user_id',
        'product_variants_id',
        'flash_sale_items_id',
        'product_name',
        'product_image_url',
        'quantity',
        'price_at_time',
        'promotion_type',
    ];

    /**
     * Liên kết với ProductVariant
     */
    public function productVariant()
    {
        return $this->belongsTo(ProductVariant::class, 'product_variants_id', 'id');
    }

    /**
     * Liên kết với Product (qua biến thể)
     */
    public function product()
    {
        return $this->hasOneThrough(
            Product::class,
            ProductVariant::class,
            'id',                    // Foreign key trên product_variants
            'id',                    // Foreign key trên products
            'product_variants_id',   // Local key trên carts
            'product_id'             // Local key trên product_variants
        );
    }

    /**
     * Liên kết với User
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}