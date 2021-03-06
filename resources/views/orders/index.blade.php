@extends('layouts.app')
@section('title',"订单列表")
@section('content')

    <!-- Breadcrumb Area -->
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-grey">
            <li class="breadcrumb-item"><a href="{{ route('accounts.index') }}">个人中心</a></li>
            <li class="breadcrumb-item active" aria-current="page">我的订单</li>
        </ol>
    </nav>
    <!--// Breadcrumb Area -->
    <!-- Page Conttent -->
    <main class="page-content">
        <!-- Shopping Cart Area -->
        <div class="myorder-page-area ptb-30 bg-white">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row row-cols-1 row-cols-md-12">
                             <div class="card">
                            <div class="card-header">订单列表</div>
                            <div class="card-body">
                                <ul class="list-group">
                                    @foreach($orders as $order)
                                        <li class="list-group-item">
                                            <div class="card">
                                                <div class="card-header">
                                                    订单号：{{ $order->no }}
                                                    <span class="float-right">{{ $order->created_at->format('Y-m-d H:i:s') }}</span>
                                                </div>
                                                <div class="card-body">
                                                    <table class="table">
                                                        <thead>
                                                        <tr>
                                                            <th>商品信息</th>
                                                            <th class="text-center">单价</th>
                                                            <th class="text-center">数量</th>
                                                            <th class="text-center">订单总价</th>
                                                            <th class="text-center">状态</th>
                                                            <th class="text-center">操作</th>
                                                        </tr>
                                                        </thead>
                                                        @foreach($order->items as $index => $item)
                                                            <tr>
                                                                <td class="product-info">
                                                                    <div class="preview">
                                                                        <a target="_blank" href="{{ $item->product->type!==\App\Models\Product::TYPE_CROWDFUNDING? route('products.show', [$item->product_id]): route('crowdfunding_products.show',[$item->product_id]) }}">
                                                                            <img src="{{ $item->product->image_url }}">
                                                                        </a>
                                                                    </div>
                                                                    <div>
                                                                    <span class="product-title">
                                                                       <a target="_blank" href="{{ $item->product->type!==\App\Models\Product::TYPE_CROWDFUNDING? route('products.show', [$item->product_id]): route('crowdfunding_products.show',[$item->product_id]) }}">{{ $item->product->title }}</a>
                                                                    </span>
                                                                        <span class="sku-title">{{ $item->productSku->title }}</span>
                                                                    </div>
                                                                </td>
                                                                <td class="sku-price text-center">￥{{ $item->price }}</td>
                                                                <td class="sku-amount text-center">{{ $item->amount }}</td>
                                                                @if($index === 0)
                                                                    <td rowspan="{{ count($order->items) }}" class="text-center total-amount">￥{{ $order->total_amount }}</td>
                                                                    <td rowspan="{{ count($order->items) }}" class="text-center">
                                                                        @if($order->paid_at)
                                                                            @if($order->refund_status === \App\Models\Order::REFUND_STATUS_PENDING)
                                                                                已支付
                                                                            @else
                                                                                {{ \App\Models\Order::$refundStatusMap[$order->refund_status] }}
                                                                            @endif
                                                                        @elseif($order->closed)
                                                                            已关闭
                                                                        @else
                                                                            未支付<br>
                                                                            请于 @if($order->type==\App\Models\Order::TYPE_NORMAL){{ $order->created_at->addSeconds(config('app.order_ttl'))->format('H:i') }}
                                                                                    @elseif($order->type==\App\Models\Order::TYPE_SECKILL){{ $order->created_at->addSeconds(config('app.seckill_order_ttl'))->format('H:i') }}
                                                                                    @elseif($order->type==\App\Models\Order::TYPE_CROWDFUNDING){{ $order->created_at->addSeconds(min(config('app.order_ttl'),$item->product->crowdfunding->end_at->getTimestamp()-time()))->format('H:i') }}
                                                                            @endif
                                                                            前完成支付<br>
                                                                            否则订单将自动关闭
                                                                        @endif
                                                                    </td>
                                                                    <td rowspan="{{ count($order->items) }}" class="text-center">
                                                                        <a class="btn btn-primary btn-sm" href="{{ route('orders.show',['order'=>$order->id]) }}">查看订单</a>
                                                                        <!-- 评价入口开始 -->
                                                                        @if($order->paid_at)
                                                                            <a class="btn btn-success btn-sm" href="{{ route('orders.review.show', ['order' => $order->id]) }}">
                                                                                {{ $order->reviewed ? '查看评价' : '评价' }}
                                                                            </a>
                                                                         @endif
                                                                        <!-- 评价入口结束 -->
                                                                    </td>
                                                                @endif
                                                            </tr>
                                                        @endforeach
                                                    </table>
                                                </div>
                                            </div>
                                        </li>
                                    @endforeach
                                </ul>
                                <div class="float-right">{{ $orders->render() }}</div>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <!-- Newsletter Area -->
    @include('layouts._subscribe')
    <!--// Newsletter Area -->
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