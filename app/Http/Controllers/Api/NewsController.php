<?php
namespace App\Http\Controllers\Api;
use App\Http\Requests\NewsRequest;
use App\Http\Resources\NewsResource;
use App\Models\News;
use App\Services\NewsService;
class NewsController extends Controller
{
    protected $newsService;
    public function __construct(NewsService $newsService)
    {
        $this->newsService=$newsService;
    }
    //新闻列表
    public function index(NewsRequest $request)
    {
        $category_id=$request->input('category_id',1);
        $news=$this->newsService->getNews($category_id,'','','');
        return NewsResource::collection($news);
    }
}
