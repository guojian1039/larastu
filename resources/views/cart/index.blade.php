@extends('layouts.app')
@section('title',"商品")
@section('content')
    <!-- Breadcrumb Area -->
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-grey">
            <li class="breadcrumb-item"><a href="{{ url('/') }}">首页</a></li>
            <li class="breadcrumb-item active" aria-current="page">我的购物车</li>
        </ol>
    </nav>
    <!--// Breadcrumb Area -->
    <!-- Page Conttent -->
    <main class="page-content">
        <!-- Shopping Cart Area -->
        <div class="cart-page-area ptb-30 bg-white">
            <div class="container">

                <!-- Cart Products -->
                <div class="cart-table table-responsive">
                    <table class="table table-bordered table-hover mb-0">
                        <thead>
                        <tr>
                            <th><input type="checkbox" id="select-all"></th>
                            <th class="cart-column-productname" scope="col">商品信息</th>
                            <th class="cart-column-price" scope="col">单价</th>
                            <th class="cart-column-quantity" scope="col">数量</th>
                            <th class="cart-column-total" scope="col">总价</th>
                            <th class="cart-column-remove" scope="col">操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        @foreach($cartItems as $item)
                            @if($item->productSku->product->on_sale)
                                <?php $total_amount+=$item->amount*$item->productSku->price ?>
                                @endif
                        <tr data-id="{{ $item->product_sku_id }}">
                            <td>
                                <input type="checkbox" name="select" value="{{ $item->productSku->id }}" {{ $item->productSku->product->on_sale ? 'checked' : 'disabled' }}>
                            </td>
                            <td class="product_info">
                                <div class="preview">
                                    <a target="_blank" href="{{ route('products.show', [$item->productSku->product_id]) }}">
                                        <img src="{{ $item->productSku->product->image_url }}">
                                    </a>
                                </div>
                                <div @if(!$item->productSku->product->on_sale) class="not_on_sale" @endif>
                                  <span class="product_title">
                                    <a target="_blank" href="{{ route('products.show', [$item->productSku->product_id]) }}">{{ $item->productSku->product->title }}</a>
                                  </span>
                                    <span class="sku_title">{{ $item->productSku->title }}</span>
                                    @if(!$item->productSku->product->on_sale)
                                        <span class="warning">该商品已下架</span>
                                    @endif
                                </div>
                            </td>
                            <td >￥<span class="sku-price">{{ $item->productSku->price }}</span></td>
                            <td>
                                <div class="quantity-select">
                                    <input type="text" name="amount" value="{{ $item->amount }}">
                                    <div class="inc qtybutton">+<i class="ion ion-ios-arrow-up"></i></div>
                                    <div class="dec qtybutton">-<i class="ion ion-ios-arrow-down"></i></div>
                                </div>
                            </td>
                            <td>
                                ￥<span class="total-price">{{ $item->productSku->price*$item->amount }}</span>
                            </td>
                            <td>
                                <button class="remove-product"><i class="ion ion-ios-close"></i></button>
                            </td>
                        </tr>

                        @endforeach

                        </tbody>
                    </table>
                </div>
                <!--// Cart Products -->

                <!-- Cart Content -->
                <div class="cart-content">
                    <div class="row justify-content-between">
                        <div class="col-lg-6 col-md-6 col-12">
                            <div class="cart-content-left">
                                <div class="ho-buttongroup">
                                    @if(count($cartItems)>0)
                                    <a href="#" class="ho-button ho-button-sm btn-update-cart">
                                        <span>更新购物车</span>
                                    </a>
                                    @endif
                                    <a href="{{ route('products.index') }}" class="ho-button ho-button-sm">
                                        <span>继续购物</span>
                                    </a>
                                </div>
                                @if(count($cartItems)>0)
                                <div class="cart-content-coupon">
                                    <h6>优惠券</h6>
                                    <p>请输入优惠券.</p>
                                    <form action="#" class="coupon-form">
                                        <input type="text" name="coupon_code" placeholder="Coupon code">
                                        <span class="form-text text-muted" id="coupon_desc"></span>
                                        <button  type="button" class="ho-button btn-success" id="btn-check-coupon">
                                            <span>使用</span>
                                        </button>
                                        <button type="button" class="btn btn-danger" style="display: none;" id="btn-cancel-coupon">取消</button>
                                    </form>
                                </div>
                                @endif
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="cart-content-right">
                                <h2>总计</h2>
                                <table class="cart-pricing-table">
                                    <tbody>
                                    <tr class="cart-subtotal">
                                        <th>物品</th>
                                        <td>￥<span class="goods_amount">{{ $total_amount }}</span> </td>
                                    </tr>
                                    <tr class="cart-shipping">
                                        <th>运费</th>
                                        <td>￥0.00</td>
                                    </tr>
                                    <tr class="cart-total">
                                        <th>总计</th>
                                        <td>￥<span class="total_amount">{{ $total_amount }}</span> </td>
                                    </tr>
                                    </tbody>
                                </table>
                                @if(count($cartItems)>0)
                                <a href="#" class="ho-button btn-order" data-toggle="modal" data-target="#orderModal">
                                    <span>下单</span>
                                </a>
                                <a href="#" class="ho-button btn-pay" data-toggle="modal" data-target="#payModal">
                                    <span>购买支付</span>
                                </a>
                                    @endif
                            </div>
                        </div>
                    </div>
                </div>
                <!--// Cart Content -->

            </div>
        </div>
        <!--// Shopping Cart Area -->

        <!-- Related Product Area -->
        <div class="ho-section related-product-area pb-30">
            <div class="container">
                <div class="section-title">
                    <h3>热门商品</h3>
                </div>
                @include('home.silder_product',['items'=>$sproducts,'sclass'=>'product-slider new-best-featured-slider slider-navigation-2','different_class'=>''])

            </div>
        </div>
        <!--// Related Product Area -->

        <!-- Newsletter Area -->
        <div class="ho-section newsletter-area bg-grey ptb-50">
            <div class="container">
                <div class="newsletter">
                    <div class="newsletter-title">
                        <h2>Subscribe to our <span>Newsletter!</span></h2>

                    </div>
                    <div class="newsletter-content">
                        <form id="mc-form" class="newsletter-form">
                            <input id="mc-email" type="email" autocomplete="off" placeholder="Your email address...">
                            <button id="mc-submit" type="submit">Subscribe</button>
                        </form>
                        <!-- mailchimp-alerts start -->
                        <div class="mailchimp-alerts text-centre">
                            <div class="mailchimp-submitting"></div><!-- mailchimp-submitting end -->
                            <div class="mailchimp-success"></div><!-- mailchimp-success end -->
                            <div class="mailchimp-error"></div><!-- mailchimp-error end -->
                        </div><!-- mailchimp-alerts end -->
                    </div>
                    <div class="newsletter-socialicons socialicons socialicons-radial">
                        <ul>
                            <li><a href="#"><i class="ion ion-logo-facebook"></i></a></li>
                            <li><a href="#"><i class="ion ion-logo-twitter"></i></a></li>
                            <li><a href="#"><i class="ion ion-logo-youtube"></i></a></li>
                            <li><a href="#"><i class="ion ion-logo-google"></i></a></li>
                            <li><a href="#"><i class="ion ion-logo-instagram"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--// Newsletter Area -->

    </main>
    <!--// Page Conttent -->
