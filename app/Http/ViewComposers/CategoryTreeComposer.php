<?php
namespace App\Http\ViewComposers;

use App\Services\CartService;
use App\Services\CategoryService;
use Illuminate\View\View;

class CategoryTreeComposer
{
    protected $categoryService;
    protected $cartService;

    // 使用 Laravel 的依赖注入，自动注入我们所需要的 CategoryService 类
    public function __construct(CategoryService $categoryService,CartService $cartService)
    {
        $this->categoryService = $categoryService;
        $this->cartService = $cartService;
    }

    // 当渲染指定的模板时，Laravel 会调用 compose 方法
    public function compose(View $view)
    {
        // 使用 with 方法注入变量
        $view->with('topCategorys', $this->categoryService->getTopCategory());
        $view->with('minicarts',$this->cartService->getCartItems());
        $view->with('mini_total_amount',0);

    }
}