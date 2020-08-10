<?php

namespace App\Admin\Forms;

use App\Models\Product;
use Carbon\Carbon;
use Dcat\Admin\Widgets\Form;
use Symfony\Component\HttpFoundation\Response;

class ProductActive extends Form
{
    protected $product_id;
    protected $type;
    public function __construct(int $product_id=0,string $type=null)
    {

        $this->product_id=$product_id;
        $this->type=$type;
        parent::__construct();
    }
    /**
     * Handle the form request.
     *
     * @param array $input
     *
     * @return Response
     */
    public function handle(array $input)
    {
        // dump($input);
        $product=Product::query()->find($input['product_id']);
         switch($input['type']){
             case Product::TYPE_CROWDFUNDING:
                 $crowdfunding=$product->crowdfunding()->make(['end_at'=>$input['end_at'],'target_amount'=>$input['target_amount']]);
                 $r=$crowdfunding->save();
                 break;
             case Product::TYPE_SECKILL:
                 $seckill=$product->seckill()->make(['end_at'=>$input['end_at'],'start_at'=>$input['start_at']]);

                 $r=$seckill->save();
                 break;
             case Product::TYPE_ACTIVE:
                 $active=$product->active()->make(['end_at'=>$input['end_at']]);
                 $r=$active->save();
                 break;
         }

        $product->update(['type'=>$input['type']]);
        //model::query()->create($input)
        if($r){
            return $this->success('操作成功', '/products');
        }
        else{
            return $this->error('操作失败');
        }
    }

    /**
     * Build a form here.
     */
    public function form()
    {
        $this->hidden('product_id')->value($this->product_id);
        $this->hidden('type')->value($this->type);
        switch ($this->type){
            case Product::TYPE_ACTIVE:
                $this->datetime('end_at','活动结束时间')->rules('required|date');
                break;
            case Product::TYPE_SECKILL:
                $this->datetime('start_at','开始时间')->rules('required|date');
                $this->datetime('end_at','结束时间')->rules('required|date');
                break;
            case Product::TYPE_CROWDFUNDING:
                $this->text('target_amount','众筹目标金额')->rules('required|numeric|min:0.01');
                $this->datetime('end_at','众筹结束时间')->rules('required|date');
                break;
        }
    }

    /**
     * The data of the form.
     *
     * @return array
     */
    public function default()
    {
        return [
            'start_at'  => Carbon::now(),
            'end_at' =>Carbon::tomorrow(),
            'target_amount' =>100000,
        ];
    }
}
