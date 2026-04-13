<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class Size extends Model
{
    protected $fillable = [
        'size_name'
    ];

    public function variants()
    {
        return $this->hasMany(ProductVariant::class);
    }
}