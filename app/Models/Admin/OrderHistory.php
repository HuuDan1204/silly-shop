<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class OrderHistory extends Model
{
    protected $table = 'order_histories';
    protected $fillable = ['order_id',
                'from_status',
                'to_status',
                'note',
                'time_action',
                'users',
                'content'
            ];

            public function user()
{
    return $this->belongsTo(\App\Models\User::class, 'users');   // ← SỬA THÀNH App\Models\User
}
}
