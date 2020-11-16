<?php

namespace App\Admin\Forms;
use App\Exceptions\InvalidRequestException;
use App\Models\Order;
use App\Models\OrderCount;
use App\Services\OrderService;
use Dcat\Admin\Contracts\LazyRenderable;
use Dcat\Admin\Traits\LazyWidget;
use Dcat\Admin\Widgets\Form;
use Symfony\Component\HttpFoundation\Response;

class RefundForm extends Form implements LazyRenderable
{
    use LazyWidget; // 使用异步加载功能
    /**
     * Handle the form request.
     *
     * @param array $input
     *
     * @return Response
     */
    public function handle(array $input)
    {
        // 获取外部传递参数
        $id = $this->payload['id'] ?? null;
        $order=Order::query()->find($id);
        // 判断订单状态是否正确
        if($order->refund_status!==Order::REFUND_STATUS_APPLIED){
            throw  new InvalidRequestException('订单状态不正确');
        }
        $agree=$input['agree'];
        $reason=$input['reason'];
        if($agree==1){
            //同意退款
            // 清空拒绝退款理由
            $extra = $order->extra ?: [];
            unset($extra['refund_disagree_reason']);
            $order->update([
                'extra' => $extra,
            ]);
            // 调用退款逻辑
            //$this->_refundOrder($order);
            app(OrderService::class)->refundOrder($order);

            //已收货订单减少
            app(OrderService::class)->decreaseOrderCount($order,OrderCount::ORDER_TYPE_RECEIVED);
            //退款售后订单增加
            app(OrderService::class)->increaseOrderCount($order,OrderCount::ORDER_TYPE_REFUND);
        }else if($agree==2){
            //不同意退款
            $extra=$order->extra?:[];
            $extra['refund_disagree_reason']=$reason;
            $order->update(['refund_status'=>Order::REFUND_STATUS_PENDING,'extra'=>$extra]);
        }
        return $this->success('操作成功', '/orders');
    }

    /**
     * Build a form here.
     */
    public function form()
    {
        $this->radio('agree','是否同意')->options([1=>'同意',2=>'不同意'])->default(1);
        $this->text('reason','理由')->required()->rules('required');
    }

    /**
     * The data of the form.
     *
     * @return array
     */
    public function default()
    {
        //$skus=ProductSku::query()->where('product_id',$this->product_id)->get();
       // return $skus->toArray();
        return [   ];
    }
}
