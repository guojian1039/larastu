@extends('layouts.app')
@section('title',($address->id ? '修改': '新增')."收货地址")
@section('content')
    <!-- Breadcrumb Area -->
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-grey">
            <li class="breadcrumb-item"><a href="{{ route('home') }}">首页</a></li>
            <li class="breadcrumb-item active" aria-current="page">收货地址</li>
        </ol>
    </nav>
    <!--// Breadcrumb Area -->
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
                        <div class="card panel-default">
                            <div class="card-header">
                                <h2 class="text-center"> {{ $address->id?"修改":"新增" }}收货地址</h2>
                            </div>
                            <div class="card-body">
                                <!-- 输出后端报错开始 -->
                                @if (count($errors) > 0)
                                    <div class="alert alert-danger">
                                        <h4>有错误发生：</h4>
                                        <ul>
                                    @foreach($errors->all() as $error)

                                        <li><i class="glyphicon glyphicon-remove"></i>{{ $error }}</li>
                                    @endforeach
                                        </ul>
                                    </div>
                                @endif
                                <!-- 输出后端报错结束 -->
                                <!--inline-template 代表通过内联方式引入组件-->
                                <user-addresses-create-and-edit inline-template>
                                    @if($address->id)
                                    <form class="form-horizontal" role="form" method="post" action="{{ route('addresses.update',['userAddress'=>$address->id]) }}">
                                    {{ method_field('PUT') }}
                                    @else
                                        <form class="form-horizontal" role="form" method="post" action="{{ route('addresses.store')}}">
                                    @endif
                                        @csrf
                                        <select-district  @change="onDistrictChanged" :init-value="{{ json_encode([old('province',$address->province),old('city',$address->city),old('district',$address->district)]) }}" inline-template>
                                            <div class="form-group row">
                                                <label class="col-form-label col-sm-2 text-md-right">省市区</label>
                                                <div class="col-sm-3">
                                                    <select class="form-control" v-model="provinceId">
                                                        <option value="">选择省</option>
                                                        <option  v-for="(name,id) in provinces" :value="id">@{{ name }}</option>
                                                    </select>
                                                </div>
                                                <div class="col-sm-3">
                                                    <select class="form-control" v-model="cityId">
                                                        <option value="">选择市</option>
                                                        <option  v-for="(name,id) in cities" :value="id">@{{ name }}</option>
                                                    </select>
                                                </div>
                                                <div class="col-sm-3">
                                                    <select class="form-control" v-model="districtId">
                                                        <option value="">选择区</option>
                                                        <option  v-for="(name,id) in districts" :value="id">@{{ name }}</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </select-district>
                                                <!-- 插入了 3 个隐藏的字段 -->
                                                <!-- 通过 v-model 与 user-addresses-create-and-edit 组件里的值关联起来 -->
                                                <input type="hidden" name="province" v-model="province">
                                                <input type="hidden" name="city" v-model="city">
                                                <input type="hidden" name="district" v-model="district">
                                                <div class="form-group row">
                                                    <label class="col-form-label text-md-right col-sm-2">详细地址</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" name="address" value="{{ old("address",$address->address) }}">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-form-label text-md-right col-sm-2">邮编</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" name="zip" value="{{ old("zip",$address->zip) }}">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-form-label text-md-right col-sm-2">联系人</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" name="contact_name" value="{{ old("contact_name",$address->contact_name) }}">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-form-label text-md-right col-sm-2">电话</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" name="contact_phone" value="{{ old("contact_phone",$address->contact_phone) }}">
                                                    </div>
                                                </div>
                                                <div class="form-group row text-center">
                                                    <div class="col-12">
                                                        <button type="submit" class="btn btn-primary">提交</button>
                                                    </div>
                                                </div>
                                    </form>
                                </user-addresses-create-and-edit>
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
    $('#category_id').niceSelect();
</script>
@endsection