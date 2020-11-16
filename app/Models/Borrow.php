<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Borrow extends Model
{
    use \App\Models\Traits\DefaultDatetimeFormat;
    /*
    const TYPE_CREDIT='credit';
    const TYPE_VOUCH='vouch';
    const TYPE_PLEDGE='pledge';

    public static $typeMap=[
        self::TYPE_CREDIT    => '信用标',
        self::TYPE_VOUCH    => '担保标',
        self::TYPE_PLEDGE => '抵押标',
    ];

    const AREA_PROJECT='project';
    const AREA_NEW='new';
    const AREA_ACTIVE='active';

    public static $areaMap=[
        self::AREA_PROJECT    => '项目专区',
        self::AREA_NEW    => '新手专区',
        self::AREA_ACTIVE => '活动专区',
    ];
*/
    const STATUS_PENDING='pending';
    const STATUS_DEALFAIL='deal_fail';
    const STATUS_BIDDING='bidding';
    const STATUS_BIDFAIL='bid_fail';
    const STATUS_BIDSUCCESS='bid_success';
    const STATUS_REDEALFAIL='redeal_fail';
    const STATUS_SUCCESS='success';
    const STATUS_COMPLETED='completed';
    const STATUS_FORWARDFINISH='forward_finish';

    public static $statusMap=[
        self::STATUS_PENDING    => '初审待审核',
        self::STATUS_DEALFAIL    => '初审未通过',
        self::STATUS_BIDDING => '初审通过，投标中',
        self::STATUS_BIDFAIL => '投资不满流标',
        self::STATUS_BIDSUCCESS => '标满，复审中',
        self::STATUS_REDEALFAIL    => '复审未通过',
        self::STATUS_SUCCESS    => '复审通过，还款中',
        self::STATUS_COMPLETED=>'已完成',
        self::STATUS_FORWARDFINISH=>'提前完成',
    ];

    protected $fillable=['title','user_id',
        'company_id','duration','money',
        'rate','fee','repayment_times','repayment_already_times',
        'repayment_type','collect_day','deal_time',
        'publish_time','full_time','redeal_time',
        'next_repaytime','type','area',
        'status','use','use_other',
        'deal_id','deal_name','deal_info',
        'deal_info','redeal_name','redeal_info','repayment_capital','repayment_interest','repayment_managefee','repayment_overdue','borrow_des'];
    protected $dates=['deal_time','publish_time','full_time','redeal_time','next_repaytime'];
    public function borrowInfo(){
        return $this->hasOne(Borrow::class);
    }

    public function user(){
        return $this->belongsTo(User::class);
    }
    public function company(){
        return $this->belongsTo(Company::class);
    }
    public function invests(){
        return $this->hasMany(BorrowInvest::class);
    }


    public function repays(){
        return $this->hasMany(BorrowRepayment::class);
    }
    public function relevances(){
        return $this->belongsToMany(User::class,'borrow_relevances')->withTimestamps()
            ->orderBy('borrow_relevances.created_at','desc');
    }
}
