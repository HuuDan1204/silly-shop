<?php

namespace App\Models\Admin;

use App\Models\User;
use Illuminate\Database\Eloquent\Model;

class Voucher extends Model
{
        protected $table = 'vouchers';
    protected $fillable = ['code','type_discount','value','block','image','start_date','end_date','used','received','max_used','min_order_value','status','category_id','max_discount'];
   
    public function cate_Voucher()
    {
        return $this->belongsTo(CategoryVoucher::class, 'category_id', 'id');
    }
    public function users()
{
    return $this->belongsToMany(User::class, 'vouchers_users')
                ->withPivot('status', 'is_used', 'issued_date')
                ->withTimestamps();
}
}
