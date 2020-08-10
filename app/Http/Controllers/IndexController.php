<?php

namespace App\Http\Controllers;
use App\Models\ProductSku;
use Illuminate\Http\Request;

class IndexController extends Controller
{
    public function index(){
        $skus=ProductSku::query()->where('product_id',121)->get();
        return $skus;
        return view('index.index');
    }
}
