@extends('layouts.app')

@section('content')
    @include('home.banners')
    <!-- Page Conttent -->
    <main class="page-content">
        <!-- Features Area -->
        <div class="ho-section features-area bg-white ptb-30">
            <div class="container">
                <div class="row">
                    <!-- Single Feature -->
                    <div class="col-lg-3 col-md-6 col-12">
                        <div class="featurebox">
                            <i class="flaticon-shipped"></i>
                            <h5>免费邮寄</h5>
                            <p>满99元包邮</p>
                        </div>
                    </div>
                    <!--// Single Feature -->

                    <!-- Single Feature -->
                    <div class="col-lg-3 col-md-6 col-12">
                        <div class="featurebox">
                            <i class="flaticon-support-1"></i>
                            <h5>全天候支持</h5>
                            <p>每周7天，每天24小时联系我们</p>
                        </div>
                    </div>
                    <!--// Single Feature -->

                    <!-- Single Feature -->
                    <div class="col-lg-3 col-md-6 col-12">
                        <div class="featurebox">
                            <i class="flaticon-money-back"></i>
                            <h5>7天无理由退货</h5>
                            <p>15天免费换货.</p>
                        </div>
                    </div>
                    <!--// Single Feature -->

                    <!-- Single Feature -->
                    <div class="col-lg-3 col-md-6 col-12">
                        <div class="featurebox">
                            <i class="flaticon-credit-card"></i>
                            <h5>100% 支付安全</h5>
                            <p>确保安全付款</p>
                        </div>
                    </div>
                    <!--// Single Feature -->

                </div>
            </div>
        </div>
        <!--// Features Area -->

        <!-- 活动商品 -->
        <div class="ho-section deal-of-the-day-area bg-white">
            <div class="container">
                <div class="section-title">
                    <h3>最新活动</h3>
                </div>
                <div class="product-slider deal-of-the-day-slider slider-navigation-2 slider-dots">

                    @foreach($active_products as $active_product)
                    <!-- Single Product -->
                    <div class="product-slider-col">
                        <article class="hoproduct hoproduct-2">
                            <div class="hoproduct-image">
                                <a class="hoproduct-thumb" href="{{ route('products.show',[$active_product->id]) }}">
                                    <img class="hoproduct-frontimage" src="{{ url_image($active_product->image) }}" alt="product image">
                                    <!--
                                    <img class="hoproduct-backimage" src="upload/product/product-image-22.jpg" alt="product image">
                                    -->
                                </a>
                                <ul class="hoproduct-actionbox">
                                    @if(Auth::check())
                                    <li><a href="javascript:void(0);" data-id="{{ $active_product->id }}"><i class="lnr lnr-cart"></i></a></li>
                                    @endif
                                    <li><a href="javascript:void(0);" class="quickview-trigger" data-id="{{ $active_product->id }}"><i class="lnr lnr-eye"></i></a></li>
                                        @if(Auth::check())
                                        <li><a href="javascript:void(0); " class="{{ in_array($active_product->id,$favorite_Ids)?'is-active':'' }}" title="{{ in_array($active_product->id,$favorite_Ids)?'取消收藏':'收藏' }}" data-id="{{ $active_product->id }}"><i class="lnr lnr-heart"></i></a></li>
                                        @endif
                                </ul>
                                <ul class="hoproduct-flags">
                                    <li class="flag-pack">New</li>
                                    <li class="flag-discount">-{{ 100-$active_product->discount_num }}%</li>
                                </ul>
                            </div>
                            <div class="hoproduct-countdown countdown" data-countdown="{{ $active_product->end_at }}"></div>
                            <div class="hoproduct-content">
                                <h5 class="hoproduct-title"><a href="{{ route('products.show',[$active_product->id]) }}">{{ $active_product->title }}</a></h5>
                                <div class="hoproduct-rattingbox">
                                    <h6>1 评论</h6>
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
                                        <del class="oldprice">￥{{ $active_product->original_price }}</del>
                                        <span class="price">￥{{ $active_product->price }}</span>
                                    </div>
                                    <span class="discount">-{{ 100-$active_product->discount_num }}%</span>
                                </div>
                            </div>
                        </article>
                    </div>
                    <!--// Single Product -->
                    @endforeach
                </div>
            </div>
        </div>
        <!--// 活动商品 -->

        <!-- Banner Area -->
        <div class="banner-area">
            <div class="container">
                @foreach($ads[1110170] as $ad)
                    <div class="imgbanner imgbanner-2 mt-30">
                        <a href="{{ $ad->url }}">
                            <img src="{{ $ad->image_url }}" alt="{{ $ad->name }}">
                        </a>
                    </div>
                @endforeach
            </div>
        </div>
        <!--// Banner Area -->

        <!-- 热门 -->
        <div class="ho-section trending-our-product-area bg-white">
            <div class="container">
                <div class="row">
                    <!-- Trending Our Product Left -->
                    <div class="col-lg-9 col-md-8">
                        <!-- Trending Area -->
                        <div class="trending-products-area mt-30">
                            <div class="section-title">
                                <h3>热门产品</h3>
                                <ul class="nav" id="bstab1" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="bstab1-area1-tab" data-toggle="tab" href="#bstab1-area1" role="tab"
                                           aria-controls="bstab1-area1" aria-selected="true">推荐</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="bstab1-area2-tab" data-toggle="tab" href="#bstab1-area2" role="tab" aria-controls="bstab1-area2"
                                           aria-selected="false">销量</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="bstab1-area3-tab" data-toggle="tab" href="#bstab1-area3" role="tab" aria-controls="bstab1-area3"
                                           aria-selected="false">热评</a>
                                    </li>
                                </ul>
                            </div>

                            <div class="tab-content" id="bstab1-ontent">
                                <div class="tab-pane fade show active" id="bstab1-area1" role="tabpanel" aria-labelledby="bstab1-area1-tab">
                                    @include('home.silder_product',['items'=>$hot_products,'sclass'=>'product-slider trending-products-slider slider-navigation-2','different_class'=>'hoproduct-3'])
                                </div>
                                <div class="tab-pane fade" id="bstab1-area2" role="tabpanel" aria-labelledby="bstab1-area2-tab">
                                    @include('home.silder_product',['items'=>$sold_products,'sclass'=>'product-slider trending-products-slider slider-navigation-2','different_class'=>'hoproduct-3'])
                                </div>
                                <div class="tab-pane fade" id="bstab1-area3" role="tabpanel" aria-labelledby="bstab1-area3-tab">
                                    @include('home.silder_product',['items'=>$review_products,'sclass'=>'product-slider trending-products-slider slider-navigation-2','different_class'=>'hoproduct-3'])
                                </div>
                            </div>
                        </div>
                        <!--// Trending Area -->

                        <!-- Banner -->
                        @foreach($ads[840171] as $ad)
                            <div class="imgbanner imgbanner-2 mt-30">
                                <a href="{{ $ad->url }}">
                                    <img src="{{ $ad->image_url }}" alt="{{ $ad->name }}">
                                </a>
                            </div>
                        @endforeach
                        <!--// Banner -->

                        <!-- Our Products Area -->
                        <div class="our-products-area mt-30">
                            <div class="section-title">
                                <h3>电子产品</h3>
                                <ul class="nav" id="bstab2" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="bstab2-area1-tab" data-toggle="tab" href="#bstab2-area1" role="tab"
                                           aria-controls="bstab2-area1" aria-selected="true">手机</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="bstab2-area2-tab" data-toggle="tab" href="#bstab2-area2" role="tab" aria-controls="bstab2-area2"
                                           aria-selected="false">笔记本 & 平板电脑</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="bstab2-area3-tab" data-toggle="tab" href="#bstab2-area3" role="tab" aria-controls="bstab2-area3"
                                           aria-selected="false">Watch</a>
                                    </li>
                                </ul>
                            </div>

                            <div class="tab-content" id="bstab2-ontent">
                                <div class="tab-pane fade show active" id="bstab2-area1" role="tabpanel" aria-labelledby="bstab2-area1-tab">
                                    @include('home.silder_product',['items'=>$phones,'sclass'=>'product-slider our-products-slider slider-navigation-2','different_class'=>''])
                                </div>
                                <div class="tab-pane fade" id="bstab2-area2" role="tabpanel" aria-labelledby="bstab2-area2-tab">
                                    @include('home.silder_product',['items'=>$books,'sclass'=>'product-slider our-products-slider slider-navigation-2','different_class'=>''])
                                </div>
                                <div class="tab-pane fade" id="bstab2-area3" role="tabpanel" aria-labelledby="bstab2-area3-tab">
                                    @include('home.silder_product',['items'=>$watchs,'sclass'=>'product-slider our-products-slider slider-navigation-2','different_class'=>''])
                                </div>
                            </div>
                        </div>
                        <!--// Our Products Area -->

                        <!-- Banner -->
                        @foreach($ads[840170] as $ad)
                            <div class="imgbanner imgbanner-2 mt-30">
                                <a href="{{ $ad->url }}">
                                    <img src="{{ $ad->image_url }}" alt="{{ $ad->name }}">
                                </a>
                            </div>
                         @endforeach
                        <!--// Banner -->
                    </div>
                    <!--// Trending Our Product Left -->

                    <!-- Trending Our Product Right -->
                    <div class="col-lg-3 col-md-4">

                        <!-- 商品分类 -->
                        <div class="categories-area mt-30">
                            <div class="section-title">
                                <h3>热门分类</h3>
                            </div>
                            <div class="categories-slider slider-navigation-2 slider-navigation-2-m0">
                                @foreach($categories as $category )
                                    <div class="category-wrapper">
                                        @foreach($category as $value)
                                        <!-- Single Category -->
                                        <div class="category">
                                            <a href="/products?category_id={{ $value['id'] }}" class="category-thumb">
                                                <img class="rounded-circle" src="{{ image_url($value['image'])  }}" alt="{{ $value['name'] }}">
                                            </a>
                                            <div class="category-content">
                                                <h5 class="category-title">{{ $value['name'] }}</h5>
                                                <span class="category-productcounter"></span>
                                                <a href="/products?category_id={{ $value['id'] }}"  class="category-productlink">查看 <i class="ion ion-md-arrow-dropright"></i></a>
                                            </div>
                                        </div>
                                        <!--// Single Category -->

                                        @endforeach
                                    </div>
                                 @endforeach
                            </div>
                        </div>
                        <!--// Categories -->

                        <!-- Banner -->
                        @foreach($ads[270345] as $ad)
                            <div class="imgbanner imgbanner-2 mt-30">
                                <a href="{{ $ad->url }}">
                                    <img src="{{ $ad->image_url }}" alt="{{ $ad->name }}">
                                </a>
                            </div>
                         @endforeach
                        <!--// Banner -->

                        <!-- Recommended Product -->
                        <div class="recommended-products mt-30">
                            <div class="section-title">
                                <h3>秒杀商品</h3>
                            </div>
                            @include('home.silder_product',['items'=>$skill_products,'sclass'=>'recommended-products-slider slider-navigation-2 slider-navigation-2-m0','different_class'=>'hoproduct-4'])
                        </div>
                        <!--// Recommended Product -->

                    </div>
                    <!--// Trending Our Product Right -->

                </div>
            </div>
        </div>
        <!--// 热门 -->

        <!-- Newarrival, Best seller & Features Product -->
        <div class="ho-section newarrival-bestseller-featured-product mtb-30 bg-white">
            <div class="container">
                <div class="section-title-2">
                    <ul class="nav" id="bstab3" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="bstab3-area1-tab" data-toggle="tab" href="#bstab3-area1" role="tab"
                               aria-controls="bstab3-area1" aria-selected="true">手机</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="bstab3-area2-tab" data-toggle="tab" href="#bstab3-area2" role="tab" aria-controls="bstab3-area2"
                               aria-selected="false">电脑&平板</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="bstab3-area3-tab" data-toggle="tab" href="#bstab3-area3" role="tab" aria-controls="bstab3-area3"
                               aria-selected="false">智能手表</a>
                        </li>
                    </ul>
                </div>

                <div class="tab-content" id="bstab3-ontent">
                    <div class="tab-pane fade show active" id="bstab3-area1" role="tabpanel" aria-labelledby="bstab3-area1-tab">
                        @include('home.silder_product',['items'=>$phones,'sclass'=>'product-slider new-best-featured-slider slider-navigation-2','different_class'=>''])
                    </div>
                    <div class="tab-pane fade" id="bstab3-area2" role="tabpanel" aria-labelledby="bstab3-area2-tab">
                        @include('home.silder_product',['items'=>$books,'sclass'=>'product-slider new-best-featured-slider slider-navigation-2 ','different_class'=>''])
                    </div>
                    <div class="tab-pane fade" id="bstab3-area3" role="tabpanel" aria-labelledby="bstab3-area3-tab">
                        @include('home.silder_product',['items'=>$watchs,'sclass'=>'product-slider new-best-featured-slider slider-navigation-2 ','different_class'=>''])
                    </div>
                </div>
            </div>
        </div>
        <!--// Newarrival, Best seller & Features Product -->
        <!-- Brand Logo Area -->
        <div class="ho-section brand-logos-area bg-grey">
            <div class="container">
                <div class="brand-logo-slider slider-navigation-3">
                    @foreach($brands as $brand)
                    <div class="brandlogo">
                        <a href="{{ $brand->url }}">
                            <img src="{{ $brand->image_url }}" alt="{{ $brand->name }}">
                        </a>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
        <!--// Brand Logo Area -->

        <!-- Banner Area -->
        <div class="banner-area  bg-white">
            <div class="container">
                @foreach($ads[1110430] as $ad)
                    <div class="imgbanner imgbanner-2 mt-30">
                        <a href="{{ $ad->url }}">
                            <img src="{{ $ad->image_url }}" alt="{{ $ad->name }}">
                        </a>
                    </div>
                @endforeach
            </div>
        </div>
        <!--// Banner Area -->

        <!-- Featured Products Area -->
        <div class="ho-section featured-products-area bg-white mtb-20">
            <div class="container">
                <div class="section-title">
                    <h3>众筹商品</h3>
                </div>
                <div class="row">
                    <div class="col-lg-6 order-2 order-lg-1">
                        @foreach($ads[555150] as $ad)
                            <div class="imgbanner imgbanner-2 mt-30">
                                <a href="{{ $ad->url }}">
                                    <img src="{{ $ad->image_url }}" alt="{{ $ad->name }}">
                                </a>
                            </div>
                        @endforeach
                    </div>
                    <div class="col-lg-6 order-1 order-lg-2">
                        @include('home.silder_product',['items'=>$crowdfunding_products,'sclass'=>'featured-product-slider slider-navigation-2 slider-navigation-2-m0','different_class'=>'hoproduct-4 guoguo'])
                    </div>
                </div>
            </div>
        </div>
        <!--// Featured Products Area -->

        <!-- Newsletter Area -->
            @include('layouts._subscribe')
        <!--// Newsletter Area -->
    </main>
