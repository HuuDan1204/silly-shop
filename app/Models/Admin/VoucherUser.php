<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class VoucherUser extends Model
{
    //
    protected $table = 'vouchers_users';
    protected $fillable = ['user_id','voucher_id','start_date','end_date','is_used'];

public function voucher()
{
    return $this->belongsTo(Voucher::class, 'voucher_id');
}
}
