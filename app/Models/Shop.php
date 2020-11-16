<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Bavix\Wallet\Traits\HasWallet;
use Bavix\Wallet\Interfaces\Wallet;
class Shop extends Model implements Wallet
{
    use HasWallet;
    protected $fillable=['name','description','logo','banner','contact_name','contact_phone','cert'];

    public function user(){
        return $this->belongsTo(User::class);
    }
}
