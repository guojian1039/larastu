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
    $router->get('/api/allCategories', 'CategoryController@allCategories');

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

    $router->get('/advs','AdvController@index');
    $router->get('/advs/create','AdvController@create');
    $router->get('advs/{id}/edit','AdvController@edit');
    $router->post('advs','AdvController@store');
    $router->put('advs/{id}','AdvController@update');
    $router->delete('advs/{id}','AdvController@destroy');

    $router->get('/brands','BrandsController@index');
    $router->get('/brands/create','BrandsController@create');
    $router->get('brands/{id}/edit','BrandsController@edit');
    $router->post('brands','BrandsController@store');
    $router->put('brands/{id}','BrandsController@update');
    $router->delete('brands/{id}','BrandsController@destroy');
    $router->get('/api/brands', 'BrandsController@brands');

    $router->get('/products','ProductsController@index');
    $router->get('/products/create','ProductsController@create');
    $router->get('products/{id}','ProductsController@show')->where('id', '[0-9]+');
    $router->get('products/{id}/edit','ProductsController@edit');
    $router->post('products','ProductsController@store');
    $router->put('products/{id}','ProductsController@update');
    $router->delete('products/{id}','ProductsController@destroy');
    $router->get('products/{id}/properties','ProductsController@properties');
    $router->post('products/{id}/properties','ProductsController@storeProperty');
    $router->delete('products/{id}/properties','ProductsController@deleteProperty');
    $router->get('products/{id}/skuproperties','ProductsController@skuProperties');
    $router->post('products/{id}/skuproperties','ProductsController@storeSkuProperty');
    $router->delete('products/{id}/skuproperties','ProductsController@deleteSkuProperty');

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

    $router->get('base_properties', 'BasePropertysController@index');
    $router->post('base_properties', 'BasePropertysController@store');
    $router->get('base_properties/create', 'BasePropertysController@create');
    $router->get('base_properties/{id}/edit', 'BasePropertysController@edit');
    $router->put('base_properties/{id}', 'BasePropertysController@update');
    //$router->delete('base_properties/{id}', 'BasePropertysController@destroy');

    $router->get('suppliers', 'SuppliersController@index');
    $router->post('suppliers', 'SuppliersController@store');
    $router->get('suppliers/create', 'SuppliersController@create');
    $router->get('suppliers/{id}/edit', 'SuppliersController@edit');
    $router->put('suppliers/{id}', 'SuppliersController@update');
    $router->delete('suppliers/{id}', 'SuppliersController@destroy');
    $router->get('/api/suppliers', 'SuppliersController@suppliers');

    $router->get('coupon_types', 'CouponTypesController@index');
    $router->post('coupon_types', 'CouponTypesController@store');
    $router->get('coupon_types/create', 'CouponTypesController@create');
    $router->get('coupon_types/{id}/edit', 'CouponTypesController@edit');
    $router->get('coupon_types/{id}', 'CouponTypesController@show');
    $router->put('coupon_types/{id}', 'CouponTypesController@update');

    $router->get('sitehelp_types', 'SitehelpTypesController@index');
    $router->post('sitehelp_types', 'SitehelpTypesController@store');
    $router->get('sitehelp_types/create', 'SitehelpTypesController@create');
    $router->get('sitehelp_types/{id}/edit', 'SitehelpTypesController@edit');
    $router->put('sitehelp_types/{id}', 'SitehelpTypesController@update');

    $router->get('sitehelps', 'SitehelpsController@index');
    $router->post('sitehelps', 'SitehelpsController@store');
    $router->get('sitehelps/create', 'SitehelpsController@create');
    $router->get('sitehelps/{id}', 'SitehelpsController@show');
    $router->get('sitehelps/{id}/edit', 'SitehelpsController@edit');
    $router->put('sitehelps/{id}', 'SitehelpsController@update');

    $router->get('site_opinions', 'SiteOpinionsController@index');
    $router->post('site_opinions', 'SiteOpinionsController@store');
    //$router->get('site_opinions/create', 'SiteOpinionsController@create');
    $router->get('site_opinions/{id}', 'SiteOpinionsController@show');
    $router->put('site_opinions/{id}', 'SiteOpinionsController@update');

    $router->get('announces', 'AnnouncesController@index');
    $router->post('announces', 'AnnouncesController@store');
    $router->get('announces/create', 'AnnouncesController@create');
    $router->get('announces/{id}/edit', 'AnnouncesController@edit');
    $router->get('announces/{id}', 'AnnouncesController@show');
    $router->put('announces/{id}', 'AnnouncesController@update');

    $router->get('/api/newsCategory', 'NewsCategoriesController@getCategories');

    $router->get('news_category', 'NewsCategoriesController@index');
    $router->post('news_category', 'NewsCategoriesController@store');
    $router->get('news_category/create', 'NewsCategoriesController@create');
    $router->get('news_category/{id}/edit', 'NewsCategoriesController@edit');
    $router->put('news_category/{id}', 'NewsCategoriesController@update');

    $router->get('news', 'NewsController@index');
    $router->post('news', 'NewsController@store');
    $router->get('news/create', 'NewsController@create');
    $router->get('news/{id}/edit', 'NewsController@edit');
    $router->get('news/{id}', 'NewsController@show');
    $router->put('news/{id}', 'NewsController@update');


    $router->get('companies', 'CompaniesController@index');
    $router->post('companies', 'CompaniesController@store');
    $router->get('companies/create', 'CompaniesController@create');
    $router->get('companies/{id}/edit', 'CompaniesController@edit');
    $router->get('companies/{id}', 'CompaniesController@show');
    $router->put('companies/{id}', 'CompaniesController@update');

    $router->get('borrows', 'BorrowsController@index');
    $router->post('borrows', 'BorrowsController@store');
    $router->get('borrows/create', 'BorrowsController@create');
    $router->get('borrows/{id}/edit', 'BorrowsController@edit');
    $router->get('borrows/{id}', 'BorrowsController@show');
    $router->put('borrows/{id}', 'BorrowsController@update');
    $router->get('borrows/{id}/check', 'BorrowsController@check');
    $router->get('borrows/{id}/binfo', 'BorrowsController@binfo');
    $router->post('borrows/{id}/binfo', 'BorrowsController@storeBinfo');
    $router->any('comm/files', 'FileController@handle');
});
