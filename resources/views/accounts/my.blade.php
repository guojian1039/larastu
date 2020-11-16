@extends('layouts.app')
@section('content')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-grey">
            <li class="breadcrumb-item"><a href="{{ route('accounts.index') }}">个人中心</a></li>
            <li class="breadcrumb-item active" aria-current="page">个人信息</li>
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
                                <div class="card-header">资料修改</div>
                                <div class="card-body">
                                    <form method="POST" action="{{ route('users.update') }}" accept-charset="UTF-8"
                                          enctype="multipart/form-data">
                                        @csrf
                                        @method('PUT')
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="emil">Email</label>
                                                <input type="email" name="email" class="form-control" id="emil" value="{{ $user->email }}" placeholder="name@example.com">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="username">用户名</label>
                                                <input type="text" name="username" class="form-control" value="{{ $user->username }}" id="username">
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="name">姓名</label>
                                                <input type="text" name="name" class="form-control" value="{{ $user->name }}" id="name">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="phone">手机</label>
                                                <input type="text" name="phone" class="form-control" value="{{ $user->phone }}" id="phone">
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="qq">QQ</label>
                                                <input type="text" name="qq" class="form-control" value="{{ $user->qq }}" id="qq">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="gender">性别</label>
                                                <select id="gender" name="gender" class="custom-select custom-select-lg mb-3">
                                                    <option value="1" {{ $user->gender==1?'selected':'' }}>男</option>
                                                    <option value="2" {{ $user->gender==2?'selected':'' }}>女</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="birthday">生日</label>
                                            <input type="date"  name="birthday" class="form-control" value="{{ $user->birthday }}" id="birthday">
                                        </div>
                                        <div class="form-group">
                                            <label for="avatar">照片</label>
                                            <input type="file" class="form-control" name="avatar" id="avatar">
                                            @if($user->avatar)
                                                <br>
                                                <img class="thumbnail img-responsive" src="{{ $user->avatar }}" width="200" />
                                            @endif
                                        </div>

                                        <div class="form-group">
                                            <label for="introduction">个人介绍</label>
                                            <textarea class="form-control" name="introduction" id="introduction" rows="3">{{ $user->introduction }}</textarea>
                                        </div>

                                        <div class="form-group row text-center">
                                            <div class="col-12">
                                                <button class="btn btn-primary" type="submit">保存</button>
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