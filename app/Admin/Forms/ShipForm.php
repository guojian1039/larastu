<?php

namespace App\Admin\Forms;
use App\Exceptions\InvalidRequestException;
use App\Models\CrowdfundingProduct;
use App\Models\Order;
use App\Models\OrderCount;
use App\Services\OrderService;
use Carbon\Carbon;
use Dcat\Admin\Contracts\LazyRenderable;
use Dcat\Admin\Traits\LazyWidget;
use Dcat\Admin\Widgets\Form;
use Symfony\Component\HttpFoundation\Response;

class ShipForm extends Form implements LazyRenderable
{
    use LazyWidget;
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

        // 判断当前订单是否已支付
        if (!$order->paid_at) {
            throw new InvalidRequestException('该订单未付款');
        }
        // 众筹订单只有在众筹成功之后发货
        if ($order->type === Order::TYPE_CROWDFUNDING &&
            $order->items[0]->product->crowdfunding->status !== CrowdfundingProduct::STATUS_SUCCESS) {
            throw new InvalidRequestException('众筹订单只能在众筹成功之后发货');
        }
        // 判断当前订单发货状态是否为未发货
        if ($order->ship_status !== Order::SHIP_STATUS_PENDING) {
            throw new InvalidRequestException('该订单已发货');
        }
        $data= ['express_company'=>$input['express_company'],'express_no'=>$input['express_no']];
        $order->update(['ship_status'=>Order::SHIP_STATUS_DELIVERED,'ship_data'=>$data,'ship_time'=>Carbon::now()]);
        //返回上一页
        //待发货订单减少
        app(OrderService::class)->decreaseOrderCount($order,OrderCount::ORDER_TYPE_APPLIED);
        //待收货订单增加
        app(OrderService::class)->increaseOrderCount($order,OrderCount::ORDER_TYPE_DELIVERED);

        return $this->success('操作成功', '/orders');
    }

    /**
     * Build a form here.
     */
    public function form()
    {
        $this->text('express_company','物流公司')->required()->rules('required');
        $this->text('express_no','物流单号')->required()->rules('required');
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
