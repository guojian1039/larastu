<?php
/**
 * Created by PhpStorm.
 * User: jian
 * Date: 2020-09-21
 * Time: 17:00
 */

namespace App\Models;


use App\Models\Traits\DefaultDatetimeFormat;

class Transaction extends \Bavix\Wallet\Models\Transaction
{
    use DefaultDatetimeFormat;
    public const TYPE_USERPAYABLE = 'App\Models\User';
    public const TYPE_SHOPPAYABLE = 'App\Models\Shop';
    public const TYPE_ORDERPAYABLE = 'App\Models\Order';
}