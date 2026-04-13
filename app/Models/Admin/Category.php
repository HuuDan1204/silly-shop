<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'name',
        'image',
        'status'
    ];

    // sản phẩm
    public function products()
    {
        return $this->hasMany(Product::class);
    }
        public function getImageUrlAttribute()
    {
        return $this->image
            ? asset('storage/' . $this->image)
            : 'https://via.placeholder.com/150?text=No+Image';
    }

}