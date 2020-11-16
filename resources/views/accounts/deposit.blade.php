@extends('layouts.app')
@section('content')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-grey">
            <li class="breadcrumb-item"><a href="{{ route('accounts.index') }}">个人中心</a></li>
            <li class="breadcrumb-item active" aria-current="page">充值</li>
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
                                <div class="card-header">充值</div>
                                <div class="card-body">
                                    <form method="POST" action="{{ route('users.deposit.update') }}" >
                                        @csrf
                                        <div class="form-group row">
                                            <label for="moneynum" class="col-md-4 col-form-label text-md-right">金额(元)</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control  {{ $errors->has('moneynum') ? ' is-invalid' : '' }}" name="moneynum" id="moneynum" required>
                                                @error('moneynum')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                  </span>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="captcha" class="col-md-4 col-form-label text-md-right">验证码</label>
                                            <div class="col-md-6">
                                                <input id="captcha" class="form-control {{ $errors->has('captcha') ? ' is-invalid' : '' }}" name="captcha" required>
                                                <img class="thumbnail mt-3 mb-2" src="{{ captcha_src('flat') }}" onclick="this.src='/captcha/flat?'+Math.random()" title="点击图片重新获取验证码">
                                                @error('captcha')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                  </span>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="form-group row text-center">
                                            <div class="col-12">
                                                <button class="btn btn-primary" type="submit">充值</button>
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
            $('#inputGroupFileAddon').on('click',function (e) {
               alert('sdsd');
            });
        });
    </script>
@endsection