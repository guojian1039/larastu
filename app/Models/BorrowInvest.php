<?php

namespace App\Models;

use App\Models\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class BorrowInvest extends Model
{
    use DefaultDatetimeFormat;
    const STATUS_FREEZE='freeze';//投资冻结中
    const STATUS_FAIL='fail';//投资流标
    const STATUS_PROCCESSING='proccessing';//还款中，投资中
    const STATUS_COMPLETED='completed';//全部已还完
    const STATUS_TRANSFERRING='transferring';//转让中
    const STATUS_TRANSFERED='transfered';//已转让
    const STATUS_FORWARDFINISH='forward_finish';//提前完成

    public static $statusMap=[
        self::STATUS_FREEZE    => '投资冻结中',
        self::STATUS_FAIL    => '投资流标',
        self::STATUS_PROCCESSING => '还款中',
        self::STATUS_COMPLETED => '已还完',
        self::STATUS_TRANSFERRING => '转让中',
        self::STATUS_TRANSFERED    => '已转让',
        self::STATUS_FORWARDFINISH=>'提前完成',
    ];

    protected $fillable=[
        'borrow_user_id','status',
        'parent_id','transfer_id','invest_sum','capital',
        'interest','receive_capital','receive_interest','receive_overdue'];

    public function user(){
        return $this->belongsTo(User::class);
    }
    public function borrow(){
        return $this->belongsTo(Borrow::class);
    }

}
