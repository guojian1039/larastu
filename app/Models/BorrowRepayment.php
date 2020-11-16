<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BorrowRepayment extends Model
{
    protected $fillable=['batch','borrow_id','borrow_user_id',
        'borrow_invest_id','borrow_invest_user_id',
        'help_uid','capital','interest','receive_capital',
        'receive_interest','receive_overdue','status','deadline','repayment_time'
        ];
    const STATUS_PROCCESSING='proccessing';//还款中，还未还
    const STATUS_COMPLETED='completed';//已还完
    const STATUS_TRANSFERED='transfered';//已转让
    const STATUS_FORWARDFINISH='forward_finish';//提前完成

    public static $statusMap=[
        self::STATUS_PROCCESSING => '还款中',
        self::STATUS_COMPLETED => '已还完',
        self::STATUS_TRANSFERED => '已转让',
        self::STATUS_FORWARDFINISH=>'提前完成',
    ];
    public function borrow(){
        return $this->belongsTo(Borrow::class);
    }
    public function borrowInvest(){
        return $this->belongsTo(BorrowInvest::class);
    }
}
