@extends('layouts.app')
@section('title',"折扣商品")
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
                <div class="row">
                    <div class="col-lg-9">

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
                                <button data-view="list"><i class="ion ion-ios-list"></i></button>
                            </div>
                            <span class="shop-filters-viewitemcount">@if($filters['search'] || $filters['category_id'])搜索到商品{{ count($products) }}个@endif</span>
                            <div class="shop-filters-sortby">
                                <b>排序:</b>
                                <div class="select-sortby">
                                    <button class="select-sortby-current">综合</button>
                                    <ul class="select-sortby-list dropdown-list">
                                        <li><a href="javascript:void(0);" data-order="">综合</a></li>
                                        <li><a href="javascript:void(0);" data-order="price_asc">价格从低到高</a></li>
                                        <li><a href="javascript:void(0);" data-order="price_desc">价格从高到低</a></li>
                                        <li><a href="javascript:void(0);" data-order="sold_count_desc">销量从高到低</a></li>
                                        <li><a href="javascript:void(0);" data-order="sold_count_asc">销量从低到高</a></li>
                                        <li><a href="javascript:void(0);" data-order="rating_desc">评价从高到低</a></li>
                                        <li><a href="javascript:void(0);" data-order="rating_asc">评价从低到高</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="shop-page-products mt-30">
                            <div class="row no-gutters">
                                @foreach($products as $product)
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-12">
                                        <!-- Single Product -->
                                        <article class="hoproduct">
                                            <div class="hoproduct-image">
                                                <a class="hoproduct-thumb" href="{{ route('products.show',[$product->id]) }}">
                                                    <img class="hoproduct-frontimage" src="{{ $product->image_url }}"
                                                         alt="product image">
                                                    <img class="hoproduct-backimage" src="{{ $product->image_url }}"
                                                         alt="product image">
                                                </a>
                                                <ul class="hoproduct-actionbox">
                                                    @if(Auth::check())
                                                        <li><a href="javascript:void(0);" data-id="{{ $product->id }}"><i class="lnr lnr-cart"></i></a></li>
                                                    @endif
                                                    <li><a href="javascript:void(0);" class="quickview-trigger"><i class="lnr lnr-eye"></i></a></li>
                                                    @if(Auth::check())
                                                        <li><a href="javascript:void(0); " class="{{ in_array($product->id,$favorite_Ids)?'is-active':'' }}" title="{{ in_array($product->id,$favorite_Ids)?'取消收藏':'收藏' }}" data-id="{{ $product->id }}"><i class="lnr lnr-heart"></i></a></li>
                                                    @endif
                                                </ul>
                                                <ul class="hoproduct-flags">
                                                    <!-- <li class="flag-pack">New</li>-->
                                                    @if($product->discount_num>0)
                                                        <li class="flag-discount">{{ 100-$product->discount_num }}%</li>
                                                    @endif
                                                </ul>
                                            </div>
                                            <div class="hoproduct-content">
                                                <h5 class="hoproduct-title"><a href="{{ route('products.show',[$product->id]) }}">{{ $product->title }}</a></h5>
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
                                                        @if($product->discount_num)
                                                            <del class="oldprice">￥{{ $product->original_price }}</del>
                                                        @endif
                                                        <span class="price">￥{{ $product->price }}</span>
                                                    </div>
                                                </div>
                                                <p class="hoproduct-content-description">{{ $product->description }}</p>
                                            </div>
                                        </article>
                                        <!--// Single Product -->
                                    </div>
                                @endforeach

                            </div>
                        </div>

                        <div class="cr-pagination pt-30 float-right">
                            {{ $products->appends($filters)->render() }}
                        </div>

                    </div>
                    <div class="col-lg-3">
                        <div class="shop-widgets">

                            <div class="single-widget widget-categories">
                                <h5 class="widget-title">商品目录</h5>
                                <ul>
                                    @foreach($categories as $category)
                                        <li><a href="#">{{ $category->name }} <span>{{ $category->product_count }}</span></a></li>
                                    @endforeach
                                </ul>
                            </div>

                            <div class="shop-widgetbox mt-30">
                                <div class="single-widget widget-filters">
                                    <h5 class="widget-title">价格区间搜索</h5>
                                    <div class="widget-filter-inner">
                                        <div class="range-slider" data-range_min="0" data-range_max="15000"
                                             data-cur_min="500" data-cur_max="5000">
                                            <div class="bar"></div>
                                            <span class="range-slider-leftgrip"></span>
                                            <span class="range-slider-rightgrip"></span>
                                        </div>
                                        <div class="single-widget-range-price">
                                            <b>价格: </b> ￥<span class="range-slider-leftlabel"></span> - ￥<span
                                                    class="range-slider-rightlabel"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="single-widget widget-color">
                                    <h5 class="widget-title">商品属性</h5>
                                    <ul>
                                        <li>
                                            <input type="checkbox" name="shop-widget-color-red" id="shop-widget-color-red" checked="checked">
                                            <label for="shop-widget-color-red">Red</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" name="shop-widget-color-green" id="shop-widget-color-green" checked="checked">
                                            <label for="shop-widget-color-green">Green</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" name="shop-widget-color-blue" id="shop-widget-color-blue" checked="checked">
                                            <label for="shop-widget-color-blue">Blue</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" name="shop-widget-color-purple" id="shop-widget-color-purple">
                                            <label for="shop-widget-color-purple">Purple</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" name="shop-widget-color" id="shop-widget-color">
                                            <label for="shop-widget-color">Silver</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" name="shop-widget-color-black" id="shop-widget-color-black">
                                            <label for="shop-widget-color-black">Black</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" name="shop-widget-color-lime" id="shop-widget-color-lime">
                                            <label for="shop-widget-color-lime">Lime</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" name="shop-widget-color-violet" id="shop-widget-color-violet">
                                            <label for="shop-widget-color-violet">Violet</label>
                                        </li>
                                    </ul>
                                </div>
                                <!--
                                <div class="single-widget widget-manufacturer">
                                    <h5 class="widget-title">商品品牌</h5>
                                    <ul>
                                        <li>
                                            <input type="checkbox" name="shop-widget-manufacturer-dell" id="shop-widget-manufacturer-dell" checked="checked">
                                            <label for="shop-widget-manufacturer-dell">Dell</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" name="shop-widget-manufacturer-asus" id="shop-widget-manufacturer-asus" checked="checked">
                                            <label for="shop-widget-manufacturer-asus">Asus</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" name="shop-widget-manufacturer-apple" id="shop-widget-manufacturer-apple">
                                            <label for="shop-widget-manufacturer-apple">Apple</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" name="shop-widget-manufacturer-hp" id="shop-widget-manufacturer-hp">
                                            <label for="shop-widget-manufacturer-hp">Hp</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" name="shop-widget-manufacturer-sony" id="shop-widget-manufacturer-sony">
                                            <label for="shop-widget-manufacturer-sony">Sony</label>
                                        </li>
                                    </ul>
                                </div>
                                -->
                            </div>


                            <div class="imgbanner mt-30">
                                <a href="#">
                                    <img src="images/banner/banner-image-9.jpg" alt="banner">
                                </a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--// Shop Page Area -->
    </main>
    <!--// Page Conttent -->
