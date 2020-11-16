@extends('layouts.app')
@section('content')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-grey">
            <li class="breadcrumb-item"><a href="{{ route('accounts.index') }}">个人中心</a></li>
            <li class="breadcrumb-item active" aria-current="page">还款计划</li>
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
                                <div class="card-header">【{{ $title }}】还款计划</div>
                                <div class="card-body">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th scope="col">截止还款时间</th>
                                            <th scope="col">应收本金</th>
                                            <th scope="col">应收利息</th>
                                            <th scope="col">已收本金</th>
                                            <th scope="col">已收利息</th>
                                            <th scope="col">状态</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach($repaylists as $repaylist)
                                        <tr>
                                            <td>{{ $repaylist['deadline'] }}</td>
                                            <td>{{ $repaylist['capital'] }}元</td>
                                            <td>{{ $repaylist['interest'] }}元</td>
                                            <td>{{ $repaylist['receive_capital'] }}元</td>
                                            <td>{{ $repaylist['receive_interest'] }}元</td>
                                            <td>{{ \App\Models\BorrowRepayment::$statusMap[$repaylist['status']] }}</td>
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