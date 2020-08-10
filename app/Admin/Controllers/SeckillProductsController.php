<?php
namespace  App\Admin\Controllers;
use App\Admin\Actions\Grid\BackProduct;
use App\Models\Product;
use App\Models\ProductSku;
use App\Models\SeckillProduct;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Traits\DefaultDatetimeFormat;
use Illuminate\Support\Facades\Redis;

class SeckillProductsController extends CommonProductsController
{
    protected $title = '秒杀商品';
    public function getProductType()
    {
        return Product::TYPE_SECKILL;
    }
    public function customForm(Form $form)
    {
        $form->datetime('seckill.start_at','开始时间')->rules('required|date');
        $form->datetime('seckill.end_at','结束时间')->rules('required|date');
        // 当商品表单保存完毕时触发
        $form->saved(function (Form $form,$result) {
            $product = $form->repository()->eloquent();
            // 商品重新加载秒杀和 SKU 字段
            $product->load(['seckill', 'skus']);
            //$product->with(['seckill', 'skus']);
            // 获取当前时间与秒杀结束时间的差值
            $diff = $product->seckill->end_at->getTimestamp() - time();
            // 遍历商品 SKU
            $product->skus->each(function (ProductSku $sku) use ($diff, $product) {
                // 如果秒杀商品是上架并且尚未到结束时间
                if ($product->on_sale && $diff > 0) {
                    // 将剩余库存写入到 Redis 中，并设置该值过期时间为秒杀截止时间
                    Redis::setex('seckill_sku_'.$sku->id, $diff, $sku->stock);
                } else {
                    // 否则将该 SKU 的库存值从 Redis 中删除
                    Redis::del('seckill_sku_'.$sku->id);
                }
            });
        });
    }
    public function customGrid(Grid $grid)
    {
        $grid->model()->with('seckill');
        //$grid->column('id', __('序号'));
        //$grid->column('title', __('名称'));
        $grid->number();

        $grid->column('title','商品名称')->display(function ($value){
            return "<a href='seckill_products/$this->id'>$value</a>";
        });

        $grid->column('on_sale', __('是否上架'))->display(function ($value){
            return $value?'是':'否';
        });
        $grid->column('price', __('价格'));
        $grid->sold_count('销量');
        $grid->column('seckill.start_at', __('开始时间'));
        $grid->column('seckill.end_at','结束时间');
        $grid->disableViewButton();
        $grid->actions([new BackProduct(SeckillProduct::class)]);
        $grid->setActionClass(Grid\Displayers\Actions::class);
    }
    public function specialSku(Form\NestedForm $form)
    {
        $form->text('original_price','原价')->rules('required|numeric|min:0.01');
    }
    public function childGrid(Grid $grid, $keyValue)
    {
        // TODO: Implement childGrid() method.
        $grid->disableDeleteButton();
    }
    public function customShow(Show $show)
    {
        $show->seckill(function ($model) {
            $seckill=SeckillProduct::query()->where('product_id',$model->id)->first();
            return Show::make($seckill->id,new SeckillProduct(), function (Show $show) {
                // 设置路由
                //$show->resource('/crowdfunding');
                //$show->id();
                $show->start_at('开始时间');
                $show->end_at('结束时间');
                $show->disableDeleteButton();
                $show->disableListButton();
                $show->disableEditButton();

            });
    });
    }
    public function formRelation()
    {
        return Product::with(['skus','seckill']);
    }
}