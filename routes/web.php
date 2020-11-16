<?php

Auth::routes(['verify'=>true]);

Route::group(['middleware'=>['verified']],function (){
    Route::post('seckill_orders', 'OrdersController@seckill')->name('seckill_orders.store')->middleware('random_drop:100');
    Route::get('/home', 'HomeController@index')->name('home');
    Route::get('/', 'HomeController@index')->name('home');
    Route::get('/products','ProductsController@index')->name('products.index');
    Route::get('products/{product}','ProductsController@show')->name('products.show');
    Route::get('/crowdfundings','CrowdFundingsController@index')->name('crowdfunding_products.index');
    Route::get('/seckills','SeckillProductsController@index')->name('seckills.index');
    Route::get('/crowdfundings/{product}','CrowdFundingsController@show')->name('crowdfunding_products.show');
    Route::get('/discounts','DiscountsController@index')->name('discounts.index');

    Route::get('announces/{announce}', 'AnnouncesController@show')->name('announces.show');
    Route::get('announces', 'AnnouncesController@index')->name('announces.index');
    Route::get('borrows', 'BorrowsController@index')->name('borrows.index');
});
Route::group(['middleware'=>['verified','auth']],function (){
    Route::get('accounts','AccountsController@index')->name('accounts.index');
    Route::get('myborrow','BorrowsController@myBorrows')->name('borrows.myborrow');
    Route::get('borrow/{borrow}/repay','BorrowsController@borrowRepay')->name('borrows.repay.index');
    Route::get('invest/{invest}/repay','BorrowsController@investRepay')->name('invest.repay.index');

    Route::post('borrow/repay','BorrowsController@repay')->name('borrows.repay');
    Route::get('myinvest','BorrowsController@myInvests')->name('borrows.myinvest');
    Route::get('addresses','UserAddressesController@index')->name('addresses.index');
    Route::get('addresses/create','UserAddressesController@create')->name('addresses.create');
    Route::post('addresses','UserAddressesController@store')->name('addresses.store');
    Route::get('addresses/{userAddress}','UserAddressesController@edit')->name('addresses.edit');
    Route::put('addresses/{userAddress}','UserAddressesController@update')->name('addresses.update');
    Route::delete('addresses/{userAddress}','UserAddressesController@destroy')->name('addresses.delete');

    Route::post('products/{product}/favorite', 'ProductsController@favor')->name('products.favor');
    Route::delete('products/{product}/favorite', 'ProductsController@disfavor')->name('products.disfavor');
    Route::post('cart', 'CartController@store')->name('cart.store');
    Route::get('cart','CartController@index')->name('cart.index');
    Route::post('cart/update','CartController@update')->name('cart.update');
    Route::delete('cart/{sku}','CartController@remove')->name('cart.remove');
    Route::post('cart/add','CartController@addSimpleCart')->name('cart.addsimple');

    Route::post('orders', 'OrdersController@store')->name('orders.store');
    Route::get('orders', 'OrdersController@index')->name('orders.index');
    Route::get('orders/{order}', 'OrdersController@show')->name('orders.show');
    Route::get('payment/{order}/alipay', 'PaymentController@payByAlipay')->name('payment.alipay');
    Route::get('payment/alipay/return', 'PaymentController@alipayReturn')->name('payment.alipay.return');
    Route::get('payment/{order}/wechat', 'PaymentController@payByWechat')->name('payment.wechat');
    Route::post('payment/{order}/webself', 'PaymentController@payByWeb')->name('payment.webself');

    Route::post('orders/{order}/received', 'OrdersController@received')->name('orders.received');
    Route::get('orders/{order}/review','OrdersController@review')->name('orders.review.show');
    Route::post('orders/{order}/review','OrdersController@sendReview')->name('orders.review.store');

    Route::post('orders/{order}/apply_refund','PaymentController@applyRefund')->name('orders.apply_refund');

    Route::get('coupon_codes/{code}', 'CouponCodesController@show')->name('coupon_codes.show');
    Route::get('coupon_codes', 'CouponCodesController@index')->name('coupon_codes.index');

    Route::get('coupon_types', 'CouponTypesController@index')->name('coupon_types.index');
    Route::post('coupon_types/{couponType}','CouponTypesController@getCoupon')->name('coupon_types.getcoupon');
    Route::get('mycoupon', 'CouponTypesController@userCoupons')->name('accounts.coupon');
    Route::get('coupon/{code}', 'CouponTypesController@checkCoupon')->name('coupon.check');
    Route::get('favorites', 'ProductsController@favorites')->name('products.favorites');
    Route::post('crowdfunding_orders','OrdersController@crowdfunding')->name('crowdfunding_orders.store');

    Route::post('borrows', 'BorrowsController@invest')->name('borrows.invest');

    Route::get('users', 'UsersController@me')->name('users.me');

    Route::put('users', 'UsersController@update')->name('users.update');

    Route::get('users/deposit', 'UsersController@deposit')->name('users.deposit');
    Route::post('users/deposit', 'UsersController@depositUpdate')->name('users.deposit.update');

    Route::get('users/withdraw', 'UsersController@withdraw')->name('users.withdraw');

    Route::post('users/withdraw', 'UsersController@withdrawUpdate')->name('users.withdraw.update');
    Route::get('users/wallets', 'UsersController@wallets')->name('users.wallets');

});

Route::post('payment/alipay/notify', 'PaymentController@alipayNotify')->name('payment.alipay.notify');
Route::post('payment/wechat/notify', 'PaymentController@wechatNotify')->name('payment.wechat.notify');
Route::post('payment/wechat/refund_notify', 'PaymentController@wechatRefundNotify')->name('payment.wechat.refund_notify');

