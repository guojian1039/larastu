@extends('layouts.app')
@section('content')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-grey">
            <li class="breadcrumb-item"><a href="{{ route('accounts.index') }}">个人中心</a></li>
            <li class="breadcrumb-item active" aria-current="page">还款信息</li>
        </ol>
    </nav>
    <!-- Page Conttent -->
    <main class="page-content">
        <!-- Account Page Area -->
        <div class="account-page-area ptb-20">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        @include('accounts._menu')
                    </div>
                    <div class="col-lg-9">
                        <div class="row row-cols-1 row-cols-md-12">

                            <div class="card">
                                <div class="card-header">{{ $title }}</div>
                                <div class="card-body">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th scope="col">期数</th>
                                            <th scope="col">应还本金</th>
                                            <th scope="col">应还利息</th>
                                            <th scope="col">还款截止</th>
                                            <th scope="col">状态</th>
                                            <th scope="col">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach($repaylists as $repaylist)
                                            <tr>
                                                <td>{{ $repaylist['batch'] }}</td>
                                                <td>{{ $repaylist['capital']/10000 }}万元</td>
                                                <td>{{ $repaylist['interest'] }}元</td>
                                                <td>{{ $repaylist['dealtime'] }}</td>
                                                <td>{{ \App\Models\BorrowRepayment::$statusMap[$repaylist['status']] }}</td>
                                                <td>
                                                @if($repaylist['status']==\App\Models\BorrowRepayment::STATUS_PROCCESSING && $repaylist['remaindays']>0)
                                                    <a href="#"  data-id="{{ $repaylist['batch'] }}"  class="btn btn-success btn-repay">还款</a>
                                                @endif
                                                </td>
                                            </tr>
                                        @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--// Account Page Area -->
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

            $(document).on('click','.btn-repay',function (e) {
                var batch=$(this).data('id');
                var borrow_id={{ $borrow_id }};

                // 调用 SweetAlert 弹框
                swal({
                    title: '确认还款',
                    buttons: ['取消', '确定']
                }).then(function (ret) {
                    if(!ret){
                        return;
                    }


                    var req={borrow_id:borrow_id,batch:batch};
                    axios.post('{{ route('borrows.repay') }}',req).then(function (response) {
                        swal('还款成功', '', 'success')
                            .then(() => {
                                location.reload();
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