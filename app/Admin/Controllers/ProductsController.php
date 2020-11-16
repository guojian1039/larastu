<?php

namespace App\Admin\Controllers;
use App\Admin\Actions\Grid\TranslateProduct;
use App\Admin\Actions\Grid\UploadPic;
use App\Models\BaseProperty;
use App\Models\Category;
use App\Models\ProductProperty;
use App\Models\ProductSku;
use App\Models\ProductSkuProperty;
use App\Renders\ProductPic;
use Dcat\Admin\Admin;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use \App\Models\Product;
use Dcat\Admin\Show;
use Dcat\Admin\Layout\Content;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\URL;

class ProductsController extends CommonProductsController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '商品列表';

    public function getProductType()
    {
        return Product::TYPE_NORMAL;
    }
    public function customGrid(Grid $grid)
    {
        $grid->model()->with(['category']);
        //$grid->id('ID')->sortable();
        $grid->number();
        $grid->column('title','商品名称')->display(function ($value){
            return "<a href='products/$this->id'>$value</a>";

        });
        //$grid->column('pic','图片')->display('图片')->modal('商品图片', \App\Renders\ProductPic::make());
        $grid->column('category.name', '类目');
        /*
        $grid->on_sale('已上架')->display(function ($value) {
            return $value ? '是' : '否';
        });
        */
        $grid->on_sale('已上架')->switch();
        $grid->price('价格');
        $grid->rating('评分');
        $grid->sold_count('销量');
        $grid->review_count('评论数');

        $grid->recommend('推荐')->switch();
        $grid->column('property','属性')->display(function () {
            //return admin_url('products/'.$this->id.'/properties');
            return "<a href='products/$this->id/properties'>属性</a>";
        });
        $grid->disableViewButton(true);
        //$grid->setActionClass(Grid\Displayers\ContextMenuActions::class);
        $grid->setActionClass(Grid\Displayers\DropdownActions::class);
        $grid->actions(function ($actions) {
            //$actions->append(CreateCategory::make());
            $actions->append(TranslateProduct::make(Product::TYPE_ACTIVE));
            //$actions->append(CrowdfundingTransProduct::make(Product::TYPE_CROWDFUNDING));
            $actions->append(new TranslateProduct(Product::TYPE_CROWDFUNDING));
            $actions->append(new TranslateProduct(Product::TYPE_SECKILL));
            //$actions->append(new TranslateProduct(Product::TYPE_DISCOUNT));
           // $actions->prepend('<a href="discount_products/'.$actions->getKey().'/edit">折扣商品</a>');
            $actions->append(new UploadPic(0,'test'));
        });


    }
    public function customForm(Form $form)
    {
        // TODO: Implement customForm() method.
    }
    public function childGrid(Grid $grid,$keyValue)
    {
        $grid->tools(function (Grid\Tools $tools) use ($keyValue){
            $tools->append('<a href="/admin/skus/create?product_id='.$keyValue.'". class="btn btn-primary btn-outline">
    <i class="feather icon-plus"></i><span class="d-none d-sm-inline">&nbsp;&nbsp;新增</span>
</a>');
        });
    }

    public function customShow(Show $show)
    {
        // TODO: Implement customShow() method.
    }

    public function specialSku(Form\NestedForm $form)
    {
        $form->hidden('original_price')->default(0);
    }
    public function formRelation()
    {
        // TODO: Implement formRelation() method.
        return Product::with('skus');
    }
    public function properties($id, Content $content){
        Admin::collectAssets('select2');
        $action = URL::current();
        $productProperties=ProductProperty::query()
            ->where('product_id',$id)
            ->with('baseProperty.items')->get();
        /*
        $baseProperties=BaseProperty::query()->leftJoin('product_properties',  'base_properties.id','=','product_properties.base_property_id')
                        ->whereNull('product_properties.id')->with('items')->toSql();
        */
        $product=Product::query()->find($id);
        $category=Category::query()->find($product->category_id);
        $cateIds=explode('-',trim($category->path,'-'));
        $baseProperties=BaseProperty::query()
            //->where('category_id',$product->category_id)
                ->whereIn('category_id',$cateIds)
            ->with('items')
            ->whereDoesntHave('productProperty',function ($query) use ($id){
            $query->where('product_id',$id);
        })->get();

        return $content
            ->title('商品属性')
            ->description(' ')
            ->body(view('admin.product.properties',compact('productProperties', 'baseProperties','action')
            ));
    }
    public function storeProperty($id,Request $request){
        $item=$request->input('item');
        $title=$item['base_property_title'];
        $prop_value=$item['base_property_item_value'];
        $base_property_item_id=$item['base_property_item_id'];
        if($item && $title){
            if($item['id']){
                //修改
                ProductProperty::query()->find($item['id'])->update([
                    'title'=>$title,
                    'prop_value'=>$prop_value,
                    'base_property_item_id'=>$base_property_item_id]);
            }else{
                //新增保存
                 $pp=new ProductProperty();
                $pp->title=$title;
                $pp->prop_value=$prop_value;
                $pp->product()->associate($id);
                if($item['base_property_id']){
                    $pp->basePropertyItem()->associate($base_property_item_id);
                    $pp->baseProperty()->associate($item['base_property_id']);
                }
                $pp->save();
            }
        }

        return[];
    }
    public function deleteProperty($id,Request $request){
         $property_id=$request->input('property_id');
        ProductProperty::query()->where('id',$property_id)->delete();
        return [];
    }

    public function skuProperties($id, Content $content){
        Admin::collectAssets('select2');
        $action = URL::current();
        $productProperties=ProductSkuProperty::query()
            ->where('product_sku_id',$id)
            ->with('baseProperty.items')->get();
        /*
        $baseProperties=BaseProperty::query()->leftJoin('product_properties',  'base_properties.id','=','product_properties.base_property_id')
                        ->whereNull('product_properties.id')->with('items')->toSql();
        */
        $sku=ProductSku::query()->find($id);
        $product=Product::query()->find($sku->product_id);
        $category=Category::query()->find($product->category_id);
        $cateIds=explode('-',trim($category->path,'-'));
        $baseProperties=BaseProperty::query()
            //->where('category_id',$product->category_id)
            ->whereIn('category_id',$cateIds)
            ->with('items')
            ->whereDoesntHave('productSkuProperty',function ($query) use ($sku){
                $query->where('product_sku_id',$sku->id);
            })->get();

        return $content
            ->title('商品属性')
            ->description(' ')
            ->body(view('admin.product.skuproperties',compact('productProperties', 'baseProperties','action')
            ));
    }
    public function storeSkuProperty($id,Request $request){
        $item=$request->input('item');
        $title=$item['base_property_title'];
        $prop_value=$item['base_property_item_value'];
        $base_property_item_id=$item['base_property_item_id'];
        if($item && $title){
            if($item['id']){
                //修改
                ProductSkuProperty::query()->find($item['id'])->update([
                    'title'=>$title,
                    'prop_value'=>$prop_value,
                    'base_property_item_id'=>$base_property_item_id]);
            }else{
                //新增保存
                $pp=new ProductSkuProperty();
                $pp->title=$title;
                $pp->prop_value=$prop_value;
                $pp->productSku()->associate($id);
                if($item['base_property_id']){
                    $pp->basePropertyItem()->associate($base_property_item_id);
                    $pp->baseProperty()->associate($item['base_property_id']);
                }
                $pp->save();
            }
        }

        return[];
    }
    public function deleteSkuProperty($id,Request $request){
        $property_id=$request->input('property_id');
        ProductProperty::query()->where('id',$property_id)->delete();
        return [];
    }
}
