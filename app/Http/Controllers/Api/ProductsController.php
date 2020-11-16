<?php

namespace App\Http\Controllers\Api;
use App\Exceptions\InvalidRequestException;
use App\Http\Resources\CrowdfundingProductResource;
use App\Http\Resources\ProductResource;
use App\Http\Resources\SeckillProductResource;
use App\Models\Product;
use App\Services\ProductService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class ProductsController extends Controller
{
    protected $productService;
    public function __construct(ProductService $productService)
    {
        //$this->middleware('auth');
        $this->productService=$productService;
    }
    //商品列表
    public function index(Request $request)
    {
        // 判断是否有提交 search 参数，如果有就赋值给 $search 变量
        $search=$request->input('search','');
        // 如果有传入 category_id 字段，并且在数据库中有对应的类目
        $category_id=$request->input('category_id');

        // 是否有提交 order 参数，如果有就赋值给 $order 变量
        // order 参数用来控制商品的排序规则
        $order = $request->input('order', '');

        $limit=$request->input('limit',9);
        $include=$request->input('include','');
        $is_new=$request->input('is_new',0);
        $is_recommend=$request->input('is_recommend',0);
        $is_hot=$request->input('is_hot',0);
        $max_price=$request->input('max_price',0);
        $min_price=$request->input('min_price',0);
        $brand_ids=$request->input('brand_ids','');
        $category_ids=$request->input('category_ids','');

        $extra=[
            'is_new'=>$is_new,
            'is_recommend'=>$is_recommend,
            'is_hot'=>$is_hot,
            'max_price'=>$max_price,
            'min_price'=>$min_price,
            'brand_ids'=>$brand_ids,
            'category_ids'=>$category_ids
        ];
        $products=$this->productService->getProducts(Product::TYPE_NORMAL,$search,$category_id,null,$order,$include,$extra);
        return ProductResource::collection($products);
    }
    //商品详情
    public function show(Product $product,Request $request)
    {
        if(!$product->on_sale){
            throw new InvalidRequestException('商品未上架');
        }
        //$product->append('is_favorite');
        //$product->append('reviews');
        $product->append('coupons');
        $product->load(['skus','pics']);
        return new ProductResource($product);
    }
    //商品收藏
    public function favor(Product $product,Request $request){
        return $this->productService->favor($product,$request);
    }
    //商品取消收藏
    public function disfavor(Product $product,Request $request){
        return $this->productService->disfavor($product,$request);
    }

    public function getSeckillings(Request $request){
        $products= $this->productService->seckillings();
        return SeckillProductResource::collection($products);
        //return ProductResource::collection($products);
    }
    public function getCrowdfundings(Request $request)
    {
        $products= $this->productService->crowdfundings();
        return CrowdfundingProductResource::collection($products);
    }
    public function discounts(Request $request)
    {
        $products= $this->productService->getProducts(Product::TYPE_DISCOUNT);
        return ProductResource::collection($products);
    }
    public function isFavorite(Request $request){
        $favored=0;
        if($request->user()){
            $favorite_Ids=$this->productService->getFavoriteIds($request->user()->id);
            if(in_array($request->input('id'),$favorite_Ids)){
                $favored=1;
            }
        }
        return $favored;
    }

    public function getReviews(Product $product,Request $request){
        return $product->evaluation;
    }
    public function reviews(Request $request){
        $explain_type=$request->input('explain_type','');
        $has_cover=$request->input('has_cover','');
        $product_id=$request->input('id',0);
        $reviews= app(ProductService::class)->getProductReviews($product_id,['explain_type'=>$explain_type,'has_cover'=>$has_cover]);

        return $reviews;
    }
}
