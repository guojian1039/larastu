<?php

namespace App\Models;

use App\Models\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class UserInvoice extends Model
{
    use DefaultDatetimeFormat;
    protected $fillable=['title','duty_paragraph','opening_bank','address','content','is_default','type','user_id'];
    public function user(){
        return $this->belongsTo(User::class);
    }
}
