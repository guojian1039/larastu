@extends('layouts.app')
@section('content')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-grey">
            <li class="breadcrumb-item"><a href="{{ route('home') }}">首页</a></li>
            <li class="breadcrumb-item active" aria-current="page">个人中心</li>
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
                        <div class="row row-cols-1 row-cols-md-3">
                            <div class="col mb-4">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <h5 class="card-title">欢迎来到个人中心</h5>
                                        <p class="card-text"><a href="{{ route('users.deposit') }}" class="btn btn-primary">充值</a><a href="{{ route('users.withdraw') }}" class="btn btn-danger float-right">提现</a></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col mb-4">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <h5 class="card-title">账户信息</h5>
                                        <p class="card-text">余额：{{ $balance/10000 }}万元<a href="{{ route('users.wallets') }}" class="btn btn-danger float-right">资金记录</a></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col mb-4">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <h5 class="card-title">投资信息</h5>
                                        <p class="card-text">待收：{{ $rest_receive }}元</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row row-cols-1 row-cols-md-12">

                            <div class="card">
                                <div class="card-header">即将还款</div>
                                <div class="card-body">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th scope="col">名称</th>
                                            <th scope="col">期数</th>
                                            <th scope="col">截止还款时间</th>
                                            <th scope="col">还款金额</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach($borrows as $borrow)
                                        <tr>
                                            <td>{{ $borrow['title'] }}</td>
                                            <td>{{ $borrow['batch'] }}</td>
                                            <td>{{ $borrow['next_repaytime'] }}</td>
                                            <td>{{ $borrow['repay_sum'] }}元</td>
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