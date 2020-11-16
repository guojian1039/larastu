<?php
namespace App\Http\Controllers\Api;
use App\Http\Resources\AnnounceResource;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\CrowdfundingProductResource;
use App\Http\Resources\SeckillProductResource;
use App\Models\Adv;
use App\Services\AnnouncesService;
use App\Services\CategoryService;
use Illuminate\Http\Request;
use App\Http\Resources\ProductResource;
use App\Models\Product;
use App\Services\ProductService;
class IndexController extends Controller
{
    protected $productService;
    protected $announcesService;
    protected $categoryService;
    public function __construct(ProductService $productService,AnnouncesService $announcesService,CategoryService $categoryService)
    {
        $this->productService=$productService;
        $this->announcesService=$announcesService;
        $this->categoryService=$categoryService;
    }
    public function index(Request $request)
    {
        $new_products=$this->productService->getProducts(Product::TYPE_NORMAL,'','',6);
        $product_new= ProductResource::collection($new_products);

        $discount_products=$this->productService->getProducts(Product::TYPE_DISCOUNT,'','',6);
        $product_hot= ProductResource::collection($discount_products);


        $sekill_products=$this->productService->seckillings(6);
        $product_recommend=SeckillProductResource::collection($sekill_products);

        $crowdfunding_products=$this->productService->crowdfundings(6);
        $guess_you_like=CrowdfundingProductResource::collection($crowdfunding_products);

        $announces=$this->announcesService->getList(3);
        $announce=AnnounceResource::collection($announces);

        $categorys=$this->categoryService->getTopCategory();
        $cate=CategoryResource::collection($categorys);

        $adv=Adv::query()->where('location',Adv::TYPE_APP_INDEX_HOT)
            ->orWhere('location',Adv::TYPE_APP_INDEX_NEW)
            ->orWhere('location',Adv::TYPE_APP_INDEX_RECOMMEND)
            ->orWhere('location',Adv::TYPE_APP_INDEX_TOP)->get();

        $data=[];
        foreach ($adv as $item){
            $item['cover']=url_image($item['cover']);
            if($item->location==Adv::TYPE_APP_INDEX_HOT)
            {
                $data['index_hot'][]=$item;
            }
            if($item->location==Adv::TYPE_APP_INDEX_NEW)
            {
                $data['index_new'][]=$item;
            }
            if($item->location==Adv::TYPE_APP_INDEX_RECOMMEND)
            {
                $data['index_recommend'][]=$item;
            }
            if($item->location==Adv::TYPE_APP_INDEX_TOP)
            {
                $data['index_top'][]=$item;
            }
        }
        return [
            'search' => [
                'hot_search_default' => $config['hot_search_default'] ?? '',
                // 默认搜索框内容
                'hot_search_list' => !empty($config['hot_search_list']) ? explode(',', $config['hot_search_list']) : []
                // 热门搜索
            ],
            'adv' =>$data, // 广告
            'cate' => $cate, // 首页推荐分类
            'announce' => $announce, // 公告
            'product_hot' => $product_hot, // 热门
            'product_recommend' =>$product_recommend, // 推荐
            'product_new' => $product_new, // 新品
            'guess_you_like' => $guess_you_like, // 猜你喜欢
            'config' => [
                'web_site_icp' => $config['web_site_icp'] ?? '',
                'copyright_companyname' => $config['copyright_companyname'] ?? '',
                'copyright_url' => $config['copyright_url'] ?? '',
                'copyright_desc' => $config['copyright_desc'] ?? '',
            ],
            'share' => [
                'share_title' => $config['share_title'] ?? '',
                'share_cover' => $config['share_cover'] ?? '',
                'share_desc' => $config['share_desc'] ?? '',
                'share_link' => $config['share_link'] ?? '',
            ]
        ];
    }
}
