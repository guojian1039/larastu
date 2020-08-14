<?php

namespace App\Console\Commands\Cron;

use App\Jobs\RefundCrowdfundingOrders;
use App\Models\CrowdfundingProduct;
use App\Models\Order;
use App\Services\OrderService;
use Carbon\Carbon;
use Illuminate\Console\Command;

class FinishCrowdfunding extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'cron:finishi-crowdfunding';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '结束众筹';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        CrowdfundingProduct::query()
              //众筹结束时间早于当前时间
            ->where('end_at','<=',Carbon::now())
               //众筹状态为众筹中
            ->where('status',CrowdfundingProduct::STATUS_FUNDING)
            ->get()
            ->each(function (CrowdfundingProduct $crowdfunding){
               //如果众筹目标金额大于实际众筹金额
                if($crowdfunding->total_amount<$crowdfunding->target_amount){
                    //调用众筹失败逻辑
                }
                else{
                    //调用众筹成功逻辑
                }
                //
            });

    }
    private function crowdfundingFailed(CrowdfundingProduct $crowdfunding){
        $crowdfunding->update(['status'=>CrowdfundingProduct::STATUS_FAIL]);
        /*
        $orderService=app(OrderService::class);
        // 查询出所有参与了此众筹的订单
        Order::query()
            // 订单类型为众筹商品订单
            ->where('type', Order::TYPE_CROWDFUNDING)
            // 已支付的订单
            ->whereNotNull('paid_at')
            ->where('items',function ($query) use ($crowdfunding){
                $query->where('product_id',$crowdfunding->product_id);
            })->get()->each(function (Order $order)use ($orderService) {
                $orderService->refundOrder($order);
            });
        */
        dispatch(new RefundCrowdfundingOrders($crowdfunding));
    }
    private function crowdfundingSucceed(CrowdfundingProduct $crowdfunding){
        $crowdfunding->update(['status'=>CrowdfundingProduct::STATUS_SUCCESS]);
    }
}
