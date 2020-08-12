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
                                <h3>{{ $product->title }}</h3>
                                <div class="pdetails-pricebox">
                                    <span class="price">￥{{ $product->price }}</span>
                                </div>

                                <div class="progress">
                                    <div class="progress-bar progress-bar-success progress-bar-striped"
                                         role="progressbar"
                                         aria-valuenow="{{ $product->crowdfunding->percent }}"
                                         aria-valuemin="0"
                                         aria-valuemax="100"
                                         style="min-width: 1em; width: {{ min($product->crowdfunding->percent, 100) }}%">
                                    </div>
                                </div>

                            <div class="pdetails-categories">
                                <div class="sales_and_reviews">
                                    <div class="sold_count">当前进度 <span class="count">{{ $product->crowdfunding->percent }}%</span></div>
                                    <div class="review_count">支持者 <span class="count">{{ $product->crowdfunding->user_count }}名</span></div>
                                </div>
                            </div>
                                <div class="pdetails-categories">
                                <!-- 如果众筹状态是众筹中，则输出提示语 -->
                                @if ($product->crowdfunding->status === \App\Models\CrowdfundingProduct::STATUS_FUNDING)
                                    <div>此项目必须在
                                        <span class="text-red">{{ $product->crowdfunding->end_at->format('Y-m-d H:i:s') }}</span>
                                        前得到
                                        <span class="text-red">￥{{ $product->crowdfunding->target_amount }}</span>
                                        的支持才可成功，
                                        <!-- Carbon 对象的 diffForHumans() 方法可以计算出与当前时间的相对时间，更人性化 -->
                                        筹款将在<span class="text-red">{{ $product->crowdfunding->end_at->diffForHumans(now()) }}</span>结束！
                                    </div>
                                @endif
                                </div>

                                <div class="skus pdetails-categories">
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

                                <div class="pdetails-categories">
                                    <span>已筹到 :</span>
                                    ￥{{ $product->crowdfunding->total_amount }}
                                </div>
                                @if(Auth::check())
                                    @if($favored)
                                        <a  href="javascript:void();" class="ho-button btn-disfavor">取消收藏</a>
                                    @else
                                        <a  href="javascript:void();" class="ho-button btn-favor">❤ 加入收藏</a>
                                    @endif
                                    @if($product->crowdfunding->status === \App\Models\CrowdfundingProduct::STATUS_FUNDING)
                                            <a href="javascript:void();" class="ho-button btn-crowdfunding">
                                                <i class="lnr lnr-cart"></i>
                                                <span>参与众筹</span>
                                            </a>
                                    @else
                                        <a class="ho-button btn-primary disabled">
                                            {{ \App\Models\CrowdfundingProduct::$statusMap[$product->crowdfunding->status] }}
                                        </a>
                                    @endif
                                @else
                                    <a class="ho-button btn-primary" href="{{ route('login') }}">请先登录</a>
                                @endif

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

                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
        <!--// Product Details Area -->

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
            $('[data-toggle="tooltip"]').tooltip({trigger: 'hover'});
            $('.sku-btn').click(function () {

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

            $('.btn-crowdfunding').click(function () {
                // 判断是否选中 SKU
                if (!$('label.active input[name=skus]').val()) {
                    swal('请先选择商品');
                    return;
                }
                // 把用户的收货地址以 JSON 的形式放入页面，赋值给 addresses 变量
                var addresses = {!! json_encode(Auth::check() ? Auth::user()->addresses : []) !!};
                // 使用 jQuery 动态创建一个表单
                var $form = $('<form></form>');
                // 表单中添加一个收货地址的下拉框
                $form.append('<div class="form-group row">' +
                    '<label class="col-form-label col-sm-3">选择地址</label>' +
                    '<div class="col-sm-9">' +
                    '<select class="custom-select" name="address_id"></select>' +
                    '</div></div>');
                // 循环每个收货地址
                addresses.forEach(function (address) {
                    // 把当前收货地址添加到收货地址下拉框选项中
                    $form.find('select[name=address_id]')
                        .append("<option value='" + address.id + "'>" +
                            address.full_address + ' ' + address.contact_name + ' ' + address.contact_phone +
                            '</option>');
                });
                // 在表单中添加一个名为 购买数量 的输入框
                $form.append('<div class="form-group row">' +
                    '<label class="col-form-label col-sm-3">购买数量</label>' +
                    '<div class="col-sm-9"><input class="form-control" name="amount">' +
                    '</div></div>');
                // 调用 SweetAlert 弹框
                swal({
                    text: '参与众筹',
                    content: $form[0], // 弹框的内容就是刚刚创建的表单
                    buttons: ['取消', '确定']
                }).then(function (ret) {
                    // 如果用户没有点确定按钮，则什么也不做
                    if (!ret) {
                        return;
                    }
                    // 构建请求参数
                    var req = {
                        address_id: $form.find('select[name=address_id]').val(),
                        amount: $form.find('input[name=amount]').val(),
                        sku_id: $('label.active input[name=skus]').val()
                    };

                    // 调用众筹商品下单接口
                    axios.post('{{ route('crowdfunding_orders.store') }}', req)
                        .then(function (response) {
                            // 订单创建成功，跳转到订单详情页
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
        })(jQuery);
    </script>
    <script src="/js/com.js"></script>
@endsection