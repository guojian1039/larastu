@extends('layouts.app')
@section('title',"收货地址")
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
                                收货地址列表
                                <a href="{{ route('addresses.create') }}" class="float-right">新增</a>
                            </div>
                            <div class="card-body">
                                <table class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th>收货人</th>
                                        <th>地址</th>
                                        <th>邮编</th>
                                        <th>电话</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($addresses as $address)
                                    <tr>
                                        <td>{{ $address->contact_name }}</td>
                                        <td>{{ $address->full_address }}</td>
                                        <td>{{ $address->zip }}</td>
                                        <td>{{ $address->contact_name }}</td>
                                        <td>
                                            <a class=" btn btn-primary text-white" href="{{ route('addresses.edit',['userAddress'=>$address->id]) }}">修改</a>
                                            <a class="btn btn-danger text-white btn-del-address" data-id="{{ $address->id }}">删除</a>
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
        <!--// Account Page Area -->
        <!-- Newsletter Area -->
    @include('layouts._subscribe')
    <!--// Newsletter Area -->
    </main>
@endsection
@section('scriptAfterJs')
   <script>
       $(document).ready(function () {
            // 删除按钮点击事件
           $(".btn-del-address").click(function () {
                // 获取按钮上 data-id 属性的值，也就是地址 ID
               var id=$(this).data('id');
               // 调用 sweetalert
               swal(
                   {
                       title:'确认要删除该地址？',
                       dangerMode:true ,
                       icon:'warning',
                       buttons:['取消','确定']
                   }
               ).then(function (willDelete) {// 用户点击按钮后会触发这个回调函数
                   // 用户点击确定 willDelete 值为 true， 否则为 false
                   // 用户点了取消，啥也不做
                   if(!willDelete)
                   {
                       return ;
                   }
                   // 调用删除接口，用 id 来拼接出请求的 url
                   axios.delete("/addresses/"+id).then(function () {
                       // 请求成功之后重新加载页面
                      location.reload();
                   });
               })
           });
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