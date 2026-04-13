<?php

namespace App\Models\Client;

use App\Models\User;
use Illuminate\Database\Eloquent\Model;

class Address extends Model
{
   protected $table = 'address_books';
   protected $fillable = [
        'user_id', 'name', 'address', 'phone', 'province_code', 'ward_code'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
