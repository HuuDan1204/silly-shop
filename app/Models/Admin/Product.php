<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'category_id',
        'name',
        'slug',
        'description',
        'image',
        'price',
        'stock',
        'status',
    ];

    protected $casts = [
        'status' => 'boolean',
        'price'  => 'decimal:2',
        'stock'  => 'integer',
    ];

    protected static function booted()
    {
        static::creating(function ($product) {
            $product->slug = Str::slug($product->name);
        });

        static::updating(function ($product) {
            if ($product->isDirty('name')) {
                $product->slug = Str::slug($product->name);
            }
        });
    }

    // Quan hệ với danh mục
    public function category()
    {
        return $this->belongsTo(\App\Models\Admin\Category::class);
    }

    // Accessor ảnh
    public function getImageUrlAttribute()
    {
        return $this->image
            ? asset('storage/' . $this->image)
            : 'https://via.placeholder.com/150?text=No+Image';
    }
}