@extends('layouts.app')
@section('title',"商品")
@section('content')
    <!-- Breadcrumb Area -->
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-grey">
            <li class="breadcrumb-item"><a href="{{ route('home') }}">首页</a></li>
            <li class="breadcrumb-item active" aria-current="page">商品</li>
        </ol>
    </nav>
    <!--// Breadcrumb Area -->
    <!-- Page Conttent -->
    <main class="page-content">
        <!-- Shop Page Area -->
        <div class="shop-page-area bg-white ptb-30">
            <div class="container">
                <div class="banner-area">
                    <div class="imgbanner imgbanner-2">
                        <a href="{{ route('products.index') }}">
                            <img src="images/banner/banner-image-20.jpg" alt="banner">
                        </a>
                    </div>
                </div>

                <div class="shop-filters mt-30">
                    <div class="shop-filters-viewmode">
                        <button class="is-active" data-view="grid"><i class="ion ion-ios-keypad"></i></button>
                        <!--<button data-view="list"><i class="ion ion-ios-list"></i></button>-->
                    </div>
                    <span class="shop-filters-viewitemcount">正秒杀商品</span>
                    <div class="shop-filters-sortby">
                        <b>排序:</b>
                        <div class="select-sortby">
                            <button class="select-sortby-current">综合</button>
                            <ul class="select-sortby-list dropdown-list">
                                <li><a href="#">综合</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="shop-page-products mt-30">
                    <div class="row no-gutters">
                        @foreach($seckills as $seckill)
                            <div class="col-lg-4 col-md-4 col-sm-6 col-12">
                                <!-- Single Product -->
                                <article class="hoproduct">
                                    <div class="hoproduct-image">
                                        <a class="hoproduct-thumb" href="{{ route('products.show',[$seckill->product->id]) }}">
                                            <img class="hoproduct-frontimage" src="{{ $seckill->product->image_url }}"
                                                 alt="product image">
                                            <img class="hoproduct-backimage" src="{{ $seckill->product->image_url }}"
                                                 alt="product image">
                                        </a>
                                        <ul class="hoproduct-actionbox">
                                            @if(Auth::check() && $seckill->start_at<=\Carbon\Carbon::now() && $seckill->end_at>=\Carbon\Carbon::now())
                                               <!-- <li><a href="javascript:void(0);" data-id="{{ $seckill->product->id }}"><i class="lnr lnr-cart"></i></a></li>-->
                                            @endif
                                            <li><a href="javascript:void(0);" class="quickview-trigger"><i class="lnr lnr-eye"></i></a></li>
                                            @if(Auth::check())
                                                <li><a href="javascript:void(0); " class="{{ in_array($seckill->product->id,$favorite_Ids)?'is-active':'' }}" title="{{ in_array($seckill->product->id,$favorite_Ids)?'取消收藏':'收藏' }}" data-id="{{ $seckill->product->id }}"><i class="lnr lnr-heart"></i></a></li>
                                            @endif
                                        </ul>
                                        <ul class="hoproduct-flags">
                                            <!-- <li class="flag-pack">New</li>-->
                                            @if($seckill->product->discount_num>0)
                                                <li class="flag-discount">{{ 100-$seckill->product->discount_num }}%</li>
                                            @endif
                                        </ul>
                                    </div>
                                    <div class="hoproduct-countdown countdown" data-id="{{ count($seckill->product->skus)==1? $seckill->product->skus[0]->id:''}}" data-endat="{{ $seckill->end_at }}" data-countdown="{{ $seckill->start_at>\Carbon\Carbon::now()?$seckill->start_at:$seckill->end_at }}"></div>
                                    <div class="hoproduct-content">
                                        <h5 class="hoproduct-title"><a href="{{ route('products.show',[$seckill->product->id]) }}">{{ $seckill->product->title }}</a></h5>
                                        <div class="hoproduct-rattingbox">
                                            <div class="rattingbox">
                                                <span class="active"><i class="ion ion-ios-star"></i></span>
                                                <span class="active"><i class="ion ion-ios-star"></i></span>
                                                <span class="active"><i class="ion ion-ios-star"></i></span>
                                                <span class="active"><i class="ion ion-ios-star"></i></span>
                                                <span class="active"><i class="ion ion-ios-star"></i></span>
                                            </div>
                                        </div>
                                        <div class="hoproduct-pricebox">
                                            <div class="pricebox">
                                                @if($seckill->product->discount_num)
                                                    <del class="oldprice">￥{{ $seckill->product->original_price }}</del>
                                                @endif
                                                <span class="price">￥{{ $seckill->product->price }}</span>
                                            </div>
                                        </div>
                                        @if(count($seckill->product->skus)==1)
                                        <div class="hoproduct-rattingbox float-right">
                                            <button  id="sec{{ $seckill->product->skus[0]->id }}" class="btn-danger {{ $seckill->start_at<=\Carbon\Carbon::now() && $seckill->end_at>\Carbon\Carbon::now()?'btn-cart':'' }}">
                                                <!--<i class="lnr lnr-cart"></i>-->
                                                <span>
                                                    @if($seckill->start_at<\Carbon\Carbon::now() && $seckill->end_at>\Carbon\Carbon::now())
                                                        立即抢购
                                                        @elseif($seckill->start_at>\Carbon\Carbon::now())
                                                            抢购倒计时中
                                                        @else
                                                        抢购已结束
                                                    @endif
                                                </span>
                                            </button>
                                        </div>
                                        @endif
                                        <p class="hoproduct-content-description">{{ $seckill->product->description }}</p>
                                    </div>
                                </article>
                                <!--// Single Product -->
                            </div>
                        @endforeach

                    </div>
                </div>



            </div>

        </div>
        <div class="bg-white" style="margin-top: 10px;"> {{ $seckills->render() }}</div>

        <!--// Shop Page Area -->

    </main>
    <!--// Page Conttent -->
