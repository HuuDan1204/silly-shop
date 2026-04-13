<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Ward extends Model
{
    protected $table = 'wards';
    protected $primaryKey = 'ward_code';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = ['ward_code', 'name', 'province_code'];
}