<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Models\Brand;
use Illuminate\Http\Request;

class BrandsController extends Controller
{
    public function getBrandList(Request $request){
        return Brand::query()
            ->orderBy('id')
            ->get();
    }
}
