<?php
namespace App\Services;
use App\Exceptions\InvalidRequestException;
use App\Models\Category;
use App\Models\CouponType;
use App\Models\CrowdfundingProduct;
use App\Models\OrderItem;
use App\Models\Product;
use App\Models\SeckillProduct;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Cache;
use Illuminate\Support\Facades\Log;

class ProductService{
    public function getFavoriteIds($user_id=null)
    {
        if(Auth::check() || $user_id){
            if(Auth::check()){
                $cache_key = 'favorite'.Auth::id();
            }
            else if($user_id){
                $cache_key = 'favorite'.$user_id;
            }
            $cache_expire_in_seconds = 65 * 60;
            return Cache::remember($cache_key, $cache_expire_in_seconds, function(){
                $products= Auth::user()->favoriteProducts()->get();
                $product_ids=collect($products)->pluck('id')->all();;
                return $product_ids;
            });
        }
        return [];
    }
    public function getProducts($type=Product::TYPE_NORMAL,$search='',$category_id='',$limit=null,$order='id_desc',$include=null,$params=null)
    {
        // 创建一个查询构造器
        $builder =Product::query()->where('on_sale',true);
        if($type){
            $builder->where('type',$type);
        }
        if($include){
            if(!is_array($include)){
                $include=explode(',',$include);
            }
            foreach ($include as $key=>$value){
                if(in_array($value,['category']))
                {
                    $includes[]=$value;
                }
            }
            $include=implode(',',$includes);
            $builder->with($include);
        }
        // 判断是否有提交 search 参数，如果有就赋值给 $search 变量

        if($search)
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
         if($params){
            //分类
             if(isset($params['category_ids']) && $params['category_ids']){
                 $builder->whereIn('category_id',$params['category_ids']);
             }
             //品牌
             if(isset($params['brand_ids']) && $params['brand_ids']){
                 $builder->whereIn('brand_id',$params['brand_ids']);
             }
             if(isset($params['min_price']) && $params['min_price']>0){
                 $builder->where('price','>=',$params['min_price']);
             }
             if(isset($params['max_price']) && $params['max_price']>0){
                 $builder->where('price','<=',$params['max_price']);
             }
             if(isset($params['is_recommend']) && $params['is_recommend']){
                 $builder->where('recommend',true);
             }
             if(isset($params['is_new']) && $params['is_new']){
                 $builder->where('created_at','>=',Carbon::now()->addMonths(-6));
             }
             if(isset($params['is_hot']) && $params['is_hot']){
                 $builder->where('sold_count','>',5);
             }
         }

        // 是否有提交 order 参数，如果有就赋值给 $order 变量
        // order 参数用来控制商品的排序规则
        if ($order) {
            // 是否是以 _asc 或者 _desc 结尾
            if (preg_match('/^(.+)_(asc|desc)$/', $order, $m)) {
                // 如果字符串的开头是这 3 个字符串之一，说明是一个合法的排序值
                if (in_array($m[1], ['price', 'sold_count', 'rating','id'])) {
                    // 根据传入的排序值来构造排序参数
                    $builder->orderBy($m[1], $m[2]);
                }
            }
        }

        if($limit){
            $products= $builder->limit($limit)->get();
        }
        else{
            $products= $builder->paginate(12);
        }
        return $products;
    }

    public function getProductReviews($product_id,$params=null,$limit=null,$include=['order.user'])
    {
        //$include=['order.user', 'productSku']
        $bulider= OrderItem::query()
            ->where('product_id', $product_id)
            ->whereNotNull('reviewed_at'); // 筛选出已评价的
        if($include){
            $bulider->with($include); // 预先加载关联关系
        }
        if($params && isset($params['explain_type'])){
            if($params['explain_type']==3){
                $bulider->where('rating','>',3);
            }
            if($params['explain_type']==2){
                $bulider->where('rating','>',1);
                $bulider->where('rating','<',4);
            }
            if($params['explain_type']==1){
                $bulider->where('rating','<',2);
            }
        }
        if($params && $params['has_cover']){
            $bulider->whereNotNull('review_images');
        }
        $bulider->orderBy('reviewed_at', 'desc');
        if($limit){
            $reviews= $bulider->limit(10)->get(); // 取出 10 条
        }else{
            $reviews= $bulider->paginate(10);
        }
        return $reviews;
    }

    //商品收藏
    public function favor(Product $product,Request $request){
        if(!$product->on_sale){
            throw new InvalidRequestException('商品未上架');
        }
        $favoriteProduct=$request->user()->favoriteProducts();
        $favor=boolval($favoriteProduct->find($product->id));
        if($favor)
        {
            return [];
        }
        $cache_key = 'favorite'.$request->user()->id;
        \Cache::delete($cache_key);
        $favoriteProduct->attach($product);
        return [];
    }
    //商品取消收藏
    public function disfavor(Product $product,Request $request){
        if(!$product->on_sale){
            throw new InvalidRequestException('商品未上架');
        }
        $favoriteProduct=$request->user()->favoriteProducts();
        $favoriteProduct->detach($product);
        $cache_key = 'favorite'.$request->user()->id;
        \Cache::delete($cache_key);
        return [];
    }

    public function seckillings($limit=null){
        /*
        $products =Product::query()->where('on_sale',true)
            ->with('seckill')
            ->where('type',Product::TYPE_SECKILL)
            ->whereHas('seckill',function ($query){
                $query->where('end_at','>=',Carbon::now())->where('start_at','<=',Carbon::now());
            })
            ->paginate(12);
        */
        $build=SeckillProduct::query()
            ->where('end_at','>=',Carbon::now())
            ->where('start_at','<=',Carbon::now())
            ->with('product')
            ->whereHas('product',function ($query){
                $query->where('type',Product::TYPE_SECKILL)->where('on_sale',true);
            })->orderBy('end_at');
        if($limit){
            return $build->limit($limit)->get();
        }
        else{
            return  $build->paginate(12);
        }
    }
    public function crowdfundings($limit=null){
        $build=CrowdfundingProduct::query()
               ->with('product')
               ->whereHas('product',function ($query){
                   $query->where('type',Product::TYPE_CROWDFUNDING)->where('on_sale',true);
               })->orderBy('end_at');
        if($limit) {
            return $build->limit($limit)->get();
        }
        else{
            return  $build->paginate(12);
        }
    }
    public function getGuessYouLike($category=null,$limit=null,$include=null){
        // 创建一个查询构造器
        $builder =Product::query()->where('on_sale',true);
        if($category){
            $builder->whereIn('category_id',$category);
        }
        if($include){
            if(!is_array($include)){
                $include=explode(',',$include);
            }
            foreach ($include as $key=>$value){
                if(in_array($value,['category']))
                {
                    $includes[]=$value;
                }
            }
            $include=implode(',',$includes);
            $builder->with($include);
        }
        if($limit){
            $products= $builder->limit($limit)->get();
        }
        else{
            $products= $builder->paginate(10);
        }
        return $products;
    }
}