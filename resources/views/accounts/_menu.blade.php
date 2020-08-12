<div class="list-group myaccount">
    <a href="#" class="list-group-item list-group-item-action list-group-item-light">桌面</a>
    <a href="#" class="list-group-item list-group-item-action list-group-item-primary">收藏夹</a>
    <a href="{{ route('cart.index') }}" class="list-group-item list-group-item-action list-group-item-secondary">购物车</a>
    <a href="{{ route('orders.index') }}" class="list-group-item list-group-item-action list-group-item-success">订单中心</a>
    <a href="#" class="list-group-item list-group-item-action list-group-item-danger">结账中心</a>
    <a href="{{ route('addresses.index') }}" class="list-group-item list-group-item-action list-group-item-warning">收货地址</a>
    <a href="#" class="list-group-item list-group-item-action list-group-item-info">个人资料</a>
    <a href="#" onclick="event.preventDefault();document.getElementById('l-form').submit();" class="list-group-item list-group-item-action list-group-item-dark">退出登录</a>
    <form id="l-form" action="{{ route('logout') }}" method="POST" style="display: none;">
        {{ csrf_field() }}
    </form>
</div>