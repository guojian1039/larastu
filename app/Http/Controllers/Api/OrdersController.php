<?php

namespace App\Http\Controllers\Api;

use App\Events\OrderReviewed;
use App\Exceptions\CouponCodeUnavailableException;
use App\Exceptions\CouponUnavailableException;
use App\Exceptions\InternalException;
use App\Exceptions\InvalidRequestException;
use App\Http\Requests\ApplyRefundRequest;
use App\Http\Requests\CrowdFundingOrderRequest;
use App\Http\Requests\OrderRequest;
use App\Http\Requests\SeckillOrderRequest;
use App\Http\Requests\SendReviewRequest;
use App\Http\Resources\OrderResource;
use App\Jobs\CloseOrder;
use App\Models\Coupon;
use App\Models\CouponCode;
use App\Models\Order;
use App\Models\OrderCount;
use App\Models\OrderItem;
use App\Models\ProductSku;
use App\Models\UserAddress;
use App\Models\UserInvoice;
use App\Services\ExpressService;
use App\Services\OrderService;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class OrdersController extends Controller
{
    protected $orderService;
    public function __construct(OrderService $orderService)
    {
        $this->orderService=$orderService;
    }

    public function store(OrderRequest $request){
        $address_id=$request->input('address_id');
        $remark=$request->input('remark','');
        $items=$request->input('items');
        $coupon  = null;

        // 如果用户提交了优惠码
        if ($coupon_id = $request->input('coupon_id')) {
            $coupon = Coupon::where('id', $coupon_id)->first();
            if (!$coupon) {
                throw new CouponUnavailableException('优惠券不存在');
            }
        }
        $invoice=null;
        if ($invoice_id = $request->input('invoice_id')) {
            $invoice = UserInvoice::where('id', $invoice_id)->first();
        }
        $order=$this->orderService->saveOrder($address_id,$items,$remark,$coupon,$invoice);
       return $order;
    }
    public function index(Request $request){
        $synthesize_status=$request->input('synthesize_status',-1);
        $keyword=$request->input('keyword',null);
        $orders=$this->orderService->getOrders($synthesize_status,$keyword);
        return OrderResource::collection($orders);
    }
    public function show(Order $order,Request $request){
        $this->authorize('own',$order);
        if($request->input('include')){
            return new OrderResource($order->load(['items.productSku','items.product','invoice']));
        }
        else{
            return new OrderResource($order);
        }
    }
    public function received(Order $order,Request $request)
    {
        // 校验权限
        $this->authorize('own', $order);
        if(!$order->paid_at){
            throw new InvalidRequestException('订单未支付');
        }
        // 判断订单的发货状态是否为已发货
        if($order->ship_status!==Order::SHIP_STATUS_DELIVERED){
            throw new InvalidRequestException('发货状态不正确');
        }
        $this->orderService->received($order);
        return $order;
    }

    public function sendReview(Order $order, SendReviewRequest $request)
    {
        // 校验权限
        $this->authorize('own', $order);
        if (!$order->paid_at) {
            throw new InvalidRequestException('该订单未支付，不可评价');
        }
        // 判断是否已经评价
        if ($order->reviewed) {
            throw new InvalidRequestException('该订单已评价，不可重复提交');
        }
        $reviews = $request->input('reviews');
        $this->orderService->review($reviews,$order);
        return [];
    }

    public function crowdfunding(CrowdFundingOrderRequest $request){
        $sku_id=$request->input('sku_id');
        $amount=$request->input('amount');
        $address_id=$request->input('address_id');
        $order=$this->orderService->crowdfunding($address_id,$sku_id,$amount);
        return $order;
    }
    public function seckill(SeckillOrderRequest $request){
        $sku_id=$request->input('sku_id');
        $sku=ProductSku::query()->find($sku_id);
        $order=$this->orderService->seckill($request->user(),$request->input('address'),$sku);
        return $order;
    }

    public function orderClose(Order $order){
       return $this->orderService->closeOrder($order);
    }
    public function orderDelete(Order $order){
        if($order->closed){
            $order->items()->delete();
            $order->delete();
        }
        return[];
    }

    //申请退货，退款
    public function applyRefund(Order $order,ApplyRefundRequest $request){
        // 校验订单是否属于当前用户
        $this->authorize('own', $order);
        if (!$order->paid_at) {
            throw new InvalidRequestException('该订单未支付，不可退款',422);
        }
        // 众筹订单不允许申请退款
        if ($order->type === Order::TYPE_CROWDFUNDING) {
            throw new InvalidRequestException('众筹订单不支持退款');
        }
        if($order->refund_status!==Order::REFUND_STATUS_PENDING){
            throw new InvalidRequestException('该订单已经申请过退款，请勿重复申请',422);
        }
        // 将用户输入的退款理由放到订单的 extra 字段中
        $extra=$order->extra?:[];
        $extra['refund_reason']=$request->input('reason');
        // 将订单退款状态改为已申请退款
        $order->update(['refund_status'=>Order::REFUND_STATUS_APPLIED,'extra'=>$extra]);
        return $order;
    }
    //取消申请退货，退款
    public function closeApplyRefund(Order $order,ApplyRefundRequest $request){
        // 校验订单是否属于当前用户
        $this->authorize('own', $order);
        if($order->refund_status!==Order::REFUND_STATUS_APPLIED){
            throw new InvalidRequestException('该订单申请退款，已处理无法取消',422);
        }
        // 将用户输入的退款理由放到订单的 extra 字段中
        $extra=$order->extra?:[];
        $extra['refund_reason']='';
        // 将订单退款状态改为已申请退款
        $order->update(['refund_status'=>Order::REFUND_STATUS_APPLIED,'extra'=>$extra]);
        return $order;
    }

    public function getShip(Order $order,ExpressService $service){

        $express_no=$order->ship_data['express_no'];
        $express_data=[
            ['time' => '2019-01-09 12:11', 'description' => '仓库-已签收'],
            ['time' => '2019-01-07 12:11', 'description' => '广东XX服务点'],
            ['time' => '2019-01-06 12:11', 'description' => '广东XX转运中心']
        ]; //$service->getInfo($express_no,['kuaidi100'])['kuaidi100']['result']['data'];
        $data=$order->load(['items.product','items.productSku','user']);
        $data['express_data']=$express_data;
        $data['shipping_type']=1;
        return $data;
    }
}
