<?php

namespace App\Models\Admin;

use App\Models\Admin\Color;
use App\Models\Admin\Size;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductVariant extends Model
{
    use HasFactory;
    protected $table ='product_variants';
  protected $fillable = [
        'product_id',
        'color_id',
        'size_id',
        'name',
        'variant_image_url',
        'import_price',
        'listed_price',
        'sale_price',
        'stock',
        'initial_stock',
        'is_show'
];


    public function product()
    {
        return $this->belongsTo(Product::class,'product_id');
    }

    public function color()
    {
        return $this->belongsTo(Color::class,'color_id');
    }

    public function size()
    {
        return $this->belongsTo(Size::class,'size_id');
    }
   
}