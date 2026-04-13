<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Province extends Model
{
    protected $table = 'provinces';

    protected $primaryKey = 'province_code';   // quan trọng
    public $incrementing = false;              // vì province_code không phải auto increment
    protected $keyType = 'string';

    protected $fillable = ['province_code', 'name', 'short_name', 'code', 'place_type', 'country'];
}