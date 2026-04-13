<?php

namespace App\Models\Admin;

use App\Models\Admin\Voucher;
use Illuminate\Database\Eloquent\Model;

class CategoryVoucher extends Model
{
    //
    protected $table = 'categories_vouchers';
    protected $fillable = ['slug','name'];
    public function vouchers(){
        return $this->hasMany(Voucher::class,'category_id','id');
    }
}
