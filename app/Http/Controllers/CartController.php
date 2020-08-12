<?php

namespace App\Http\Controllers;

use App\Exceptions\InternalException;
use App\Exceptions\InvalidRequestException;
use App\Http\Requests\AddCartRequest;
use App\Http\Requests\UpdateCartsRequest;
use App\Models\Product;
use App\Models\ProductSku;
use App\Services\CartService;
use App\Services\ProductService;
use Illuminate\Http\Request;

class CartController extends Controller
{
    protected $cartService;
    public function __construct(CartService $cartService)
    {
       $this->cartService=$cartService;
    }

    public function store(AddCartRequest $request)
    {
        $this->cartService->addCart($request->input('sku_id'),$request->input('amount'));
        return [];
    }

    public function index(Request $request)
    {

        $cartItems=$this->cartService->getCartItems();

        $total_amount=0;
        $addresses=$request->user()->addresses()->orderBy('last_used_at','desc')->get();

        $watchs=Product::query()
            //->leftJoin('categories','products.category_id','=','categories.id')
            ->where('type',Product::TYPE_NORMAL)
            //->where('category_id',24)
            ->orderBy('id','desc')
            ->limit(18)->with('category')->get();
        $favorite_Ids=app(ProductService::class)->getFavoriteIds();

        return view('cart.index',['cartItems'=>$cartItems,
            'addresses'=>$addresses,
            'total_amount'=>$total_amount,
            'sproducts'=>$watchs,
            'favorite_Ids'=>$favorite_Ids
        ]);
    }

    public function remove(ProductSku $sku,Request $request)
    {
        //$sku_id=$request->input('sku_id');
        $this->cartService->delCartItems($sku->id);
        return [];
    }
    public function update(UpdateCartsRequest $request){

        $rv=$this->cartService->updateCarts($request->input('items'));
        if($rv){
            return[];
        }
        throw new InternalException('系统错误',555);
    }
    public function addSimpleCart(Request $request){
        $product_id=$request->input('product_id');
        if(!$product_id){
            throw new InvalidRequestException('参数错误');
        }
        $this->cartService->addSimpleCart($product_id);
    }
}
