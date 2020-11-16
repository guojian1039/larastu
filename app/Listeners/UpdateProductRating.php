<?php

namespace App\Listeners;

use App\Events\OrderReviewed;
use App\Models\OrderItem;
use App\Models\ProductEvaluation;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class UpdateProductRating implements ShouldQueue
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  OrderReviewed  $event
     * @return void
     */
    public function handle(OrderReviewed $event)
    {
        // 通过 with 方法提前加载数据，避免 N + 1 性能问题
        $items=$event->getOrder()->items()->with(['product'])->get();

        foreach ($items as $item){
            $result=OrderItem::query()->where('product_id',$item->product_id)
                ->whereNotNull('reviewed_at')

                ->whereHas('order',function ($query){
                    $query->whereNotNull('paid_at');
                })->first([\DB::raw('count(*) as review_count'),\DB::raw('avg(rating) as  rating')]);
            // 更新商品的评分和评价数
            $item->product->update([
                'rating'       => $result->rating,
                'review_count' => $result->review_count,
            ]);
            $good_num=0;
            $ordinary_num=0;
            $negative_num=0;
            $cover_num=0;
            if($item->rating>3){
                $good_num=1;
            }else if($item->rating>1){
                $ordinary_num=1;
            }else {
                $negative_num=1;
            }
            if($item->review_images){
                $cover_num=1;
            }
            $evaluation=ProductEvaluation::query()->where('product_id',$item->product_id)->first();
            if($evaluation){
                $evaluation->update([
                    'good_num'=>$evaluation->good_num+$good_num,
                    'ordinary_num'=>$evaluation->ordinary_num+$ordinary_num,
                    'negative_num'=>$evaluation->negative_num+$negative_num,
                    'cover_num'=>$evaluation->cover_num+$cover_num]);
            }else{
                ProductEvaluation::query()->create([
                    'good_num'=>$good_num,
                    'ordinary_num'=>$ordinary_num,
                    'negative_num'=>$negative_num,
                    'cover_num'=>$cover_num]);
            }
        }
    }
}
