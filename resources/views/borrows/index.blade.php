@extends('layouts.app')
@section('title',"融资列表")
@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    融资列表
                </div>
                <div class="card-body">

                    <table class="table">
                            <tbody>
                            <tr>
                                <td>名称</td>
                                <td>融资类型</td>
                                <td>融资金额</td>
                                <td>资金期限</td>
                                <td>还款方式</td>
                                <!--<td>募集天数</td>-->
                                <td>发标时间</td>
                                <td>状态</td>
                                <td>操作</td>
                            </tr>
                            @foreach($borrows as $borrow)
                                <tr data-id="{{ $borrow->id }}">
                                    <td class="product-info">
                                       {{ $borrow->title }}
                                     </td>
                                    <td class="vertical-middle">
                                        {{ config('borrow.borrowType')[$borrow->type] }}
                                    </td>
                                    <td>
                                        ￥{{$borrow->money}}
                                    </td>
                                    <td class="product-info">
                                       {{ abs($borrow->duration) }} {{  $borrow->duration>0?'月':'天' }}
                                    </td>
                                    <td>{{ config('borrow.repaymentType')[$borrow->repayment_type] }}</td>
                                    <!--
                                    <td>
                                        {{$borrow->collect_day}} 天
                                    </td>
                                    -->
                                    <td>
                                        {{$borrow->publish_time}}
                                    </td>
                                    <td>
                                        {{ \App\Models\Borrow::$statusMap[$borrow['status']] }}
                                    </td>
                                    <td>
                                        @if(\Illuminate\Support\Facades\Auth::check() && strtotime($borrow->publish_time)<=time()
                                         && strtotime("{$borrow['publish_time']} +{$borrow['collect_day']} day")>=time() && $borrow['status']==\App\Models\Borrow::STATUS_BIDDING)
                                            <button type="button" data-id="{{ $borrow->id }}" class="ho-button btn-success btn-invest ">
                                                <span>我要投资</span>
                                            </button>
                                        @endif
                                    </td>
                                </tr>
                            @endforeach
                            <tr>
                                <td colspan="6">
                                    {{ $borrows->render() }}
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

            $(document).on('click','.btn-invest',function (e) {
                if($(this).hasClass('disabled')) {
                    return;
                }
                var borrow_id=$(this).data('id');
                // 使用 jQuery 动态创建一个下拉框
                var investSum = $('<input class="form-control"></input>');

                // 调用 SweetAlert 弹框
                swal({
                    text: '输入投资金额',
                    content: investSum[0],
                    buttons: ['取消', '确定']
                }).then(function (ret) {
                    if(!ret){
                        return;
                    }
                    var invest_sum = investSum.val();

                    var req={borrow_id:borrow_id,invest_sum:invest_sum};

                    axios.post('{{ route('borrows.invest') }}',req).then(function (response) {
                        swal('投资成功', '', 'success')
                            .then(() => {

                            //转到我的投资去

                            });
                    },function (error) {
                        if(error.response.status===422){
                            var html='<div>';
                            _.each(error.response.data.errors,function (errors) {
                                _.each(errors,function (error) {
                                    html+=error+'<br>';
                                });
                            });
                            html+='</div>'
                            swal({ content:$(html)[0],icon:'error'})
                        }else if(error.response.status==403){
                            swal(error.response.data.message,'','error');
                        }else{
                            swal('系统错误','','error');
                        }
                    })
                });
            });

        });
    </script>
@endsection