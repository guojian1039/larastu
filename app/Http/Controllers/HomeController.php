<?php

namespace App\Http\Controllers;
use App\Models\ActiveProduct;
use App\Models\Ad;
use App\Models\Brand;
use App\Models\Category;
use App\Models\CrowdfundingProduct;
use App\Models\Product;
use App\Models\SeckillProduct;
use App\Models\User;
use App\Services\BorrowsService;
use App\Services\ProductService;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //$this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {
       //echo get_thumb_pic('e617fb3abde5cf8a3e0bb7fd8151ecff.jpg');
        //$s= $this->categoryService->getTopCategory();
         //exit();
        /*
        $info=  app('alipay')->app([
            'out_trade_no'=>time(),// 订单编号，需保证在商户端不重复
            'total_amount'=>1,// 订单金额，单位元，支持小数点后两位
            'subject'=>'支付单1元钱',// 订单标题
        ]);
        */
        /*
        $date1 = \Carbon\Carbon::parse('2020-03-06 12:22:00');
        $date2 = \Carbon\Carbon::parse('2020-03-05 12:21:00');

        $diff = $date1->diffInDays(Carbon::now(),false);

        var_dump($diff);
        exit();
        */
        $brands=Brand::all();
        $adrows=Ad::all();
        $ads=[];
        foreach ($adrows as $adrow)
        {
            $ads[$adrow->width.$adrow->height][]=$adrow;
        }
        $active_products=ActiveProduct::query()->where('end_at','>=',Carbon::now())->leftJoin('products','active_products.product_id','=','products.id')->get();
        $hot_products=Product::query()->where('recommend',1)->orderBy('id','desc')->limit(6)->get();
        $hots=[];
        $i=6;
        foreach ($hot_products as $hot_product)
        {
            if($i%3==0)
            {
                $hots[3][]=$hot_product;
            }
            else if($i%2==0)
            {
                $hots[2][]=$hot_product;
            }else
            {
                $hots[1][]=$hot_product;
            }
            $i--;
        }
        $sold_products=Product::query()->where('type',Product::TYPE_NORMAL)->orderBy('sold_count','desc')->limit(6)->get();
        $solds=[];
        $i=6;
        foreach ($sold_products as $sold_product)
        {
            if($i%3==0)
            {
                $solds[3][]=$sold_product;
            }
            else if($i%2==0)
            {
                $solds[2][]=$sold_product;
            }else
            {
                $solds[1][]=$sold_product;
            }
            $i--;
        }

        $review_products=Product::query()->where('type',Product::TYPE_NORMAL)->orderBy('review_count','desc')->limit(6)->get();
        $reviews=[];
        $i=6;
        foreach ($review_products as $review_product)
        {
            if($i%3==0)
            {
                $reviews[3][]=$review_product;
            }
            else if($i%2==0)
            {
                $reviews[2][]=$review_product;
            }else
            {
                $reviews[1][]=$review_product;
            }
            $i--;
        }

        $eproducts=Product::query()
            //->leftJoin('categories','products.category_id','=','categories.id')
            ->where('type',Product::TYPE_NORMAL)
            ->whereHas('category',function ($query){
                $query->where('path', 'like', "%-17-%")
                    ->orWhere('path', 'like', "%-24-%")
                    ->orWhere('path', 'like', "%-34-%") ;
            })->orderBy('id','desc')
        ->limit(18)->with('category')->get();


        $phones=[];
        $watchs=[];
        $books=[];
        foreach ($eproducts as $eproduct)
        {
            if( in_array(17,explode('-',$eproduct->category->path)) )
            {
                $books[]=$eproduct;
            }
            if( in_array(34,explode('-',$eproduct->category->path)) )
            {
                $watchs[]=$eproduct;
            }
            if( in_array(24,explode('-',$eproduct->category->path)) )
            {
                $phones[]=$eproduct;
            }
        }

        $skill_products=SeckillProduct::query()->where('start_at','<',Carbon::now())->where('end_at','>',Carbon::now())
            ->with('product')->orderBy('id','desc')->limit(9)->get();
        $i=6;
        $skills=[];
        foreach ($skill_products as $skill_product)
        {
            if($i%3==0)
            {
                $skills[3][]=$skill_product->product;
            }
            else if($i%2==0)
            {
                $skills[2][]=$skill_product->product;
            }else
            {
                $skills[1][]=$skill_product->product;
            }
            $i--;
        }
        $crowdfundings=[];
        $crowdfunding_products=CrowdfundingProduct::query()->with('product')->orderBy('id','desc')
            ->get();
        foreach ($crowdfunding_products as $crowdfunding_product)
        {
            $crowdfundings[]=$crowdfunding_product->product;
        }
        $favorite_Ids=app(ProductService::class)->getFavoriteIds();
        $categories=Category::query()->where('level',0)->where('is_directory',1)->get();

        $category=$categories->toArray();
        $j=0;
        for($i=0;$j<ceil(count($category));$i++)
        {
            $cateinfo[] =array_slice($category, $i * 3 ,3);
            $j=($i+1)*3;
        }
        /*
        if(Auth::check()){
                    Auth::user()->deposit(10000);
        }
*/
        /*
        if(Auth::check()){
            Auth::user()->withdraw(50);
        }
        */
        return view('home',[
            'brands'=>$brands,
            'ads'=>$ads,
            'active_products'=>$active_products,
            'hot_products'=>$hots,
            'sold_products'=>$solds,
            'review_products'=>$reviews,
            //'eproducts'=>$eproducts,
            'watchs'=>$watchs,
            'phones'=>$phones,
            'books'=>$books,
            'skill_products'=>$skills,
            'crowdfunding_products'=>$crowdfundings,
            'favorite_Ids'=>$favorite_Ids,
            'categories'=>$cateinfo
        ]);
    }
}