@endsection
@section('modal')
    <!-- 下订单框 -->
    <div class="modal fade" id="orderModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <!-- 模态框头部 -->
                <div class="modal-header">
                    <h4 class="modal-title">发货地址选择</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- 模态框主体 -->
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="order-form">
                        <div class="form-group row">
                            <label class="col-form-label col-sm-3 text-md-right">选择收货地址</label>
                            <div class="col-sm-9 col-md-7">
                                <select class="form-control" name="address">
                                    @foreach($addresses as $address)
                                        <option value="{{ $address->id }}">{{ $address->full_address }} {{ $address->contact_name }} {{ $address->contact_phone }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-3 text-md-right">备注</label>
                            <div class="col-sm-9 col-md-7">
                                <textarea name="remark" class="form-control" rows="3"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- 模态框底部 -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary btn-order-ok" style="margin-left: 10px;">确定</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="payModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <!-- 模态框头部 -->
                <div class="modal-header">
                    <h4 class="modal-title">支付信息</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- 模态框主体 -->
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="pay-form">
                        <div class="form-group row">
                            <label class="col-form-label col-sm-3 text-md-right">选择收货地址</label>
                            <div class="col-sm-9 col-md-7">
                                <select class="form-control" name="address_id">
                                    @foreach($addresses as $address)
                                        <option value="{{ $address->id }}">{{ $address->full_address }} {{ $address->contact_name }} {{ $address->contact_phone }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-3 text-md-right">支付方式</label>
                            <div class="col-sm-9 col-md-7">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="payment_method" id="ali" value="alipay" checked>
                                    <label class="form-check-label" for="ali">
                                       支付宝
                                    </label>
                                </div>

                                <div class="form-check disabled">
                                    <input class="form-check-input" type="radio" name="payment_method" id="we" value="wechat" disabled>
                                    <label class="form-check-label" for="we">
                                        微信
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-3 text-md-right">备注</label>
                            <div class="col-sm-9 col-md-7">
                                <textarea name="pay_remark" class="form-control" rows="3"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- 模态框底部 -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary btn-pay-ok" style="margin-left: 10px;">确定</button>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('scriptAfterJs')
    <script>
        (function ($) {

            /* Custom Selectbox */
            $('select').niceSelect();

            /* Product Details Slider Image */
            $('.pdetails-sliderimages').slick({
                slidesToShow: 3,
                autoplay: true,
                autoplaySpeed: 8000,
                speed: 1000,
                adaptiveHeight: true,
                fade: false,
                easing: 'ease-in-out',
                dots: false,
                arrows: true,
                prevArrow: '<span class="slider-navigation-arrow slider-navigation-prev"><i class="ion ion-ios-arrow-back"></i></span>',
                nextArrow: '<span class="slider-navigation-arrow slider-navigation-next"><i class="ion ion-ios-arrow-forward"></i></span>',
                responsive: [{
                    breakpoint: 992,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 1
                    }
                },
                    {
                        breakpoint: 576,
                        settings: {
                            slidesToShow: 1,
                            slidesToScroll: 1
                        }
                    }
                ]
            });

            $('.new-best-featured-slider').slick({
                slidesToShow: 5,
                autoplay: true,
                autoplaySpeed: 8000,
                speed: 1000,
                adaptiveHeight: true,
                fade: false,
                easing: 'ease-in-out',
                dots: false,
                arrows: true,
                prevArrow: '<span class="slider-navigation-arrow slider-navigation-prev"><i class="ion ion-ios-arrow-back"></i></span>',
                nextArrow: '<span class="slider-navigation-arrow slider-navigation-next"><i class="ion ion-ios-arrow-forward"></i></span>',
                responsive: [{
                    breakpoint: 1200,
                    settings: {
                        slidesToShow: 4,
                        slidesToScroll: 1
                    }
                },
                    {
                        breakpoint: 992,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 1
                        }
                    },
                    {
                        breakpoint: 768,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 1
                        }
                    },
                    {
                        breakpoint: 576,
                        settings: {
                            slidesToShow: 1,
                            slidesToScroll: 1
                        }
                    }
                ]
            });
            /* Product Details Image Slider */
            $('.pdetails-largeimages').slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                arrows: false,
                dots: false,
                fade: true,
                asNavFor: '.pdetails-thumbs'
            });

            $('.pdetails-thumbs:not(.pdetails-thumbs-vertical)').slick({
                slidesToShow: 4,
                slidesToScroll: 1,
                asNavFor: '.pdetails-largeimages',
                arrows: false,
                dots: false,
                focusOnSelect: true,
                vertical: false
            });

            $('.pdetails-thumbs-vertical').slick({
                slidesToShow: 4,
                slidesToScroll: 1,
                asNavFor: '.pdetails-largeimages',
                arrows: false,
                dots: false,
                focusOnSelect: true,
                centerMode: true,
                vertical: true,
                responsive: [{
                    breakpoint: 576,
                    settings: {
                        vertical: false,
                    }
                }]

            });

            /* Product Quantity */
            function productQuantity() {
                $('.quantity-select').append('<div class="dec qtybutton">-</i></div><div class="inc qtybutton">+</div>');
                $('.qtybutton').on('click', function () {
                    var $button = $(this);
                    var oldValue = $button.parent().find('input').val();
                    var newVal;
                    if ($button.text() == "+") {
                        newVal = parseFloat(oldValue) + 1;
                    } else {
                        if (oldValue > 1) {
                            newVal = parseFloat(oldValue) - 1;
                        } else {
                            newVal = 1;
                        }
                    }
                    $button.parent().find('input').val(newVal);
                    var price=$button.parent().parent().parent().find('.sku-price').text();
                    $button.parent().parent().parent().find('.total-price').text(newVal*price);
                    resetTotalAmount();
                });
            }
            productQuantity();


            $('.btn-update-cart').click(function () {
                var req = {
                    items: []
                };
                $('table tr[data-id]').each(function () {
                    // 获取当前行的单选框
                    var $checkbox = $(this).find('input[name=select][type=checkbox]');
                    // 如果单选框被禁用或者没有被选中则跳过
                    if ($checkbox.prop('disabled') || !$checkbox.prop('checked')) {
                        return;
                    }
                    // 获取当前行中数量输入框
                    var $input = $(this).find('input[name=amount]');
                    // 如果用户将数量设为 0 或者不是一个数字，则也跳过
                    if ($input.prop('value') == 0 || isNaN($input.prop('value'))) {
                        return;
                    }
                   var items=[];
                    req.items.push({sku_id:$(this).data('id'),amount:$input.prop('value')});
                });
                axios.post('cart/update',req).then(function () {
                    swal('更新成功','','success').then(function () {

                    });
                },function (error) {
                    if(error.response.status===401){
                        swal('请先登录','','error')
                    }else if(error.response.status===555 && error.response.data.message){
                        swal(error.response.data.message,'','error')
                    }else if(error.response.status===422){
                        var html='<div>';
                        _.each(error.respnse.errors,function (errors) {
                            _.each(errors,function (error) {
                                html+=error+'<br>';
                            })
                        })
                        html+='</div>';
                        swal({content:$(html)[0],icon:'error'});
                    }else
                    {
                        swal('系统错误','','error')
                    }
                })
            });

            $('.remove-product').click(function () {
                var $this=$(this).closest('tr');
                var sku_id=$this.data('id');
                swal({
                    title:'请确认移除该商品？',
                    icon:'warning',
                    buttons:['取消','确定'],
                    dangerMode:true
                }).then(function (willDelete) {
                    if(!willDelete) return;
                    axios.delete('cart/'+sku_id).then(function () {
                        $this.remove();
                        resetTotalAmount();
                    });
                })
               
            })
            function resetTotalAmount(){
                var total_amount=0;
                $('table tr[data-id]').each(function () {
                    // 获取当前行的单选框
                    var $checkbox = $(this).find('input[name=select][type=checkbox]');
                    // 如果单选框被禁用或者没有被选中则跳过
                    if ($checkbox.prop('disabled') || !$checkbox.prop('checked')) {
                        return;
                    }
                    // 获取当前行中数量输入框
                    var $input = $(this).find('input[name=amount]');
                    // 如果用户将数量设为 0 或者不是一个数字，则也跳过
                    if ($input.prop('value') == 0 || isNaN($input.prop('value'))) {
                        return;
                    }
                    var eachprice=$(this).find('.sku-price').text();
                    total_amount+=eachprice*$input.prop('value');
                });
                $('.goods_amount').text(total_amount);
                $('.total_amount').text(total_amount);
            }

            $('.btn-order-ok').click(function () {
                var req = {
                    address_id: $('#order-form').find('select[name=address]').val(),
                    items: [],
                    remark: $('#order-form').find('textarea[name=remark]').val(),
                    coupon_code: $('input[name=coupon_code]').val(),
                };
                $('table tr[data-id]').each(function () {
                    // 获取当前行的单选框
                    var $checkbox = $(this).find('input[name=select][type=checkbox]');
                    // 如果单选框被禁用或者没有被选中则跳过
                    if ($checkbox.prop('disabled') || !$checkbox.prop('checked')) {
                        return;
                    }
                    // 获取当前行中数量输入框
                    var $input = $(this).find('input[name=amount]');
                    // 如果用户将数量设为 0 或者不是一个数字，则也跳过
                    if ($input.prop('value') == 0 || isNaN($input.prop('value'))) {
                        return;
                    }
                    var items=[];
                    req.items.push({sku_id:$(this).data('id'),amount:$input.prop('value')});
                });
                if(req.items.length==0){
                    swal('购物车已空，请继续购物','','error').then(function () {
                        location.href='{{route('products.index')}}'
                    })
                }
                axios.post('{{ route('orders.store') }}',req).then(function (response) {
                    swal('下单成功','','success').then(function () {
                        console.log(response);
                       location.href='orders/'+response.data.id;
                    });
                },function (error) {
                    if(error.response.status===422){
                        var html='<div>';
                        _.each(error.response.data.errors,function (errors) {
                            _.each(errors,function (error) {
                                html+=error+'<br>';
                            });
                        });
                        html+='</div>';
                        swal({content:$(html)[0],icon:'error'});
                    }else if (error.response.status === 403) { // 这里判断状态 403
                        swal(error.response.data.msg, '', 'error');
                    } else {
                        swal('系统错误','','error');
                    }
                })
                $('#orderModal').modal('hide');
            });

            $('.btn-pay-ok').click(function () {

                var req = {
                    address_id: $('#pay-form').find('select[name=address_id]').val(),
                    items: [],
                    remark: $('#pay-form').find('textarea[name=pay_remark]').val(),
                    coupon_code: $('input[name=coupon_code]').val(),
                };
                $('table tr[data-id]').each(function () {
                    // 获取当前行的单选框
                    var $checkbox = $(this).find('input[name=select][type=checkbox]');
                    // 如果单选框被禁用或者没有被选中则跳过
                    if ($checkbox.prop('disabled') || !$checkbox.prop('checked')) {
                        return;
                    }
                    // 获取当前行中数量输入框
                    var $input = $(this).find('input[name=amount]');
                    // 如果用户将数量设为 0 或者不是一个数字，则也跳过
                    if ($input.prop('value') == 0 || isNaN($input.prop('value'))) {
                        return;
                    }
                    var items=[];
                    req.items.push({sku_id:$(this).data('id'),amount:$input.prop('value')});
                });
                if(req.items.length==0){
                    swal('购物车已空，请继续购物','','error').then(function () {
                        location.href='{{route('products.index')}}'
                    })
                }
                var payment_method=$('#pay-form').find('input[name=payment_method]').val();
                axios.post('{{ route('orders.store') }}',req).then(function (response) {
                    if(payment_method=='alipay'){
                        location.href='payment/'+response.data.id+'/'+payment_method;
                    }else{
                        //location.href='orders/'+response.data.id;
                        swal({
                            // content 参数可以是一个 DOM 元素，这里我们用 jQuery 动态生成一个 img 标签，并通过 [0] 的方式获取到 DOM 元素
                            content: $('<img src="'+'payment/'+response.data.id+'/'+payment_method+'" />')[0],
                            // buttons 参数可以设置按钮显示的文案
                            buttons: ['关闭', '已完成付款'],
                        })
                            .then(function(result) {
                                // 如果用户点击了 已完成付款 按钮，则重新加载页面
                                if (result) {
                                    location.reload();
                                }
                            })
                    }
                },function (error) {
                    if(error.response.status===422){
                        var html='<div>';
                        _.each(error.response.data.errors,function (errors) {
                            _.each(errors,function (error) {
                                html+=error+'<br>';
                            });
                        });
                        html+='</div>';
                        swal({content:$(html)[0],icon:'error'});
                    }else {
                        swal('系统错误','','error');
                    }
                })
            });


            // 检查按钮点击事件
            $('#btn-check-coupon').click(function () {
                // 获取用户输入的优惠码
                var code = $('input[name=coupon_code]').val();
                // 如果没有输入则弹框提示
                if(!code) {
                    swal('请输入优惠码', '', 'warning');
                    return;
                }
                // 调用检查接口
                axios.get('/coupon_codes/' + encodeURIComponent(code))
                    .then(function (response) {  // then 方法的第一个参数是回调，请求成功时会被调用
                        $('#coupon_desc').text(response.data.description); // 输出优惠信息
                        $('input[name=coupon_code]').prop('readonly', true); // 禁用输入框
                        $('#btn-cancel-coupon').show(); // 显示 取消 按钮
                        $('#btn-check-coupon').hide(); // 隐藏 检查 按钮
                    }, function (error) {
                        // 如果返回码是 404，说明优惠券不存在
                        if(error.response.status === 404) {
                            swal('优惠码不存在', '', 'error');
                        } else if (error.response.status === 403) {
                            // 如果返回码是 403，说明有其他条件不满足
                            swal(error.response.data.msg, '', 'error');
                        } else {
                            // 其他错误
                            swal('系统内部错误', '', 'error');
                        }
                    })
            });

            // 隐藏 按钮点击事件
            $('#btn-cancel-coupon').click(function () {
                $('#coupon_desc').text(''); // 隐藏优惠信息
                $('input[name=coupon_code]').prop('readonly', false);  // 启用输入框
                $('#btn-cancel-coupon').hide(); // 隐藏 取消 按钮
                $('#btn-check-coupon').show(); // 显示 检查 按钮
            });
            /* Header Cart */
            $('.header-carticon').on('click', function (e) {
                e.preventDefault();
                $(this).toggleClass('is-active');
                $('.header-minicart').slideToggle();
            });
            /* Accountbox */
            $('.header-accountbox-trigger').on('click', function () {
                $('.header-accountbox').slideToggle();
            });
            /* Custom Selectbox */
            $('select').niceSelect();
        })(jQuery);
    </script>

@endsection