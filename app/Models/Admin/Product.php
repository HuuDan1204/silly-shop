<?php

namespace App\Models\Admin;

use App\Models\Admin\ProductVariant;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'name', 'slug', 'description','image_url', 'category_id',
        // thêm các field khác nếu có
    ];

    public function category()
    {
        return $this->belongsTo(Category::class,'category_id');
    }

    public function variants()
    {
        return $this->hasMany(ProductVariant::class,'product_id');
    }
  
}