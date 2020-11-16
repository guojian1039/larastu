<?php

namespace App\Models;

use App\Models\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class OrderInvoice extends Model
{
    use DefaultDatetimeFormat;
    protected $fillable=['order_sn','username','title','duty_paragraph','opening_bank','address','content','tax_money','type','status'];

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function order(){
        return $this->belongsTo(Order::class);
    }
}
