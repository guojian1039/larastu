<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use App\Services\ProductService;
use Illuminate\Http\Request;

class DiscountsController extends Controller
{
    public function index(Request $request){
        // 创建一个查询构造器
        $builder =Product::query()->where('on_sale',true)
            ->where('type',Product::TYPE_DISCOUNT);
        // 判断是否有提交 search 参数，如果有就赋值给 $search 变量

        if($search=$request->input('search',''))
        {
            $like='%'.$search.'%';
            // 模糊搜索商品标题、商品详情、SKU 标题、SKU描述
            $builder->where(function($query) use ($like) {
                $query->where('title','like',$like)
                    ->orWhere('description','like',$like)
                    ->orWhereHas('skus',function ($query) use ($like){
                        $query->where('title','like',$like)
                            ->orWhere('description','like',$like);
                    });
            });
        }
        // 如果有传入 category_id 字段，并且在数据库中有对应的类目
        $category_id=$request->input('category_id');
        if ($category_id && $category = Category::find($category_id)) {
            // 如果这是一个父类目
            if ($category->is_directory) {
                $builder->whereHas('category',function ($query) use ($category){
                    $query->where('path','like',$category->path.$category->id.'-%');
                });
            }
            else
            {
                $builder->where('category_id',$category->id);
            }
        }
        $brands=[];
        if($category_id){
            $cateIds=Category::query()->where('path','like','-'.$category_id.'-%')->get('id')->toArray();
            $cateIds= array_column($cateIds,'id');
            $cateIds[]=$category_id;
            $brands=\DB::table('brands','a')->leftJoin('brand_categories as b','a.id','=','b.brand_id')->whereIn('b.category_id',$cateIds)->distinct()->get('a.*');
        }
        $brandIds=$request->input('brands','');
        $params=null;
        if($brandIds){
            $params['brand_ids']=explode(',',trim($brandIds,','));
        }
        // 是否有提交 order 参数，如果有就赋值给 $order 变量
        // order 参数用来控制商品的排序规则
        if ($order = $request->input('order', '')) {
            // 是否是以 _asc 或者 _desc 结尾
            if (preg_match('/^(.+)_(asc|desc)$/', $order, $m)) {
                // 如果字符串的开头是这 3 个字符串之一，说明是一个合法的排序值
                if (in_array($m[1], ['price', 'sold_count', 'rating'])) {
                    // 根据传入的排序值来构造排序参数
                    $builder->orderBy($m[1], $m[2]);
                }
            }
        }
        //品牌
        if(isset($params['brand_ids'])){
            $builder->whereIn('brand_id',$params['brand_ids']);
        }
        $products= $builder->orderBy('id','desc')->paginate(9);

        $categories=Category::query()->where('level',0)->where('is_directory',1)->get();

        $categoryInfo=[];
        foreach ($categories as $category){
            $pcount=Product::query()->where('type',Product::TYPE_DISCOUNT)->whereIn('category_id',$category->child_ids)->count();
            $category['product_count']=$pcount;
            $categoryInfo[]=$category;
        }

        $favorite_Ids=app(ProductService::class)->getFavoriteIds();
        return view('discounts.index',
              [
                  'products'=>$products,
                  'filters'=>['search'=>$search,'category_id'=>$category_id,'order'=>$order,'brands'=>$brandIds],
                  'favorite_Ids'=>$favorite_Ids,
                  'categories'=>$categoryInfo,
                  'brands'=>$brands
              ]);
    }
}
