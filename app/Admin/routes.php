<?php

use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Route;
use Dcat\Admin\Admin;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index');
    $router->get('/users', 'UsersController@index');
    $router->get('/addresses', 'UserAddressController@index');
    $router->get('/categories','CategoryController@index');
    $router->get('/categories/create','CategoryController@create');

    $router->get('/api/categories', 'CategoryController@apiIndex');
    $router->get('categories/{id}/edit','CategoryController@edit');
    $router->post('categories','CategoryController@store');
    $router->put('categories/{id}','CategoryController@update');
    $router->delete('categories/{id}','CategoryController@destroy');

    $router->get('/ads','AdsController@index');
    $router->get('/ads/create','AdsController@create');
    $router->get('ads/{id}/edit','AdsController@edit');
    $router->post('ads','AdsController@store');
    $router->put('ads/{id}','AdsController@update');
    $router->delete('ads/{id}','AdsController@destroy');

    $router->get('/brands','BrandsController@index');
    $router->get('/brands/create','BrandsController@create');
    $router->get('brands/{id}/edit','BrandsController@edit');
    $router->post('brands','BrandsController@store');
    $router->put('brands/{id}','BrandsController@update');
    $router->delete('brands/{id}','BrandsController@destroy');

    $router->get('/products','ProductsController@index');
    $router->get('/products/create','ProductsController@create');
    $router->get('products/{id}','ProductsController@show')->where('id', '[0-9]+');
    $router->get('products/{id}/edit','ProductsController@edit');
    $router->post('products','ProductsController@store');
    $router->put('products/{id}','ProductsController@update');
    $router->delete('products/{id}','ProductsController@destroy');

    $router->get('/skus/create','ProductSkuController@create');
    $router->get('skus/{id}/edit','ProductSkuController@edit');
    $router->post('skus','ProductSkuController@store');
    $router->put('skus/{id}','ProductSkuController@update');
    $router->delete('skus/{id}','ProductSkuController@destroy');

    $router->get('crowdfunding_products', 'CrowdfundingProductsController@index');
    $router->get('crowdfunding_products/create', 'CrowdfundingProductsController@create');
    $router->post('crowdfunding_products', 'CrowdfundingProductsController@store');
    $router->get('crowdfunding_products/{id}/edit', 'CrowdfundingProductsController@edit');
    $router->put('crowdfunding_products/{id}', 'CrowdfundingProductsController@update');
    $router->delete('crowdfunding_products/{id}', 'CrowdfundingProductsController@destroy');
    $router->get('crowdfunding_products/{id}', 'CrowdfundingProductsController@show')->where('id','[0-9]+');

    $router->get('seckill_products', 'SeckillProductsController@index');
    $router->get('seckill_products/create', 'SeckillProductsController@create');
    $router->post('seckill_products', 'SeckillProductsController@store');
    $router->get('seckill_products/{id}/edit', 'SeckillProductsController@edit');
    $router->put('seckill_products/{id}', 'SeckillProductsController@update');
    $router->get('seckill_products/{id}', 'SeckillProductsController@show')->where('id','[0-9]+');
    $router->delete('seckill_products/{id}', 'SeckillProductsController@destroy');

    $router->get('active_products', 'ActiveProductsController@index');
    $router->get('active_products/create', 'ActiveProductsController@create');
    $router->post('active_products', 'ActiveProductsController@store');
    $router->get('active_products/{id}/edit', 'ActiveProductsController@edit');
    $router->put('active_products/{id}', 'ActiveProductsController@update');
    $router->get('active_products/{id}', 'ActiveProductsController@show')->where('id','[0-9]+');
    $router->delete('active_products/{id}', 'ActiveProductsController@destroy');

    $router->get('discount_products', 'DiscountProductsController@index');
    $router->get('discount_products/create', 'DiscountProductsController@create');
    $router->post('discount_products', 'DiscountProductsController@store');
    $router->get('discount_products/{id}/edit', 'DiscountProductsController@edit');
    $router->put('discount_products/{id}', 'DiscountProductsController@update');
    $router->get('discount_products/{id}', 'DiscountProductsController@show')->where('id','[0-9]+');
    $router->delete('discount_products/{id}', 'DiscountProductsController@destroy');

    //$router->put('pics/{id}', 'PicsController@index');
    /*
    $router->delete('pics/{id}', 'PicsController@destroy');
    $router->get('pics/create', 'PicsController@create');
    $router->post('pics', 'PicsController@store');
    */
    $router->get('coupon_codes', 'CouponCodesController@index');
    $router->post('coupon_codes', 'CouponCodesController@store');
    $router->get('coupon_codes/create', 'CouponCodesController@create');
    $router->get('coupon_codes/{id}/edit', 'CouponCodesController@edit');
    $router->put('coupon_codes/{id}', 'CouponCodesController@update');
    $router->delete('coupon_codes/{id}', 'CouponCodesController@destroy');

    $router->get('orders', 'OrdersController@index')->name('admin.orders.index');
    $router->get('orders/{order}', 'OrdersController@show')->name('admin.orders.show');
    $router->post('orders/{order}/ship', 'OrdersController@ship')->name('admin.orders.ship');
    $router->post('orders{order}/refund','OrdersController@handleRefund')->name('admin.orders.handle_refund');

});
