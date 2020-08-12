@extends('layouts.app')
@section('title',"商品")
@section('content')
    <!-- Breadcrumb Area -->
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-grey">
            <li class="breadcrumb-item"><a href="{{ route('home') }}">首页</a></li>
            <li class="breadcrumb-item active" aria-current="page">众筹商品</li>
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
                    <a href="/">
                        <img src="images/banner/banner-image-20.jpg" alt="banner">
                    </a>
                </div>
            </div>

            <div class="shop-filters mt-30">
                <div class="shop-filters-viewmode">
                    <button class="is-active" data-view="list"><i class="ion ion-ios-list"></i></button>
                    <button data-view="grid"><i class="ion ion-ios-keypad"></i></button>
                </div>
                <span class="shop-filters-viewitemcount">众筹商品</span>
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

            <div class="shop-page-products list-view-active mt-30">
                <div class="row no-gutters">
                    @foreach($crowdfundings as $crowdfunding)
                        <div class="col-lg-4 col-md-4 col-sm-6 col-12">
                            <!-- Single Product -->
                            <article class="hoproduct">
                                <div class="hoproduct-image">
                                    <a class="hoproduct-thumb" href="{{ route('crowdfunding_products.show',[$crowdfunding->product->id]) }}">
                                        <img class="hoproduct-frontimage" src="{{ $crowdfunding->product->image_url }}"
                                             alt="product image">
                                        <img class="hoproduct-backimage" src="{{ $crowdfunding->product->image_url }}"
                                             alt="product image">
                                    </a>
                                    <ul class="hoproduct-actionbox">

                                        <li><a href="javascript:void(0);" class="quickview-trigger"><i class="lnr lnr-eye"></i></a></li>

                                    </ul>
                                    <ul class="hoproduct-flags">
                                        <!-- <li class="flag-pack">New</li>-->
                                        @if($crowdfunding->product->discount_num>0)
                                            <li class="flag-discount">{{ 100-$crowdfunding->product->discount_num }}%</li>
                                        @endif
                                    </ul>
                                </div>
                                <div class="hoproduct-content">
                                    <h5 class="hoproduct-title"><a href="{{ route('crowdfunding_products.show',[$crowdfunding->product->id]) }}">{{ $crowdfunding->product->title }}</a></h5>
                                    <div class="hoproduct-pricebox">
                                        <div class="pricebox">
                                            <span class="price">￥{{ $crowdfunding->product->price}}</span>
                                        </div>
                                    </div>
                                    <div class="hoproduct-rattingbox">
                                        <div class="rattingbox">
                                            <!-- 这里使用了 Bootstrap 的进度条组件 -->
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-success progress-bar-striped"
                                                     role="progressbar"
                                                     aria-valuenow="{{ $crowdfunding->percent }}"
                                                     aria-valuemin="0"
                                                     aria-valuemax="100"
                                                     style="min-width: 1em; width: {{ min($crowdfunding->percent, 100) }}%">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="hoproduct-rattingbox">
                                        <span >当前进度：{{ $crowdfunding->percent }}%</span>
                                        <span class="float-right">{{ $crowdfunding->user_count }}名支持者</span>
                                    </div>
                                    <div class="hoproduct-rattingbox">
                                        @if ($crowdfunding->status === \App\Models\CrowdfundingProduct::STATUS_FUNDING)
                                            <div>此项目必须在
                                                <span class="text-red">{{ $crowdfunding->end_at->format('Y-m-d H:i:s') }}</span>
                                                前得到
                                                <span class="text-red">￥{{ $crowdfunding->target_amount }}</span>
                                                的支持才可成功，
                                                <!-- Carbon 对象的 diffForHumans() 方法可以计算出与当前时间的相对时间，更人性化 -->
                                                筹款将在<span class="text-red">{{ $crowdfunding->end_at->diffForHumans(now()) }}</span>结束！
                                            </div>

                                        @endif
                                    </div>
                                    <p class="hoproduct-content-description">{{ $crowdfunding->product->description }}</p>
                                </div>
                            </article>
                            <!--// Single Product -->
                        </div>
                    @endforeach

                </div>
            </div>
            <div class="cr-pagination pt-30 float-right">
                {{ $crowdfundings->render() }}
            </div>
            </div>
        </div>
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

            /* Product Viewmode */
            $('.shop-filters-viewmode').on('click', 'button', function () {
                $(this).addClass('is-active').siblings().removeClass('is-active');

                var dataView = $(this).data('view');

                if (dataView == 'list') {
                    $('.shop-page-products').addClass('list-view-active');
                    setCookie('cdataView','list');
                } else {
                    $('.shop-page-products').removeClass('list-view-active');
                    setCookie('cdataView','grid');
                }
            });

            switch(getCookie('cdataView')){
                case 'list':
                    $('.shop-page-products').addClass('list-view-active');
                    $('.shop-filters-viewmode button').eq(0).addClass('is-active').siblings().removeClass('is-active');
                    break;
                case 'grid':
                    $('.shop-page-products').removeClass('list-view-active');
                    $('.shop-filters-viewmode button').eq(1).addClass('is-active').siblings().removeClass('is-active');
                    break;
                default:
                    break;
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