@extends('layouts.app')
@section('content')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-grey">
            <li class="breadcrumb-item"><a href="{{ route('accounts.index') }}">个人中心</a></li>
            <li class="breadcrumb-item active" aria-current="page">投资信息</li>
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
                                <div class="card-header">投资信息</div>
                                <div class="card-body">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th scope="col">名称</th>
                                            <th scope="col">投资金额</th>
                                            <th scope="col">应收利息</th>
                                            <th scope="col">已收利息</th>
                                            <th scope="col">状态</th>
                                            <td scope="col">操作</td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach($invests as $invest)
                                        <tr>
                                            <td>{{ $invest['borrow']['title'] }}</td>
                                            <td>{{ $invest['invest_sum'] }}元</td>
                                            <td>{{ $invest['interest'] }}元</td>
                                            <td>{{ $invest['receive_interest'] }}元</td>
                                            <td>{{ \App\Models\BorrowInvest::$statusMap[$invest['status']] }}</td>
                                            <td>
                                                @if($invest['status']===\App\Models\BorrowInvest::STATUS_PROCCESSING)
                                                <a class="btn btn-success" href="{{ route('invest.repay.index',['invest'=>$invest['id']]) }}">还款计划</a>
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
        });
    </script>
@endsection