<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class Color extends Model
{
    protected $fillable = [
        'color_name',
        'color_code'
    ];

    public function variants()
    {
        return $this->hasMany(ProductVariant::class);
    }
}