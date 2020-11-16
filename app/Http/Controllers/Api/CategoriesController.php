<?php

namespace App\Http\Controllers\Api;

use App\Models\Adv;
use App\Models\Category;
use Illuminate\Http\Request;

class CategoriesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $list =Category::query()->get();
        return itemsMerge($list->toArray(), 0, 'id', 'parent_id', 'child');
    }

    public function cateTopAd(){
        $adv=Adv::query()->where('location',Adv::TYPE_APP_INDEX_HOT)
            ->orWhere('location',Adv::TYPE_APP_INDEX_NEW)
            ->orWhere('location',Adv::TYPE_APP_INDEX_RECOMMEND)
            ->orWhere('location',Adv::TYPE_APP_INDEX_TOP)->get();
        return $adv;
    }
    public function getUsedList(){
        $list =Category::query()->where('is_directory',false)->get();
        return $list;
    }
}
