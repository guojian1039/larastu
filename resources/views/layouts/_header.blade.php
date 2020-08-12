<!-- Header -->
<header class="header">

    <!-- Header Top Area -->
    <div class="header-top bg-white">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-7 col-md-7 col-sm-7 col-12">
                    <p class="header-welcomemsg">欢迎来到 <span>匠心设计</span> 商品店 !</p>
                </div>
                <div class="col-lg-5 col-md-5 col-sm-5 col-12">

                </div>
            </div>
        </div>
    </div>
    <!--// Header Top Area -->

    <!-- Header Middle Area -->
    <div class="header-middle bg-theme">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-3 col-md-6 col-sm-6 order-1 order-lg-1">
                    <a href="{{ url('/') }}" class="header-logo">
                        <img src="/images/logo/logo-white.png" alt="logo">
                    </a>
                </div>
                <div class="col-lg-6 col-12 order-3 order-lg-2">
                    <form action="{{ if_route('discounts.index')?route('discounts.index'):route('products.index') }}" class="header-searchbox">
                        <select id="category_id" name="category_id" class="select-searchcategory">
                            <option value="">全部类别</option>
                            @foreach($topCategorys as $category)
                                <option value="{{ $category->id }}">{{ $category->name }}</option>
                            @endforeach
                        </select>
                        <input type="text" id="search" name="search" placeholder="请输入关键字 ...">
                        <input type="hidden" name="order">
                        <button type="submit"><i class="lnr lnr-magnifier"></i></button>
                    </form>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 order-2 order-lg-3">
                        @guest
                        <nav class="ho-navigation float-right">
                            <ul>
                                <li class="active m-3">
                                    <a href="{{ route('login') }}">登录</a>
                                </li>
                                <li class="active">
                                    <a href="{{ route('register') }}">注册</a>
                                </li>
                            </ul>
                        </nav>
                         @else
                        <div class="header-icons">
                            <div class="header-account">
                                <button class="header-accountbox-trigger"><!-- <span class="lnr lnr-user"></span>-->
                                        <img src="https://cdn.learnku.com/uploads/images/201801/03/1/MFCtSTiGzj.jpg" class="img-responsive img-circle" width="30px" height="30px">
                                        {{ Auth::user()->name }}
                                    <i class="ion ion-ios-arrow-down"></i></button>
                                <ul class="header-accountbox dropdown-list text-center">
                                    <li>
                                        <a href="{{ route('addresses.index') }}">收货地址</a>
                                    </li>
                                    <li>
                                        <a href="{{ route('products.favorites') }}">我的收藏</a>
                                    </li>
                                    <li>
                                        <a href="{{ route('cart.index') }}">我的购物车</a>
                                    </li>
                                    <li>
                                        <a href="{{ route('orders.index') }}">我的订单</a>
                                    </li>
                                    <li>
                                        <a href="{{ route('acounts.index') }}">个人中心</a>
                                    </li>
                                    <li>
                                        @include('layouts._logout')
                                    </li>
                                </ul>
                            </div>
                            <div class="header-cart">
                                <a class="header-carticon" href="{{ route('cart.index') }}"><i class="lnr guo-cart"></i>
                                    @if(count($minicarts)>0)
                                    <span class="count">{{ count($minicarts) }}</span>
                                    @endif
                                </a>
                                <!-- Minicart -->
                                <div class="header-minicart minicart">
                                    @if(count($minicarts)>0)
                                    <div class="minicart-header">
                                        @foreach($minicarts as $item)
                                            @if($item->productSku->product->on_sale)
                                                {{ $mini_total_amount+=$item->amount*$item->productSku->price }}
                                        <div class="minicart-product">
                                            <div class="minicart-productimage">
                                                <a href="{{ route('products.show',['product'=>$item->productSku->product_id]) }}">
                                                    <img src="{{ $item->productSku->product->image_url }}" alt="{{$item->productSku->title}}">
                                                </a>
                                                <span class="minicart-productquantity">{{ $item->amount }}x</span>
                                            </div>
                                            <div class="minicart-productcontent">
                                                <h6><a href="{{ route('products.show',['product'=>$item->productSku->product_id]) }}">{{ $item->productSku->product->title }}-{{$item->productSku->title}}</a></h6>
                                                <span class="minicart-productprice">￥{{ $item->productSku->price }}</span>
                                            </div>
                                            <button class="minicart-productclose"><i class="ion ion-ios-close-circle"></i></button>
                                        </div>
                                            @endif
                                        @endforeach
                                    </div>
                                    <ul class="minicart-pricing">
                                        <li>合计 <span>￥{{ $mini_total_amount }}</span></li>
                                    </ul>
                                    @endif
                                    <div class="minicart-footer">
                                        <a href="{{ route('cart.index') }}" class="ho-button ho-button-fullwidth">
                                            <span>购物车</span>
                                        </a>
                                        <a href="{{ route('orders.index') }}" class="ho-button ho-button-dark ho-button-fullwidth">
                                            <span>订单中心</span>
                                        </a>
                                    </div>
                                </div>
                                <!--// Minicart -->

                            </div>
                        </div>
                    @endguest
                </div>
            </div>
        </div>
    </div>
    <!--// Header Middle Area -->

    <!-- Header Bottom Area -->
    <div class="header-bottom bg-theme">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-10 d-none d-lg-block">

                    <!-- Navigation -->
                    <nav class="ho-navigation">
                        <ul>
                            <li class="{{ active_class(if_route('home')) }}">
                                <a   href="{{ url('/') }}">首页</a>

                            </li>
                            <li class="{{ active_class(if_route('products.index')) }} {{ active_class(if_route('products.show')) }}">
                                <a  href="{{ route('products.index') }}">商品超市</a>
                            </li>
                            <li class="{{ active_class(if_route('seckills.index')) }}">
                                <a href="{{ route('seckills.index') }}">商品秒杀</a>
                            </li>
                            <li class="{{ active_class(if_route('crowdfunding_products.index')) }}  {{ active_class(if_route('crowdfunding_products.show')) }}">
                                <a href="{{ route('crowdfunding_products.index') }}">商品众筹</a>
                            </li>
                            <li class="{{ active_class(if_route('coupon_codes.index')) }}">
                                <a href="{{ route('coupon_codes.index') }}">优惠券</a>
                            </li>
                            <li class="{{ active_class(if_route('discounts.index')) }}">
                                <a href="{{ route('discounts.index') }}"> 折扣店</a>
                            </li>
                            <li>
                                <a href="/">金融中心</a>
                            </li>
                            <li>
                                <a href="/"> 博客中心</a>
                            </li>
                        </ul>
                    </nav>
                    <!--// Navigation -->

                </div>
                <div class="col-lg-2">
                    <div class="header-contactinfo">
                        <i class="flaticon-support"></i>
                        <span>服务电话:</span>
                        <b>+0123456789</b>
                    </div>
                </div>
                <div class="col-12 d-block d-lg-none">
                    <div class="mobile-menu clearfix"></div>
                </div>
            </div>
        </div>
    </div>
    <!--// Header Bottom Area -->

</header>
<!--// Header -->