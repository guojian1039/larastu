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
                    <a href="index.html" class="header-logo">
                        <img src="/images/logo/logo-white.png" alt="logo">
                    </a>
                </div>
                <div class="col-lg-6 col-12 order-3 order-lg-2">
                    <form action="#" class="header-searchbox">
                        <select class="select-searchcategory">
                            <option value="0">All categories</option>
                            @foreach($topCategorys as $category)
                                <option value="{{ $category->id }}">{{ $category->name }}</option>
                            @endforeach
                        </select>
                        <input type="text" placeholder="Enter your search key ...">
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
                                        <a href="wishlist.html">我的收藏</a>
                                    </li>
                                    <li>
                                        <a href="wishlist.html">我的订单</a>
                                    </li>
                                    <li>
                                        <a href="checkout.html">结账中心</a>
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
                                <a class="header-carticon" href="cart.html"><i class="lnr lnr-cart"></i><span class="count">2</span></a>
                                <!-- Minicart -->
                                <div class="header-minicart minicart">
                                    <div class="minicart-header">
                                        <div class="minicart-product">
                                            <div class="minicart-productimage">
                                                <a href="product-details.html">
                                                    <img src="/upload/product/thumbnail/product-image-1.jpg" alt="product image">
                                                </a>
                                                <span class="minicart-productquantity">1x</span>
                                            </div>
                                            <div class="minicart-productcontent">
                                                <h6><a href="product-details.html">P-Series 4K UHD Dolby Vision HDR Roku Smart TV</a></h6>
                                                <span class="minicart-productprice">$43.00</span>
                                            </div>
                                            <button class="minicart-productclose"><i class="ion ion-ios-close-circle"></i></button>
                                        </div>
                                        <div class="minicart-product">
                                            <div class="minicart-productimage">
                                                <a href="product-details.html">
                                                    <img src="/upload/product/thumbnail/product-image-2.jpg" alt="product image">
                                                </a>
                                                <span class="minicart-productquantity">1x</span>
                                            </div>
                                            <div class="minicart-productcontent">
                                                <h6><a href="product-details.html">HD Video Recording PJ Handycam Camcorder</a></h6>
                                                <span class="minicart-productprice">$43.00</span>
                                            </div>
                                            <button class="minicart-productclose"><i class="ion ion-ios-close-circle"></i></button>
                                        </div>
                                    </div>
                                    <ul class="minicart-pricing">
                                        <li>Subtotal <span>$24.12</span></li>
                                        <li>Shipping <span>$7.00</span></li>
                                        <li>Taxes <span>$0.00</span></li>
                                        <li>Total <span>$31.12</span></li>
                                    </ul>
                                    <div class="minicart-footer">
                                        <a href="cart.html" class="ho-button ho-button-fullwidth">
                                            <span>购物车</span>
                                        </a>
                                        <a href="checkout.html" class="ho-button ho-button-dark ho-button-fullwidth">
                                            <span>结账中心</span>
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
                            <li class="active dropdown-holder">
                                <a href="{{ route('home') }}">首页</a>
                                <ul class="hodropdown">
                                    <li><a href="index.html"><i class="ion ion-ios-home"></i> Home Version 1</a></li>
                                    <li><a href="index-2.html"><i class="ion ion-ios-home"></i> Home Version 2</a></li>
                                    <li><a href="index-3.html"><i class="ion ion-ios-home"></i> Home Version 3</a></li>
                                </ul>
                            </li>
                            <li class="dropdown-holder">
                                <a href="shop-rightsidebar.html">商品超市</a>
                                <ul class="hodropdown">
                                    <li><a href="shop-rightsidebar.html">Shop Grid</a>
                                        <ul>
                                            <li><a href="shop-rightsidebar.html">Shop Right Sidebar</a></li>
                                            <li><a href="shop-leftsidebar.html">Shop Left Sidebar</a></li>
                                            <li><a href="shop-3-column.html">Shop 3 Column</a></li>
                                            <li><a href="shop-4-column.html">Shop 4 Column</a></li>
                                            <li><a href="shop-list.html">Shop List</a></li>
                                            <li><a href="shop-list-rightsidebar.html">Shop List Right Sidebar</a></li>
                                            <li><a href="shop-list-leftsidebar.html">Shop List Left Sidebar</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="product-details.html">Product Details</a>
                                        <ul>
                                            <li><a href="product-details.html">Product Details</a></li>
                                            <li><a href="product-details-reverse.html">Product Details Reverse</a></li>
                                            <li><a href="product-details-variable.html">Product Details Variable</a></li>
                                            <li><a href="product-details-vertical.html">Product Details Vertical</a></li>
                                            <li><a href="product-details-gallery.html">Product Details Gallery</a></li>
                                            <li><a href="product-details-group.html">Product Details Group</a></li>
                                            <li><a href="product-details-affiliate.html">Product Details Affiliate</a></li>
                                            <li><a href="product-details-slider.html">Product Details Slider</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="cart.html">Cart</a></li>
                                    <li><a href="wishlist.html">Wishlist</a></li>
                                    <li><a href="checkout.html">Checkout</a></li>
                                    <li><a href="compare.html">Compare</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="about-us.html">商品秒杀</a>
                            </li>
                            <li>
                                <a href="about-us.html">商品众筹</a>
                            </li>
                            <li class="megamenu-holder">
                                <a href="#">优惠券</a>
                                <ul class="megamenu">
                                    <li><a href="shop-rightsidebar.html">Shop</a>
                                        <ul>
                                            <li><a href="shop-rightsidebar.html">Shop Right Sidebar</a></li>
                                            <li><a href="shop-leftsidebar.html">Shop Left Sidebar</a></li>
                                            <li><a href="shop-3-column.html">Shop 3 Column</a></li>
                                            <li><a href="shop-4-column.html">Shop 4 Column</a></li>
                                            <li><a href="shop-list.html">Shop List</a></li>
                                            <li><a href="shop-list-rightsidebar.html">Shop List Right Sidebar</a></li>
                                            <li><a href="shop-list-leftsidebar.html">Shop List Left Sidebar</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="shop-rightsidebar.html">Product Details</a>
                                        <ul>
                                            <li><a href="product-details.html">Product Details</a></li>
                                            <li><a href="product-details-reverse.html">Product Details Reverse</a></li>
                                            <li><a href="product-details-variable.html">Product Details Variable</a></li>
                                            <li><a href="product-details-vertical.html">Product Details Vertical</a></li>
                                            <li><a href="product-details-gallery.html">Product Details Gallery</a></li>
                                            <li><a href="product-details-group.html">Product Details Group</a></li>
                                            <li><a href="product-details-affiliate.html">Product Details Affiliate</a></li>
                                            <li><a href="product-details-slider.html">Product Details Slider</a></li>
                                            <li><a href="product-details-slider.html">Product Details Slider</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="shop-rightsidebar.html">Other Pages</a>
                                        <ul>
                                            <li><a href="cart.html">Cart</a></li>
                                            <li><a href="wishlist.html">Wishlist</a></li>
                                            <li><a href="checkout.html">Checkout</a></li>
                                            <li><a href="compare.html">Compare</a></li>
                                            <li><a href="my-account.html">My Account</a></li>
                                            <li><a href="login-register.html">Login Register</a></li>
                                            <li><a href="about-us.html">About Us</a></li>
                                            <li><a href="contact.html">Contact</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="blog-rightsidebar.html">Blog Pages</a>
                                        <ul>
                                            <li><a href="blog-rightsidebar.html">Blog Right Sidebar</a></li>
                                            <li><a href="blog-leftsidebar.html">Blog Left Sidebar</a></li>
                                            <li><a href="blog-details.html">Blog Details</a></li>
                                            <li><a href="blog-details-rightsidebar.html">Blog Details Right Sidebar</a></li>
                                            <li><a href="blog-details-leftsidebar.html">Blog Details Left Sidebar</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="contact.html"> 折扣店</a>
                            </li>
                            <li class="dropdown-holder">
                                <a href="blog-rightsidebar.html">金融中心</a>
                                <ul class="hodropdown">
                                    <li><a href="blog-rightsidebar.html">Blog Right Sidebar</a></li>
                                    <li><a href="blog-leftsidebar.html">Blog Left Sidebar</a></li>
                                    <li><a href="blog-details.html">Blog Details</a></li>
                                    <li><a href="blog-details-rightsidebar.html">Blog Details Right Sidebar</a></li>
                                    <li><a href="blog-details-leftsidebar.html">Blog Details Left Sidebar</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="contact.html"> 博客中心</a>
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