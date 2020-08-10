<?php
namespace App\Services;
use App\Models\Category;
use Cache;
class CategoryService{
    public function getTopCategory(){
         $cache_key = 'topCategory';
         $cache_expire_in_seconds = 65 * 60;
        return Cache::remember($cache_key, $cache_expire_in_seconds, function(){
           return Category::query()->where('level',0)->orderBy('id')->get();
        });
    }
}