@endsection
@section('scriptAfterJs')
    <script>
         (function ($) {
            'use strict';
            /* Mobile Menu */
            $('nav.ho-navigation').meanmenu({
                meanMenuOpen: '<i class="flaticon-menu"></i>',
                meanMenuClose: '<i class="flaticon-cancel"></i>',
                meanMenuCloseSize: '18px',
                meanScreenWidth: '991',
                meanExpandableChildren: true,
                meanMenuContainer: '.mobile-menu',
                onePage: true
            });
            /* Custom Selectbox */
            $('select').niceSelect();

            /* Accountbox */
            $('.header-accountbox-trigger').on('click', function () {
                $('.header-accountbox').slideToggle();
            });

            /* Select Sortby */
            $('.select-sortby-current').on('click', function () {
                $('.select-sortby-list').slideToggle();
            });


            /* Header Cart */
            $('.header-carticon').on('click', function (e) {
                e.preventDefault();
                $(this).toggleClass('is-active');
                $('.header-minicart').slideToggle();
            });

            /* Category Menu */
            function categoryMenu() {
                var winWidth = $(window).width();

                // Toggle Category Menu
                $('.catmenu-trigger').on('click', function (e) {
                    e.preventDefault();
                    $(this).toggleClass('is-active');
                    $(this).siblings('.catmenu-body').slideToggle();
                });
                $('.catmenu-trigger.is-active').siblings('.catmenu-body').slideDown();

                // Category Menu More
                $('.catmenu-moretrigger a').on('click', function (e) {
                    e.preventDefault();
                    $(this).parents('.catmenu').find('.catmenu-hidden').slideToggle();
                });

                // Mobile Attitude
                if (winWidth < 992) {

                    $('.catmenu-body').find('.megamenu').removeClass('megamenu');
                    $('.catmenu-body').find('.catmenu-megamenu').removeClass('catmenu-megamenu');
                    $('.catmenu-body').find('.catmenu-dropdown').removeClass('catmenu-dropdown');

                    $('.catmenu-body').find('li').each(function () {
                        if ($(this).children('ul').length) {
                            $(this).addClass('has-children');
                            $(this).children('a').on('click', function (e) {
                                e.preventDefault();
                                $(this).parent('li').toggleClass('is-active');
                                $(this).siblings('ul').slideToggle();
                            });
                        }
                    });

                    $('.catmenu-2').find('.catmenu-trigger').removeClass('is-active');
                    $('.catmenu-2').find('.catmenu-body').css('display', 'none');
                }
            }
            categoryMenu();


            /* Recommended Product Exerpt */
            function recommendedExerpt() {
                var max = 75;
                var tot, str;
                $('.recommended-products-slider .hoproduct-4 .hoproduct-title').each(function () {
                    str = String($(this).html());
                    tot = str.length;
                    str = (tot <= max) ? str : str.substring(0, (max + 1)) + "...";
                    $(this).html(str);
                });
            }
            recommendedExerpt();

            /* Product Detals Color & Size */
            $('.pdetails-color ul li, .pdetails-size ul li').on('click', function () {
                $(this).addClass('checked').siblings().removeClass('checked');
            });

            /* Rating Hover Action */
            $('.rattingbox.hover-action span').on('mouseenter', function () {
                $('.rattingbox.hover-action span').addClass('active');
                $(this).nextAll('span').removeClass('active');
            });

             /* Countdown Activation */
             $('.countdown').each(function () {
                 var $this = $(this),
                     finalDate = $(this).data('countdown');
                 var endAt=$(this).data('endat');
                 var sku_id=$(this).data('id');
                 var obj=$('#sec'+sku_id);
                 var ishas=obj.hasClass('btn-cart');
                 $this.countdown(finalDate, function (event) {
                     $this.html(event.strftime(
                         '<div class="countdown-pack countdown-day"><h3 class="countdown-count">%-D</h3><h6>天</h6></div>:<div class="countdown-pack countdown-hour"><h3 class="countdown-count">%-H</h3><h6>小时</h6></div>:<div class="countdown-pack countdown-minutes"><h3 class="countdown-count">%M</h3><h6>分钟</h6></div>:<div class="countdown-pack countdown-seconds"><h3 class="countdown-count">%S</h3><h6>秒</h6></div>'));
                 }).on('finish.countdown',function () {
                     if(ishas){
                         obj.html('<span>秒杀结束</span>');
                     }else{
                         obj.html("<span>立即抢购</span>");
                         countDown($this,endAt);
                     }
                     obj.toggleClass('btn-cart');
                 });
             });
             function countDown(obj,finalDate) {
                 obj.countdown(finalDate, function (event) {
                     obj.html(event.strftime(
                         '<div class="countdown-pack countdown-day"><h3 class="countdown-count">%-D</h3><h6>天</h6></div>:<div class="countdown-pack countdown-hour"><h3 class="countdown-count">%-H</h3><h6>小时</h6></div>:<div class="countdown-pack countdown-minutes"><h3 class="countdown-count">%M</h3><h6>分钟</h6></div>:<div class="countdown-pack countdown-seconds"><h3 class="countdown-count">%S</h3><h6>秒</h6></div>'));
                 })
             }
            /* Quickview Modal */
            $('.quickview-trigger').on('click', function (e) {
                e.preventDefault();
                $('.quickmodal').toggleClass('is-visible');
            });
            $('.quickmodal').find('.body-overlay').on('click', function () {
                $(this).parents('.quickmodal').removeClass('is-visible');
            });
            $('.quickmodal-close').on('click', function () {
                $(this).parent('.quickmodal').removeClass('is-visible');
            });

            /* Product Details Zoom */
            $('.pdetails-imagezoom').lightGallery({
                selector: '.pdetails-singleimage'
            });

            /* Range Slider Active */
            $('.range-slider').nstSlider({
                'left_grip_selector': '.range-slider-leftgrip',
                'right_grip_selector': '.range-slider-rightgrip',
                'value_bar_selector': '.bar',
                'value_changed_callback': function (cause, leftValue, rightValue) {
                    $(this).parent().find('.range-slider-leftlabel').text(leftValue);
                    $(this).parent().find('.range-slider-rightlabel').text(rightValue);
                }
            });

            /*
            当页面加载时，就会注册所有的事件，后面通过jquery新增的内容（<div class="item"></div>），再对新增的添加事件$(".item").click(function(){})；页面是不会执行的，
            解决方法，使用live(), live() 方法附加的事件处理程序适用于匹配选择器的当前及未来的元素（比如由脚本创建的新元素）:
            $(".item").live("click",function(){

            });
            由于jquery1.9后的版本已经把live()方法删除了，所以最好使用on()方法：
            $(document).on("click",".item",function(){

            });
             */
             $(document).on('click','.btn-cart',function (e) {
                 if($(this).hasClass('disabled')) {
                     return;
                 }
                 var sku_id=$(this).data('id');
                 // 把用户的收货地址以 JSON 的形式放入页面，赋值给 addresses 变量
                 var addresses = {!! json_encode(Auth::check() ? Auth::user()->addresses : []) !!};
                 // 使用 jQuery 动态创建一个下拉框
                 var addressSelector = $('<select class="form-control"></select>');
                 // 循环每个收货地址
                 addresses.forEach(function (address) {
                     // 把当前收货地址添加到收货地址下拉框选项中
                     addressSelector.append("<option value='" + address.id + "'>" + address.full_address + ' ' + address.contact_name + ' ' + address.contact_phone + '</option>');
                 });
                 // 调用 SweetAlert 弹框
                 swal({
                     text: '选择收货地址',
                     content: addressSelector[0],
                     buttons: ['取消', '确定']
                 }).then(function (ret) {
                     if(!ret){
                         return;
                     }
                     var address = _.find(addresses, {id: parseInt(addressSelector.val())});
                     //var req={address_id:addressSelector.val(),sku_id:sku_id};
                    var req={address: _.pick(address, ['province','city','district','address','zip','contact_name','contact_phone']),sku_id:sku_id};

                     axios.post('{{ route('seckill_orders.store') }}',req).then(function (response) {
                         swal('订单提交成功', '', 'success')
                             .then(() => {
                                 location.href = '/orders/' + response.data.id;
                             });
                     },function (error) {
                         if(error.response.status===422){
                             var html='<div>';
                             _.each(error.response.data.errors,function (errors) {
                                 _.each(errors,function (error) {
                                     html+=error+'<br>';
                                 });
                             });
                             html+='</div>'
                             swal({ content:$(html)[0],icon:'error'})
                         }else if(error.response.status==403){
                             swal(error.response.data.message,'','error');
                         }else{
                             swal('系统错误','','error');
                         }
                     })
                 });
             });

            function mailChimpResponse(resp) {
                if (resp.result === 'success') {
                    $('.mailchimp-success').html('' + resp.msg).fadeIn(900);
                    $('.mailchimp-error').fadeOut(400);

                } else if (resp.result === 'error') {
                    $('.mailchimp-error').html('' + resp.msg).fadeIn(900);
                }
            }
            /* Scroll Up Active */
            $.scrollUp({
                scrollText: '<i class="ion ion-ios-arrow-up"></i>',
                easingType: 'linear',
                scrollSpeed: 900,
                animation: 'slide'
            });

        })(jQuery);
    </script>
    <script src="/js/com.js"></script>
@endsection