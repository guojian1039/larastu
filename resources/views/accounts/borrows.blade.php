@extends('layouts.app')
@section('content')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-grey">
            <li class="breadcrumb-item"><a href="{{ route('accounts.index') }}">个人中心</a></li>
            <li class="breadcrumb-item active" aria-current="page">融资信息</li>
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
                                <div class="card-header">融资信息</div>
                                <div class="card-body">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th scope="col">名称</th>
                                            <th scope="col">融资金额</th>
                                            <th scope="col">还款期数</th>
                                            <th scope="col">已还期数</th>
                                            <th scope="col">到账金额</th>
                                            <th scope="col">状态</th>
                                            <th scope="col">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach($borrows as $borrow)
                                        <tr>
                                            <td>{{ $borrow['title'] }}</td>
                                            <td>{{ $borrow['money']/10000 }}万元</td>
                                            <td>{{ $borrow['repayment_times'] }}</td>
                                            <td>{{ $borrow['repayment_already_times'] }}</td>
                                            <td>{{ ($borrow['money']-$borrow['fee'])/10000 }}万元</td>
                                            <td>{{ \App\Models\Borrow::$statusMap[$borrow['status']] }}</td>
                                            <td>
                                                @if($borrow['status']==\App\Models\Borrow::STATUS_SUCCESS)
                                                    <a class="btn btn-success" href="{{ route('borrows.repay.index',['borrow'=>$borrow['id']]) }}">还款情况</a>
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