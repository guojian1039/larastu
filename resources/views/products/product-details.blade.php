@extends('layouts.app')
@section('title',"商品")
@section('content')
    <!-- Breadcrumb Area -->
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-grey">
            <li class="breadcrumb-item"><a href="{{ url('/') }}">首页</a></li>
            <li class="breadcrumb-item active" aria-current="page">商品</li>
        </ol>
    </nav>
    <!--// Breadcrumb Area -->
    <!-- Page Conttent -->
    <main class="page-content">
        <!-- Product Details Area -->
        <div class="product-details-area bg-white ptb-30">
            <div class="container">

                <div class="pdetails">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="pdetails-images">
                                <div class="pdetails-largeimages pdetails-imagezoom">
                                    @foreach($product->pics as $pic)
                                    <div class="pdetails-singleimage" data-src="{{ url_image($pic->image) }}">
                                        <img src="{{ url_image($pic->image) }}" alt="{{ $pic->description }}">
                                    </div>
                                    @endforeach
                                </div>

                                <div class="pdetails-thumbs">
                                    @foreach($product->pics as $pic)
                                    <div class="pdetails-singlethumb">
                                        <img src="{{ url_image(get_thumb_pic($pic->image)) }}" alt="">
                                    </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="pdetails-content">

                                <div class="rattingbox">
                                    <span class="{{ active_class(floor($product->rating)>=1) }}"><i class="ion ion-ios-star"></i></span>
                                    <span class="{{ active_class(floor($product->rating)>=2) }}"><i class="ion ion-ios-star"></i></span>
                                    <span class="{{ active_class(floor($product->rating)>=3) }}"><i class="ion ion-ios-star"></i></span>
                                    <span class="{{ active_class(floor($product->rating)>=4) }}"><i class="ion ion-ios-star"></i></span>
                                    <span class="{{ active_class(floor($product->rating)>=5) }}"><i class="ion ion-ios-star"></i></span>
                                </div>
                                <h3>{{ $product->title }}</h3>
                                <div class="pdetails-pricebox">
                                    @if($product->discount_num>0)
                                    <del class="oldprice">￥{{ $product->original_price }}</del>
                                    @endif
                                    <span class="price">￥{{ $product->price }}</span>
                                     @if($product->discount_num>0)
                                    <span class="badge">节省 {{ 100-$product->discount_num }}%</span>
                                     @endif
                                </div>
                                <div class="sales_and_reviews">
                                    <div class="sold_count">累计销量 <span class="count">{{ $product->sold_count }}</span></div>
                                    <div class="review_count">累计评价 <span class="count">{{ $product->review_count }}</span></div>
                                </div>
                                <div class="skus">
                                    <label>选择</label>
                                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                        @foreach($product->skus as $sku)
                                            <label class="btn sku-btn"
                                                   data-price="{{ $sku->price }}"
                                                   data-original_price="{{ $sku->original_price }}"
                                                   data-stock="{{ $sku->stock }}"
                                                   data-toggle="tooltip"
                                                   title="{{ $sku->description }}"
                                                   data-placement="bottom">
                                                <input type="radio" name="skus" autocomplete="off" value="{{ $sku->id }}"> {{ $sku->title }}
                                            </label>
                                        @endforeach
                                    </div>
                                </div>
                                <div class="pdetails-quantity">
                                    数量：
                                    <div class="quantity-select">
                                        <input type="text" name="amount" value="1">
                                        <div class="inc qtybutton">+<i class="ion ion-ios-arrow-up"></i></div>
                                        <div class="dec qtybutton">-<i class="ion ion-ios-arrow-down"></i></div>
                                    </div>
                                    <span class="stock"></span>
                                </div>
                                @if($favored)
                                <a   href="javascript:void()" class="ho-button btn-disfavor">取消收藏</a>
                                @else
                                    <a  href="javascript:void()" class="ho-button btn-favor">❤ 加入收藏</a>
                                @endif
                                @if($product->type==\App\Models\Product::TYPE_SECKILL)
                                    @if(Auth::check())
                                        @if($product->seckill->start_at>\Carbon\Carbon::now())
                                            <button class="ho-button btn-primary btn-seckill disabled countdown">抢购倒计时</button>
                                        @elseif($product->seckill->end_at<\Carbon\Carbon::now())
                                            <button class="ho-button btn-primary btn-seckill disabled">抢购已结束</button>
                                        @else
                                            <button class="ho-button btn-primary btn-seckill">立即抢购</button>
                                        @endif
                                    @else
                                        <a class="ho-button btn-primary" href="{{ route('login') }}">请先登录</a>
                                    @endif
                                <!-- 秒杀商品下单按钮结束 -->
                                    @else
                                    <a href="javascript:void()" class="ho-button btn-cart">
                                        <i class="lnr lnr-cart"></i>
                                        <span>加入购物车</span>
                                    </a>
                                @endif
                                <!--
                                <div class="pdetails-categories">
                                    <span>Categories :</span>
                                    <ul>
                                        <li><a href="shop-rightsidebar.html">目录</a></li>
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

                <div class="pdetails-allinfo">

                    <ul class="nav pdetails-allinfotab justify-content-center" id="product-details" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="product-details-area1-tab" data-toggle="tab" href="#product-details-area1"
                               role="tab" aria-controls="product-details-area1" aria-selected="true">详细信息</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="product-details-area2-tab" data-toggle="tab" href="#product-details-area2"
                               role="tab" aria-controls="product-details-area2" aria-selected="false">评论 ({{ count($reviews) }})</a>
                        </li>
                    </ul>

                    <div class="tab-content" id="product-details-ontent">
                        <div class="tab-pane fade show active" id="product-details-area1" role="tabpanel"
                             aria-labelledby="product-details-area1-tab">
                            <div class="pdetails-description">
                                {{ $product->description }}
                            </div>
                        </div>
                        <div class="tab-pane fade" id="product-details-area2" role="tabpanel" aria-labelledby="product-details-area2-tab">
                            <div class="pdetails-reviews">
                                <div class="product-review">
                                    <div class="commentlist">
                                        @foreach($reviews as $review)
                                         <div class="single-comment">
                                            <div class="single-comment-thumb">
                                                <img src="https://cdn.learnku.com/uploads/images/201801/03/1/MFCtSTiGzj.jpg" class="img-responsive img-circle" width="60px" height="60px">
                                            </div>
                                            <div class="single-comment-content">
                                                <div class="single-comment-content-top">
                                                    <h6>{{ $review->order->user->name }} – {{ $review->reviewed_at->format('Y-m-d H:i') }}</h6>
                                                    <div class="rattingbox">
                                                        {!! str_repeat('<span class="active"><i class="ion ion-ios-star"></i></span>', $review->rating) !!}
                                                        {!! str_repeat('<span><i class="ion ion-ios-star"></i></span>', 5 - $review->rating) !!}
                                                    </div>
                                                </div>
                                                <p>{{ $review->review }}</p>
                                            </div>
                                        </div>
                                        @endforeach
                                    </div>

                                    <div class="commentbox mt-5">
                                        <h5>新增评论</h5>
                                        <form action="#" class="ho-form">
                                            <div class="ho-form-inner">
                                                <div class="single-input">
                                                    <label>评分</label>
                                                    <div class="rattingbox hover-action">
                                                        <span class="active"><i class="ion ion-ios-star"></i></span>
                                                        <span class="active"><i class="ion ion-ios-star"></i></span>
                                                        <span class="active"><i class="ion ion-ios-star"></i></span>
                                                        <span><i class="ion ion-ios-star"></i></span>
                                                        <span><i class="ion ion-ios-star"></i></span>
                                                    </div>
                                                </div>
                                                <div class="single-input">
                                                    <label for="new-review-textbox">评价</label>
                                                    <textarea id="new-review-textbox" cols="30" rows="5"></textarea>
                                                </div>
                                                <div class="single-input">
                                                    <button class="ho-button btn-sub-review" type="button"><span>提交</span></button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
        <!--// Product Details Area -->

        <!-- Related Product Area -->
        <div class="ho-section related-product-area pb-30">
            <div class="container">
                <div class="section-title">
                    <h3>相似商品</h3>
                </div>
                @include('home.silder_product',['items'=>$similar_products,'sclass'=>'product-slider new-best-featured-slider slider-navigation-2','different_class'=>''])
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
    <!-- 如果是秒杀商品并且尚未开始秒杀，则引入 momentjs 类库 -->
    @if($product->type == \App\Models\Product::TYPE_SECKILL && \Carbon\Carbon::now()<$product->seckill->start_at)
        <script src="https://cdn.bootcss.com/moment.js/2.22.1/moment.min.js"></script>
    @endif
    <script>
        (function ($) {
            // 如果是秒杀商品并且尚未开始秒杀
            @if($product->type == \App\Models\Product::TYPE_SECKILL && \Carbon\Carbon::now()<$product->seckill->start_at)
            // 将秒杀开始时间转成一个 moment 对象
            var startTime = moment.unix({{ $product->seckill->start_at->getTimestamp() }});
            // 设定一个定时器
            var hdl = setInterval(function () {
                // 获取当前时间
                var now = moment();
                // 如果当前时间晚于秒杀开始时间
                if (now.isAfter(startTime)) {
                    // 将秒杀按钮上的 disabled 类移除，修改按钮文字
                    $('.btn-seckill').removeClass('disabled').removeClass('countdown').text('立即抢购');
                    // 清除定时器
                    clearInterval(hdl);
                    return;
                }

                // 获取当前时间与秒杀开始时间相差的小时、分钟、秒数
                var hourDiff = startTime.diff(now, 'hours');
                var minDiff = startTime.diff(now, 'minutes') % 60;
                var secDiff = startTime.diff(now, 'seconds') % 60;
                // 修改按钮的文字
                $('.btn-seckill').text('抢购倒计时 '+hourDiff+':'+minDiff+':'+secDiff);
            }, 500);
            @endif
            $('[data-toggle="tooltip"]').tooltip({trigger: 'hover'});
            $('.sku-btn').click(function () {
                $('.pdetails-content .price').text($(this).data('price'));
                $('.pdetails-content .oldprice').text($(this).data('original_price'));
                if($(this).data('original_price')>$(this).data('price'))
                {
                    $('.pdetails-content .badge').text('节省 ￥'+($(this).data('original_price')-$(this).data('price')));
                }

                $('.pdetails-content .stock').text('库存：' + $(this).data('stock') + '件');
            });
            $('.sku-btn').eq(0).click();
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
                });
            }
            productQuantity();


            $('.btn-favor').click(function () {
               axios.post('{{ route('products.favor',['product'=>$product->id]) }}').then(function () {
                   swal('收藏成功','','success').then(function () {
                       location.reload();
                   })
               },function (error) {

                   if(error.response && error.response.status===401){
                       swal('请先登录','','error').then(function () {
                           location.href='{{ route('login') }}';
                       })
                   }else if(error.response && error.response.data.message){
                       swal(error.response.data.message,'','error');
                   }else{
                       swal('系统错误','','error');
                   }

               })
            });
            $('.btn-disfavor').click(function () {
               axios.delete('{{ route('products.disfavor',['product'=>$product->id]) }}').then(function () {
                   swal('取消成功','','success').then(function () {
                       location.reload();
                   })
               }) ;
            });
            $('.btn-cart').click(function () {
               axios.post('{{ route('cart.store') }}',{
                   amount:$('.pdetails-content input[name=amount]').prop('value'),
                   sku_id:$('label.active input[name=skus]').val()
               }).then(function () {
                   swal('加入购物车成功','','success').then(function () {
                       location.href='{{ route('cart.index') }}';
                   })
               },function (error) {
                   console.log(error.response.data);
                   if(error.response && error.response.status ===401){
                       swal('请先登录','','error').then(function () {
                           location.href='{{ route('login') }}'
                       })
                   }else if(error.response.status ===422){
                       // http 状态码为 422 代表用户输入校验失败
                       var html = '<div>';
                       _.each(error.response.data.errors,function (errors) {
                           _.each(errors,function (error) {
                               html+=error+'<br>';
                           })
                       })
                       html+='</div>';
                       swal({content:$(html)[0],icon:'error'});
                   }else{
                       swal('系统错误','','error');
                   }
               })
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
            $('.btn-sub-review').click(function () {
               swal('暂不支持直接评论','','error');
            });
            // 秒杀按钮点击事件
            $('.btn-seckill').click(function () {
                // 如果秒杀按钮上有 disabled 类，则不做任何操作
                if($(this).hasClass('disabled')) {
                    return;
                }
                if (!$('label.active input[name=skus]').val()) {
                    swal('请先选择商品');
                    return;
                }
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
                    // 如果用户没有点确定按钮，则什么也不做
                    if (!ret) {
                        return;
                    }
                    // 构建请求参数
                    var req = {
                        address_id: addressSelector.val(),
                        sku_id: $('label.active input[name=skus]').val()
                    };
                    // 调用秒杀商品下单接口
                    axios.post('{{ route('seckill_orders.store') }}', req)
                        .then(function (response) {
                            swal('订单提交成功', '', 'success')
                                .then(() => {
                                    location.href = '/orders/' + response.data.id;
                                });
                        }, function (error) {
                            // 输入参数校验失败，展示失败原因
                            if (error.response.status === 422) {
                                var html = '<div>';
                                _.each(error.response.data.errors, function (errors) {
                                    _.each(errors, function (error) {
                                        html += error+'<br>';
                                    })
                                });
                                html += '</div>';
                                swal({content: $(html)[0], icon: 'error'})
                            } else if (error.response.status === 403) {
                                swal(error.response.data.msg, '', 'error');
                            } else {
                                swal('系统错误', '', 'error');
                            }
                        });
                });
            });
        })(jQuery);
    </script>
    <script src="/js/com.js"></script>
@endsection