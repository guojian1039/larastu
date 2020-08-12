<?php

namespace App\Http\Controllers;
use App\Exceptions\InvalidRequestException;
use App\Models\Category;
use App\Models\Product;
use App\Services\ProductService;
use App\Services\UserService;
use Illuminate\Http\Request;
class ProductsController extends Controller
{
    protected $productService;
    public function __construct(ProductService $productService)
    {
        //$this->middleware('auth');
        $this->productService=$productService;
    }
    public function index(Request $request)
    {
        // 判断是否有提交 search 参数，如果有就赋值给 $search 变量
        $search=$request->input('search','');
        // 如果有传入 category_id 字段，并且在数据库中有对应的类目
        $category_id=$request->input('category_id');

        // 是否有提交 order 参数，如果有就赋值给 $order 变量
        // order 参数用来控制商品的排序规则
        $order = $request->input('order', '');

        $products=$this->productService->getProducts(Product::TYPE_NORMAL,$search,$category_id,null,$order);

        $limit=$request->input('limit',9);

        $active_products=$this->productService->getProducts(Product::TYPE_DISCOUNT,'','',$limit);

        $i=6;
        $actives=[];
        foreach ($active_products as $active_product)
        {
            if($i%3==0)
            {
                $actives[3][]=$active_product;
            }
            else if($i%2==0)
            {
                $actives[2][]=$active_product;
            }else
            {
                $actives[1][]=$active_product;
            }
            $i--;
        }

        $favorite_Ids=$this->productService->getFavoriteIds();
        $categories=Category::query()->where('level',0)->where('is_directory',1)->get();

        $categoryInfo=[];
        foreach ($categories as $category){
            $pcount=Product::query()->where('type',Product::TYPE_NORMAL)->whereIn('category_id',$category->child_ids)->count();
            $category['product_count']=$pcount;
            $categoryInfo[]=$category;
        }
        return view('products.index',
            [
                'products'=>$products,
                'filters'=>['search'=>$search,
                 'category_id'=>$category_id,
                 'order'=>$order],
                'skill_products'=>$actives,
                'favorite_Ids'=>$favorite_Ids,
                'categories'=>$categoryInfo
                ]);
    }
    public function show(Product $product,Request $request)
    {
        if(!$product->on_sale){
            throw new InvalidRequestException('商品未上架');
        }
        $favored=false;
        //$favored=boolval($favoriteProduct->find($product->id));

        $favorite_Ids=$this->productService->getFavoriteIds();
        if(in_array($product->id,$favorite_Ids)){
            $favored=true;
        }
        $reviews = $this->productService->getProductReviews($product->id,10);

        $similar_products=$this->productService->getProducts('','',$product->category_id);
        return view('products.product-details',[
            'product'=>$product->load(['pics','skus']),
            'favored'=>$favored,
            'reviews' => $reviews,
            'similar_products'=>$similar_products,
            'favorite_Ids'=>$favorite_Ids
        ]);
    }
    //商品收藏
    public function favor(Product $product,Request $request){
        return $this->productService->favor($product,$request);
    }
    //商品取消收藏
    public function disfavor(Product $product,Request $request){
        return $this->productService->disfavor($product,$request);
    }
    //收藏列表
    public function favorites(Request $request,UserService $service){
        $pageNum=$request->input('pageNo',6);
        $products=$service->userFavorites($request->user(),$pageNum);

        $pageNum=$request->input('pageNo',6);

        $products=$service->userFavorites($request->user(),$pageNum);

        $watchs=$this->productService->getProducts(Product::TYPE_NORMAL,'','',18,'id_desc','category');

        $favorite_Ids=$this->productService->getFavoriteIds();
        return view('favorites.index',['products'=>$products,'sproducts'=>$watchs,'favorite_Ids'=>$favorite_Ids]);
    }
}
