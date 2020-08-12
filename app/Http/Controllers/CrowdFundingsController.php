<?php

namespace App\Http\Controllers;

use App\Models\CrowdfundingProduct;
use App\Models\OrderItem;
use App\Models\Product;
use App\Services\ProductService;
use Illuminate\Http\Request;

class CrowdFundingsController extends Controller
{
    public function index(Request $request){
        $crowdfundings=CrowdfundingProduct::query()->with('product')->orderBy('end_at','desc')->paginate(6);
        return view('crowdfundings.index',['crowdfundings'=>$crowdfundings]);
    }
    public function show(Product $product){
        if(!$product->on_sale){
            throw new InvalidRequestException('商品未上架');
        }
        $favored=false;
        //$favored=boolval($favoriteProduct->find($product->id));

        $favorite_Ids=app(ProductService::class)->getFavoriteIds();
        if(in_array($product->id,$favorite_Ids)){
            $favored=true;
        }
        $reviews = OrderItem::query()
            ->with(['order.user', 'productSku']) // 预先加载关联关系
            ->where('product_id', $product->id)
            ->whereNotNull('reviewed_at') // 筛选出已评价的
            ->orderBy('reviewed_at', 'desc') // 按评价时间倒序
            ->limit(10) // 取出 10 条
            ->get();

        return view('crowdfundings.show',[
            'product'=>$product->load(['pics','skus','crowdfunding']),
            'favored'=>$favored,
            'reviews' => $reviews
        ]);
    }
}
