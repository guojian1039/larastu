@extends('layouts.app')
@section('title',"商品收藏")
@section('content')
    <!-- Breadcrumb Area -->
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-grey">
            <li class="breadcrumb-item"><a href="{{ route('accounts.index') }}">个人中心</a></li>
            <li class="breadcrumb-item active" aria-current="page">我的收藏</li>
        </ol>
    </nav>
    <!--// Breadcrumb Area -->
    <!-- Page Conttent -->
    <main class="page-content">

        <!-- Shopping Cart Area -->
        <div class="favorite-page-area ptb-20 bg-white">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        @include('accounts._menu')
                    </div>
                    <div class="col-lg-9">
                        <div class="row row-cols-1 row-cols-md-12">

                            <div class="card">
                                <div class="card-header">个人收藏</div>
                                <div class="card-body">
                                    <!-- Cart Products -->
                                    <div class="cart-table table-responsive">
                                        <table class="table table-bordered table-hover mb-0">
                                            <thead>
                                            <tr>
                                                <th class="cart-column-productname" scope="col">商品信息</th>
                                                <th class="cart-column-price" scope="col">单价</th>
                                                <th class="cart-column-quantity" scope="col">评分</th>
                                                <th class="cart-column-total" scope="col">销量</th>
                                                <th class="cart-column-remove" scope="col">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($products as $product)
                                                <tr data-id="{{ $product->id }}">
                                                    <td class="product_info">
                                                        <div class="preview">
                                                            @if($product->type === \App\Models\Product::TYPE_CROWDFUNDING)
                                                                <a target="_blank" href="{{ route('crowdfunding_products.show', ['product'=>$product->id]) }}">
                                                                    <img width="100" height="80" src="{{ $product->image_url }}">
                                                                </a>
                                                            @else
                                                                <a target="_blank" href="{{ route('products.show', ['product'=>$product->id]) }}">
                                                                    <img width="100" height="80" src="{{ $product->image_url }}">
                                                                </a>
                                                            @endif
                                                        </div>
                                                        <div @if(!$product->on_sale) class="not_on_sale" @endif>
                                      <span class="product_title">
                                          @if($product->type === \App\Models\Product::TYPE_CROWDFUNDING)
                                              <a target="_blank" href="{{ route('crowdfunding_products.show', ['product'=>$product->id]) }}">{{ $product->title }}</a>
                                          @else
                                              <a target="_blank" href="{{ route('products.show', ['product'=>$product->id]) }}">{{ $product->title }}</a>
                                          @endif
                                      </span>
                                                        </div>
                                                    </td>
                                                    <td >￥<span class="sku-price">{{ $product->price }}</span></td>
                                                    <td>
                                                        {{ $product->rating }}
                                                    </td>
                                                    <td>
                                                        {{ $product->sold_count }}
                                                    </td>
                                                    <td>
                                                        <button class="remove-product"><i class="ion ion-ios-close"></i></button>
                                                    </td>
                                                </tr>

                                            @endforeach

                                            </tbody>
                                        </table>
                                    </div>
                                    <!--//  Products -->

                                    {{ $products->render() }}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


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

@section('scriptAfterJs')
    <script>
        (function ($) {

            /* Custom Selectbox */
            $('select').niceSelect();


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
                    axios.delete('products/'+sku_id+'/favorite').then(function () {
                        $this.remove();
                    });
                })

            })


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