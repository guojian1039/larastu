@extends('layouts.app')
@section('title',"优惠券列表")
@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    优惠券
                </div>
                <div class="card-body">
                    <table class="table">
                            <tbody>
                            <tr>
                                <td>优惠码</td>
                                <td>类型</td>
                                <td>折扣</td>
                                <td>最低金额</td>
                                <td>使用开始时间</td>
                                <td>使用结束时间</td>
                            </tr>
                            @foreach($couponcodes as $couponcode)
                                <tr>
                                    <td class="product-info">
                                       {{ $couponcode->code }}
                                     </td>
                                    <td class="vertical-middle">
                                        {{ \App\Models\CouponCode::$typeMap[$couponcode->type] }}
                                    </td>
                                    <td>
                                        {{$couponcode->type === \App\Models\CouponCode::TYPE_FIXED ? '￥'.$couponcode->value : $couponcode->value.'%' }}
                                    </td>
                                    <td class="product-info">
                                        ￥{{ $couponcode->min_amount }}
                                    </td>
                                    <td class="product-info">
                                        {{ $couponcode->not_before }}
                                    </td>
                                    <td class="product-info">
                                        {{ $couponcode->not_after }}
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>

                </div>
            </div>
        </div>
    </div>
    <!-- Newsletter Area -->
    @include('layouts._subscribe')
    <!--// Newsletter Area -->
    </main>
@endsection
@section('scriptAfterJs')
    <script>
        $(document).ready(function () {
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
        });
    </script>
@endsection