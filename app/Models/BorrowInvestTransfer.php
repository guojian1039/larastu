<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BorrowInvestTransfer extends Model
{
    const STATUS_PENDING='pending';
    const STATUS_TRANSFERRING='transferring';
    const STATUS_FAIL='fail';//投资流标
    const STATUS_FULLBID='full_bid';
    const STATUS_REDEALFAIL='redeal_fail';
    const STATUS_REDEALSUCCESS='redeal_success';
    const STATUS_COMPLETED='completed';
    const STATUS_FORWARDFINISH='forward_finish';

    public static $statusMap=[
        self::STATUS_PENDING    => '初审中',
        self::STATUS_TRANSFERRING    => '初审通过转让中',
        self::STATUS_FAIL => '投资流标',
        self::STATUS_FULLBID => '标满，复审中',
        self::STATUS_REDEALFAIL    => '复审未通过',
        self::STATUS_REDEALSUCCESS    => '复审通过，还款中',
        self::STATUS_COMPLETED=>'已还完',
        self::STATUS_FORWARDFINISH=>'提前还完',
    ];
    protected $fillable=[
        'repayment_times','borrow_invest_id','borrow_invest_user_id','status',
        'transfer_money','transfer_day','transfer_rate','deal_id',
        'deal_name','deal_info','deal_time','redeal_id','redeal_name','redeal_info','redeal_time',
        ];
    protected $dates=['deal_time','redeal_time'];
    public function borrow(){
        return $this->belongsTo(Borrow::class);
    }

    public function borrowInvest(){
        return $this->belongsTo(BorrowInvest::class);
    }
}
