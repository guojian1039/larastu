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
                                <td>名称</td>
                                <td>类型</td>
                                <td>折扣</td>
                                <td>最低金额</td>
                                <td>使用开始时间</td>
                                <td>使用结束时间</td>
                                <td>领取</td>
                            </tr>
                            @foreach($coupontypes as $coupontype)
                                <tr data-id="{{ $coupontype->id }}">
                                    <td class="product-info">
                                       {{ $coupontype->title }}
                                     </td>
                                    <td class="vertical-middle">
                                        {{ \App\Models\CouponType::$typeMap[$coupontype->type] }}
                                    </td>
                                    <td>
                                        {{$coupontype->type === 1 ? '￥'.$coupontype->value : $coupontype->value.'%' }}
                                    </td>
                                    <td class="product-info">
                                        ￥{{ $coupontype->at_least }}
                                    </td>
                                    @if($coupontype->term_of_validity_type==0)
                                        <td class="product-info">
                                            {{ $coupontype->start_time }}
                                        </td>
                                        <td class="product-info">
                                            {{ $coupontype->end_time }}
                                        </td>
                                        @else
                                        <td class="product-info" colspan="2">
                                            领取之日起{{ $coupontype->fixed_term }}天内有效
                                        </td>
                                    @endif
                                    <td>
                                        <button type="button" class="ho-button btn-success btn-get-coupon">
                                            <span>领取</span>
                                        </button>
                                    </td>
                                </tr>
                            @endforeach
                            <tr>
                                <td colspan="6">
                                    {{ $coupontypes->render() }}
                                </td>
                            </tr>
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

            $('.btn-get-coupon').click(function () {
                var $this=$(this).closest('tr');
                var couponType=$this.data('id');
                axios.post('/coupon_types/'+couponType).then(function (response) {
                    console.log(response)
                    if(response.data>0){
                        swal('领取成功','','success').then(function () {
                            location.reload();
                        });
                    }else if(response.data==-1){
                        swal('请勿重复领取','','error');
                    }else {
                        swal('领取失败','','error');
                    }
                },function (error) {
                    if(error.response.status===422){
                        var html='<div>';
                        _.each(error.response.data.errors,function (errors) {
                            _.each(errors,function (error) {
                                html+=error+'<br>';
                            });
                        });
                        html+='</div>';
                        swal({content:$(html)[0],icon:'error'});
                    }else if (error.response.status === 403) { // 这里判断状态 403
                        swal(error.response.data.msg, '', 'error');
                    } else {
                        swal('系统错误','','error');
                    }
                })
            });
        });
    </script>
@endsection