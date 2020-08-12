<?php

namespace App\Http\Controllers;

use App\Models\SeckillProduct;
use App\Services\ProductService;
use Carbon\Carbon;
use Illuminate\Http\Request;

class SeckillProductsController extends Controller
{
    public function index(){
        $seckills=SeckillProduct::query()->with(['product','product.skus'])->where('end_at','>=',Carbon::now())->orderBy('end_at','desc')->paginate(6);
        $favorite_Ids=app(ProductService::class)->getFavoriteIds();
        return view('seckills.index',['seckills'=>$seckills,'favorite_Ids'=>$favorite_Ids]);
    }
}
