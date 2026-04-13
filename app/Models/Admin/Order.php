<?php

namespace App\Models\Admin;

use App\Models\User;
use App\Models\Admin\OrderItem;
use App\Models\Client\Address;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
   public function user()
{
    return $this->belongsTo(User::class);
}

public function voucher()
{
    return $this->belongsTo(Voucher::class);
}

public function orderItems()
{
    return $this->hasMany(OrderItem::class, 'order_id');
}
public function addressBook()
    {
        return $this->belongsTo(Address::class, 'address_books_id');
     
    }
}
