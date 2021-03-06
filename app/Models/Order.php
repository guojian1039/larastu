<?php

namespace App\Models;
use Bavix\Wallet\Interfaces\Customer;
use Bavix\Wallet\Traits\HasWallet;
use Illuminate\Database\Eloquent\Model;
use Ramsey\Uuid\Uuid;
use Bavix\Wallet\Interfaces\Product;
class Order extends Model implements Product
{
    use HasWallet;
    use \App\Models\Traits\DefaultDatetimeFormat;
    const REFUND_STATUS_PENDING='pending';
    const REFUND_STATUS_APPLIED='applied';
    const REFUND_STATUS_PROCESSING='proccessing';

    const REFUND_STATUS_SUCCESS='success';
    const REFUND_STATUS_FAILED='failed';
    public static $refundStatusMap=[
        self::REFUND_STATUS_PENDING    => '未退款',
        self::REFUND_STATUS_APPLIED    => '已申请退款',
        self::REFUND_STATUS_PROCESSING => '退款中',
        self::REFUND_STATUS_SUCCESS    => '退款成功',
        self::REFUND_STATUS_FAILED     => '退款失败',
    ];
    const SHIP_STATUS_PENDING='pending';
    const SHIP_STATUS_DELIVERED = 'delivered';
    const SHIP_STATUS_RECEIVED='received';
    public static $shipStatusMap = [
        self::SHIP_STATUS_PENDING   => '未发货',
        self::SHIP_STATUS_DELIVERED => '已发货',
        self::SHIP_STATUS_RECEIVED  => '已收货',
    ];
    const TYPE_NORMAL = 'normal';
    const TYPE_CROWDFUNDING = 'crowdfunding';
    const TYPE_SECKILL='seckill';
    public static $typeMap = [
        self::TYPE_NORMAL => '普通商品订单',
        self::TYPE_CROWDFUNDING => '众筹商品订单',
        self::TYPE_SECKILL=>'秒杀订单'
    ];
    protected $fillable=['type','no','address','remark','payment_method','total_amount','payment_no','paid_at','reviewed',
        'refund_no','refund_status','ship_status','ship_data','ship_time','extra','closed'];
    protected $dates=['paid_at','ship_time'];
    protected $casts=['reviewed'=>'boolean','closed'=>'boolean','address'=>'json','ship_data'=>'json','extra'=>'json'];

    protected static function boot()
    {
        parent::boot(); // TODO: Change the autogenerated stub
        static::creating(function ($model){
            if(!$model->no){
                $model->no=static::findAvailableNo();
                // 如果生成失败，则终止创建订单
                if (!$model->no) {
                    return false;
                }
            }
        });
    }
    public static function findAvailableNo()
    {
// 订单流水号前缀
        $prefix = date('YmdHis');
        for ($i = 0; $i < 10; $i++) {
            // 随机生成 6 位的数字
            $no = $prefix.str_pad(random_int(0, 999999), 6, '0', STR_PAD_LEFT);
            // 判断是否已经存在
            if (!static::query()->where('no', $no)->exists()) {
                return $no;
            }
        }
        \Log::warning('find order no failed');

        return false;
    }
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function items(){
        return $this->hasMany(OrderItem::class);
    }
    //废弃
    public function couponCode()
    {
        return $this->belongsTo(CouponCode::class);
    }
    public function invoice(){
        return $this->hasOne(OrderInvoice::class);
    }
    public static function getAvailableRefundNo()
    {
        do {
            // Uuid类可以用来生成大概率不重复的字符串
            $no = Uuid::uuid4()->getHex();
            // 为了避免重复我们在生成之后在数据库中查询看看是否已经存在相同的退款订单号
        } while (self::query()->where('refund_no', $no)->exists());

        return $no;
    }

    public function canBuy(Customer $customer, int $quantity = 1, bool $force = null): bool
    {
        return true;
    }
    public function getAmountProduct(Customer $customer)
    {
        return $this->total_amount;
    }
    public function getMetaProduct(): ?array
    {
        return [
            'title' => '订单号：'.$this->no,
            'description' => 'order_id #' . $this->id,
            'type'=>$this->refund_status
        ];
    }
    public function getUniqueId(): string
    {
        return (string)$this->getKey();
    }
    public function shop(){
        return $this->belongsTo(Shop::class);
    }
}