@endsection
@section('scriptAfterJs')
    <script>
        var filters = {!! json_encode($filters) !!};
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

            $('#search').val(filters.search);

            $('#category_id').val(filters.category_id);
            if(filters.order){
                $('.header-searchbox input[name="order"]').val(filters.order);
                switch(filters.order){
                    case "price_asc":
                        $(".select-sortby-current").text('价格从低到高');
                        break;
                    case "price_desc":
                        $(".select-sortby-current").text('价格从高到低');
                        break;
                    case "sold_count_desc":
                        $(".select-sortby-current").text('销量从高到低');
                        break;
                    case "rating_desc":
                        $(".select-sortby-current").text('评价从高到低');
                        break;
                    case "rating_asc":
                        $(".select-sortby-current").text('评价从低到高');
                        break;
                    default:
                        $(".select-sortby-current").text('综合');
                        break;
                }
            }

            /* Custom Selectbox */
            $('select').niceSelect();


            /* Countdown Activation */
            $('.countdown').each(function () {
                var $this = $(this),
                    finalDate = $(this).data('countdown');
                $this.countdown(finalDate, function (event) {
                    $this.html(event.strftime(
                        '<div class="countdown-pack countdown-day"><h3 class="countdown-count">%-D</h3><h6>Days</h6></div>:<div class="countdown-pack countdown-hour"><h3 class="countdown-count">%-H</h3><h6>Hour</h6></div>:<div class="countdown-pack countdown-minutes"><h3 class="countdown-count">%M</h3><h6>Min</h6></div>:<div class="countdown-pack countdown-seconds"><h3 class="countdown-count">%S</h3><h6>Sec</h6></div>'));
                });
            });

            $('.select-sortby-list li a').on('click',function () {
                var order=$(this).data('order');
                $('.header-searchbox input[name="order"]').val(order);
                $('.header-searchbox').submit()
            });
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

            /* Product Viewmode */
            $('.shop-filters-viewmode').on('click', 'button', function () {
                $(this).addClass('is-active').siblings().removeClass('is-active');

                var dataView = $(this).data('view');

                if (dataView == 'list') {
                    $('.shop-page-products').addClass('list-view-active');
                    setCookie('disdataView','list');
                } else {
                    $('.shop-page-products').removeClass('list-view-active');
                    setCookie('disdataView','grid');
                }
            });

            switch(getCookie('disdataView')){
                case 'list':
                    $('.shop-page-products').addClass('list-view-active');
                    $('.shop-filters-viewmode button').eq(1).addClass('is-active').siblings().removeClass('is-active');
                    break;
                case 'grid':
                    $('.shop-page-products').removeClass('list-view-active');
                    $('.shop-filters-viewmode button').eq(0).addClass('is-active').siblings().removeClass('is-active');
                    break;
                default:
                    break;
            }
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

            function setCookie (name, value) {
                if (value) {
                    var days = 1; //定义一天
                    var exp = new Date();
                    exp.setTime(exp.getTime() + days * 24 * 60 * 60 * 1000);
                    // 写入Cookie, toGMTString将时间转换成字符串
                    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString;
                }
            };

            /**
             * cookie中取值
             * */
            function getCookie (name) {
                var arr,reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)"); //匹配字段
                if (arr = document.cookie.match(reg)) {
                    return unescape(arr[2]);
                } else {
                    return null;
                }
            };
        })(jQuery);
    </script>
    <script src="/js/com.js"></script>
@endsection