<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
/*
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
*/
Route::prefix('v1')
    ->namespace('Api')
    ->name('api.v1.')
    //->middleware('throttle:1,1')
    ->group(function() {

    Route::get('version', function() {
        abort(403, 'haha');
        return 'this is version v1';
    })->name('version');

    Route::get('version', function() {
        $sms = app('easysms');
        try {
            $sms->send(15165108623, [
                'template' => 'SMS_50025066',
                'data' => [
                    'code' => 61234
                ],
            ]);
        } catch (\Overtrue\EasySms\Exceptions\NoGatewayAvailableException $exception) {
            $message = $exception->getException('aliyun')->getMessage();
            dd($message);
        }
    });
        Route::middleware('throttle:'.config('api.rate_limits.sign'))->group(function (){
            //获取手机验证码
            Route::post('verificationCodes','VerificationCodesController@store')->name('verificationCodes.store');
            //获取图片验证码
            Route::post('captchas','CaptchasController@store')->name('captchas.store');
            //用户注册
            Route::post('users','UsersController@store')->name('users.store');
            //第三方登录
            Route::post('socials/{social_type}/authorizations','AuthorizationsController@socialStore')->where('social_type','weixin|weibo')
                ->name('socials.authorization.store');
            //登录
            Route::post('authorizations','AuthorizationsController@store')->name('authorizations.store');
            // 小程序登录
            Route::post('phone/authorizations', 'AuthorizationsController@phoneStore')
                ->name('phone.authorizations.store');
            //手机验证码登录
            Route::post('weapp/authorizations', 'AuthorizationsController@weappStore')
                ->name('weapp.authorizations.store');
            //刷新token
            Route::put('authorizations','AuthorizationsController@update')->name('authorizations.update');
            //删除token
            Route::delete('authorizations','AuthorizationsController@destroy')->name('authorizations.delete');
        });
        Route::middleware('throttle:'.config('api.rate_limits.access'))->group(function (){
            // 某个用户的详情
            Route::get('users/{user}', 'UsersController@show')->name('users.show');

            //auth:api 登录权限认证
            Route::middleware(['auth:api'])->group(function (){
                //获取登录用户资料
                Route::get('user','UsersController@me')->name('user.show');
                //获取登录用户账户资金信息
                Route::get('account','UsersController@account')->name('user.account');
                //账单明细
                Route::get('bills','UsersController@bills')->name('user.account.bills');

                // 上传保存图片
                Route::post('images', 'ImagesController@store')->name('images.store');
                //上传图片
                Route::post('upload','ImagesController@upload')->name('images.upload');
                //修改用户信息
                Route::put('user','UsersController@update')->name('users.update');
                //收藏
                Route::post('products/{product}/favorite', 'ProductsController@favor')->name('api.products.favor');
                //取消收藏
                Route::delete('products/{product}/favorite', 'ProductsController@disfavor')->name('api.products.disfavor');

                Route::get('products/{product}/review_lables','ProductsController@getReviews')->name('api.product.reviews');
                Route::get('products/{product}/reviews','ProductsController@reviews')->name('api.product.reviews');
                //商品详情1、登录用户可以查看是否收藏，进行收藏操作
                Route::get('products/isfavorite', 'ProductsController@isFavorite')->name('products.isFavorite');
                Route::get('favorites','UsersController@favorites')->name('user.favorites');

                Route::get('footprints','UsersController@footprints')->name('user.footprints');
                Route::get('getGuessYouLike','UsersController@getGuessYouLike')->name('user.like');

                Route::get('addresses','UserAddressesController@index')->name('api.addresses.index');
                Route::post('addresses','UserAddressesController@store')->name('api.addresses.store');
                Route::get('addresses/{userAddress}','UserAddressesController@edit')->name('api.addresses.edit');
                Route::put('addresses/{userAddress}','UserAddressesController@update')->name('api.addresses.update');
                Route::delete('addresses/{userAddress}','UserAddressesController@destroy')->name('api.addresses.delete');

                Route::post('orders', 'OrdersController@store')->name('api.orders.store');
                Route::get('orders', 'OrdersController@index')->name('api.orders.index');
                Route::get('orders/{order}', 'OrdersController@show')->name('api.orders.show');
                Route::post('orders/{order}/close', 'OrdersController@orderClose')->name('api.orders.close');
                Route::post('orders/{order}/received', 'OrdersController@received')->name('api.orders.received');
                Route::delete('orders/{order}/delete', 'OrdersController@orderDelete')->name('api.orders.delete');
                Route::post('orders/{order}/applyRefund', 'OrdersController@applyRefund')->name('api.orders.applyRefund');
                Route::post('orders/{order}/closeApplyRefund', 'OrdersController@closeApplyRefund')->name('api.orders.closeApplyRefund');
                Route::post('orders/{order}/review','OrdersController@sendReview')->name('api.orders.review.store');
                Route::get('orders/{order}/ship','OrdersController@getShip')->name('api.orders.ship');

                Route::post('cart', 'CartController@store')->name('cart.store');
                //Route::put('cart', 'CartController@update')->name('cart.update');
                Route::delete('cart', 'CartController@remove')->name('cart.delete');
                Route::get('cart', 'CartController@index')->name('cart.index');
                Route::post('cart/sku', 'CartController@changeCartsSku')->name('cart.changeSku');
                Route::post('cart/amount', 'CartController@cartItemUpdateNum')->name('cart.amount');
                Route::get('cart/count','CartController@cartCount')->name('cart.count');
                Route::get('cart/order','CartController@orderPreview')->name('cart.order');

                Route::get('notificationsType', 'NotifiablesController@index')->name('notificationsType.index');
                Route::get('notifications/stats', 'NotifiablesController@notificationStats')->name('notifications.notificationStats');
                Route::get('notifications', 'NotifiablesController@getNotifyList')->name('notifications.notificationStats');
                Route::delete('notifications', 'NotifiablesController@destroy')->name('notifications.delete');
                Route::post('user/openid', 'UsersController@getOpenid')->name('user.getOpenid');


                Route::get('invoices','UserInvoicesController@index')->name('api.invoices.index');
                Route::post('invoices','UserInvoicesController@store')->name('api.invoices.store');
                Route::get('invoices/{userInvoice}','UserInvoicesController@edit')->name('api.invoices.edit');
                Route::put('invoices/{userInvoice}','UserInvoicesController@update')->name('api.invoices.update');
                Route::delete('invoices/{userInvoice}','UserInvoicesController@destroy')->name('api.invoices.delete');

                Route::get('orderinvoices','OrderInvoicesController@index')->name('orderinvoices.index');
                Route::post('orderinvoices/{invoice}','OrderInvoicesController@store')->name('orderinvoices.store');
                //Route::delete('orderinvoices/{orderInvoices}','OrderInvoicesController@destroy')->name('orderinvoices.delete');

                Route::get('siteopinions','SiteOpinionsController@getUserList')->name('siteopinions.list');
                Route::post('siteopinions','SiteOpinionsController@store')->name('siteopinions.store');
                Route::get('siteopinions/{opinion}','SiteOpinionsController@show')->name('siteopinions.show');

                Route::get('coupons','CouponsController@index')->name('coupons.index');
                Route::get('usercoupons','CouponsController@userCoupons')->name('coupons.usercoupons');
                Route::post('coupons/{couponType}','CouponsController@getCoupon')->name('coupons.getcoupon');
                Route::get('usercoupons/count','CouponsController@userCouponCount')->name('coupons.userCouponCount');
                Route::get('payment/{order}/web','PaymentController@payByWeb')->name('payment.web');

            });
            Route::get('comm/getArea', 'CommController@getArea')
                ->name('comm.getArea');

            //商品浏览没有认证功能
            Route::get('products', 'ProductsController@index')
                ->name('products.index');
            Route::get('index', 'IndexController@index')
                ->name('index');
            Route::get('seckills', 'ProductsController@getSeckillings')
                ->name('seckills.index');
            Route::get('crowdfundings', 'ProductsController@getCrowdfundings')
                ->name('crowdfundings.index');
            Route::get('discounts', 'ProductsController@discounts')
                ->name('discounts.index');
            Route::get('categories', 'CategoriesController@index')
                ->name('categories.index');
            Route::get('catetopad', 'CategoriesController@cateTopAd')
                ->name('categories.catetopad');
            Route::get('brands', 'BrandsController@getBrandList')
                ->name('brands.list');
            Route::get('usecategories', 'CategoriesController@getUsedList')
                ->name('categories.usecategories');


            Route::get('products/{product}', 'ProductsController@show')->name('products.show')->where('product','[0-9]+');


            //商城公告
            Route::get('annouces', 'AnnouncesController@index')->name('annouces.index');
            Route::get('annouces/{announce}', 'AnnouncesController@show')->name('annouces.show');

            //站点帮助
            Route::get('sitehelps', 'SitehelpsController@index')->name('sitehelps.index');
            Route::get('sitehelps/{sitehelp}', 'SitehelpsController@show')->name('sitehelps.show');

            Route::middleware('parse.token')->group(function (){


            });
        });
});