@endsection
@section('modal')
    <div id="quickview-modal" class="modal fade quickview" tabindex="-1"
         role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6 col-sm-6">
                            <div class="pdetails-images">
                                <div class="pdetails-largeimages">
                                    <div class="pdetails-singleimage">
                                        <img src="/storage/product/00aa60d90281624184e097b72521f37d.jpg" alt="product image">
                                    </div>
                                    <div class="pdetails-singleimage">
                                        <img src="/storage/product/0d9af0656d60f08fb92d1a6e8e5f6ac6.jpg" alt="product image">
                                    </div>
                                    <div class="pdetails-singleimage">
                                        <img src="/storage/product/0bee5c723b6cbcf91f1d180aff718e8b.jpg" alt="product image">
                                    </div>
                                    <div class="pdetails-singleimage">
                                        <img src="/storage/product/0da607a57c37dfc83914bff6935f2c58.jpg" alt="product image">
                                    </div>
                                    <div class="pdetails-singleimage">
                                        <img src="/storage/product/1f600cc2e1e6af0cc96accd110f9b42e.jpg" alt="product image">
                                    </div>
                                    <div class="pdetails-singleimage">
                                        <img src="/storage/product/2ef01ae17191410b036b95751e19db00.jpg" alt="product image">
                                    </div>
                                    <div class="pdetails-singleimage">
                                        <img src="/storage/product/9be58bde07e42c997e17e43e7368cbd1.jpg" alt="product image">
                                    </div>
                                    <div class="pdetails-singleimage">
                                        <img src="/storage/product/7c3d5068cf4c1957550afb3dd96aa55c.jpg" alt="product image">
                                    </div>
                                </div>

                                <div class="pdetails-thumbs">
                                    <div class="pdetails-singlethumb">
                                        <img class="img-thumbnail"

                                             src="/storage/product/6e4c0c5ab5406e3bd73f1dd4a67228b1-small.jpg" alt="product thumb">
                                    </div>
                                    <div class="pdetails-singlethumb">
                                        <img  class="img-thumbnail" src="/storage/product/0d9af0656d60f08fb92d1a6e8e5f6ac6-small.jpg" alt="product thumb">
                                    </div>
                                    <div class="pdetails-singlethumb">
                                        <img class="img-thumbnail" src="/storage/product/7b6ce708bcb6cc19a8cf747487670adc-small.jpg" alt="product thumb">
                                    </div>
                                    <div class="pdetails-singlethumb">
                                        <img class="rounded-circle"
                                             src="/storage/product/8b468c2f732004715edede2da476ed1e-small.jpg" alt="product thumb">
                                    </div>
                                    <div class="pdetails-singlethumb">
                                        <img class="img-thumbnail" src="/storage/product/9efa681cdcc4b7fb4ff54d09fe9ae46b-small.jpg" alt="product thumb">
                                    </div>
                                    <div class="pdetails-singlethumb">
                                        <img class="img-thumbnail" src="/storage/product/9d6a768cdb00036df93ca74c291ab522-small.jpg" alt="product thumb">
                                    </div>
                                    <div class="pdetails-singlethumb">
                                        <img class="img-thumbnail" src="/storage/product/7f93965fd1ef279d3372cf1ca2f3ab14-small.jpg" alt="product thumb">
                                    </div>
                                    <div class="pdetails-singlethumb">
                                        <img class="img-thumbnail" src="/storage/product/7c3d5068cf4c1957550afb3dd96aa55c-small.jpg" alt="product thumb">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <div class="pdetails-content">

                                <div class="rattingbox">
                                    <span class="active"><i class="ion ion-ios-star"></i></span>
                                    <span class="active"><i class="ion ion-ios-star"></i></span>
                                    <span class="active"><i class="ion ion-ios-star"></i></span>
                                    <span class="active"><i class="ion ion-ios-star"></i></span>
                                    <span class="active"><i class="ion ion-ios-star"></i></span>
                                </div>
                                <h3>SonicFuel Wireless Over-Ear Headphones</h3>
                                <div class="pdetails-pricebox">
                                    <del class="oldprice">$35.90</del>
                                    <span class="price">$34.11</span>
                                    <span class="badge">Save 5%</span>
                                </div>
                                <p>The ATH-S700BT offers clear, full-bodied audio reproduction with Bluetooth®
                                    wireless operation. The headphones are equipped with a mic, and music and
                                    volume controls, allowing you to easily answer calls..</p>
                                <div class="pdetails-quantity">
                                    <div class="quantity-select">
                                        <input type="text" value="1">
                                        <div class="inc qtybutton">+<i class="ion ion-ios-arrow-up"></i></div>
                                        <div class="dec qtybutton">-<i class="ion ion-ios-arrow-down"></i></div>
                                    </div>
                                    <a href="shop-rightsidebar.html" class="ho-button">
                                        <i class="lnr lnr-cart"></i>
                                        <span>加入购物车</span>
                                    </a>
                                </div>
                                <!--
                                <div class="pdetails-color">
                                    <span>Color :</span>
                                    <ul>
                                        <li class="red"><span></span></li>
                                        <li class="green checked"><span></span></li>
                                        <li class="blue"><span></span></li>
                                        <li class="black"><span></span></li>
                                    </ul>
                                </div>
                                <div class="pdetails-size">
                                    <span>Size :</span>
                                    <ul>
                                        <li class="checked"><span>S</span></li>
                                        <li><span>M</span></li>
                                        <li><span>L</span></li>
                                        <li><span>XL</span></li>
                                        <li><span>XXL</span></li>
                                    </ul>
                                </div>
                                <div class="pdetails-categories">
                                    <span>Categories :</span>
                                    <ul>
                                        <li><a href="shop-rightsidebar.html">Accessories</a></li>
                                        <li><a href="shop-rightsidebar.html">Kids</a></li>
                                        <li><a href="shop-rightsidebar.html">Women</a></li>
                                    </ul>
                                </div>
                                <div class="pdetails-tags">
                                    <span>Tags :</span>
                                    <ul>
                                        <li><a href="shop-rightsidebar.html">Electronic</a></li>
                                        <li><a href="shop-rightsidebar.html">Television</a></li>
                                    </ul>
                                </div>
                                <div class="pdetails-socialshare">
                                    <span>Share :</span>
                                    <ul>
                                        <li><a href="#"><i class="ion ion-logo-facebook"></i></a></li>
                                        <li><a href="#"><i class="ion ion-logo-twitter"></i></a></li>
                                        <li><a href="#"><i class="ion ion-logo-googleplus"></i></a></li>
                                        <li><a href="#"><i class="ion ion-logo-pinterest"></i></a></li>
                                    </ul>
                                </div>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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

            /* Herobanner Slider */
            $('.herobanner').slick({
                slidesToShow: 1,
                autoplay: true,
                autoplaySpeed: 8000,
                speed: 1000,
                adaptiveHeight: true,
                fade: true,
                easing: 'ease-in-out',
                dots: true,
                arrows: true,
                prevArrow: '<span class="slider-navigation-arrow slider-navigation-prev"><i class="ion ion-ios-arrow-back"></i></span>',
                nextArrow: '<span class="slider-navigation-arrow slider-navigation-next"><i class="ion ion-ios-arrow-forward"></i></span>',
            });

            /* Deal Of The Day Slider */
            $('.deal-of-the-day-slider').slick({
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

            /* Trending Product Slider */
            $('.trending-products-slider').slick({
                slidesToShow: 2,
                autoplay: false,
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
                        slidesToShow: 1,
                        slidesToScroll: 1
                    }
                }]
            });

            /* Our Product Slider */
            $('.our-products-slider').slick({
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

            /* Our Proudct Slider 2 */
            $('.ourproduct-2-slider').slick({
                slidesToShow: 4,
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
                        slidesToShow: 3,
                        slidesToScroll: 1
                    }
                },
                    {
                        breakpoint: 992,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 1
                        }
                    },
                    {
                        breakpoint: 768,
                        settings: {
                            slidesToShow: 1,
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

            /* New Best Featured Slider */
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

            /* Category Slider */
            $('.categories-slider').slick({
                slidesToShow: 1,
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

            /* Recommended Product Slider */
            $('.recommended-products-slider').slick({
                slidesToShow: 1,
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

            /* Featured Product Slider */
            $('.featured-product-slider').slick({
                slidesToShow: 2,
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
                    breakpoint: 576,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1
                    }
                }]
            });

            /* Brand Logos Slider */
            $('.brand-logo-slider').slick({
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

            /* Latest Blog Slider */
            $('.blogitem-slider').slick({
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

            /* Countdown Activation */
            $('.countdown').each(function () {
                var $this = $(this),
                    finalDate = $(this).data('countdown');
                $this.countdown(finalDate, function (event) {
                    $this.html(event.strftime(
                        '<div class="countdown-pack countdown-day"><h3 class="countdown-count">%-D</h3><h6>天</h6></div>:<div class="countdown-pack countdown-hour"><h3 class="countdown-count">%-H</h3><h6>小时</h6></div>:<div class="countdown-pack countdown-minutes"><h3 class="countdown-count">%M</h3><h6>分钟</h6></div>:<div class="countdown-pack countdown-seconds"><h3 class="countdown-count">%S</h3><h6>秒</h6></div>'));
                });
            });

            /* Accountbox */
            $('.header-accountbox-trigger').on('click', function () {
                $('.header-accountbox').slideToggle();
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

            /* Quickview Modal */
            $('.quickview-trigger').on('click', function (e) {
                e.preventDefault();
                //$('.quickmodal').toggleClass('is-visible');
                //$('#quickview-modal').modal();
                location.href='products/'+$(this).data('id');
            });
            /* Progress Bar Effect */
            $(window).on('scroll', function () {

                function winScrollPosition() {
                    var scrollPos = $(window).scrollTop(),
                        winHeight = $(window).height();
                    var scrollPosition = Math.round(scrollPos + (winHeight / 1.2));
                    return scrollPosition;
                }


                var trigger = $('.progress-bar');
                if (trigger.length) {
                    var triggerPos = Math.round(trigger.offset().top);
                    if (triggerPos < winScrollPosition()) {
                        trigger.each(function () {
                            $(this).addClass('fill');
                        });
                    }
                }

            });


            /* Ajax Chimp */
            $('#mc-form').ajaxChimp({
                language: 'en',
                callback: mailChimpResponse,
                // ADD YOUR MAILCHIMP URL BELOW HERE!
                url: 'http://devitems.us11.list-manage.com/subscribe/post?u=6bbb9b6f5827bd842d9640c82&amp;id=05d85f18ef'

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
            /*
            $.scrollUp({
                scrollText: '<i class="ion ion-ios-arrow-up"></i>',
                easingType: 'linear',
                scrollSpeed: 900,
                animation: 'slide'
            });
*/
        })(jQuery);
    </script>
    <script src="/js/com.js"></script>
@endsection
