<div class="list-group myaccount">
    <a href="{{ route('accounts.index') }}" class="{{ active_class(if_route(['accounts.index','users.deposit','users.withdraw','users.wallets'])) }} list-group-item list-group-item-action list-group-item-light">桌面</a>
    <a href="{{ route('products.favorites') }}" class=" {{ active_class(if_route('products.favorites')) }} list-group-item list-group-item-action list-group-item-primary">收藏夹</a>
    <a href="{{ route('accounts.coupon') }}" class=" {{ active_class(if_route('accounts.coupon')) }} list-group-item list-group-item-action list-group-item-light">优惠券</a>
    <a href="{{ route('cart.index') }}" class="list-group-item list-group-item-action list-group-item-secondary">购物车</a>
    <a href="{{ route('orders.index') }}" class="{{ active_class(if_route(['orders.show'])) }} list-group-item list-group-item-action list-group-item-danger">订单中心</a>
    <a href="{{ route('addresses.index') }}" class="{{ active_class(if_route(['addresses.index','addresses.create'])) }} list-group-item list-group-item-action list-group-item-warning">收货地址</a>
    <a href="{{ route('borrows.myborrow') }}" class=" {{ active_class(if_route(['borrows.myborrow','borrows.repay.index'])) }}  list-group-item list-group-item-action list-group-item-success">融资信息</a>
    <a href="{{ route('borrows.myinvest') }}" class=" {{ active_class(if_route(['borrows.myinvest','invest.repay.index'])) }} list-group-item list-group-item-action list-group-item-warning">投资信息</a>

    <a href="{{ route('users.me') }}" class=" {{ active_class(if_route(['users.me'])) }} list-group-item list-group-item-action list-group-item-info">个人资料</a>
     <a href="#" onclick="event.preventDefault();document.getElementById('l-form').submit();" class="list-group-item list-group-item-action list-group-item-dark">退出登录</a>
    <form id="l-form" action="{{ route('logout') }}" method="POST" style="display: none;">
        {{ csrf_field() }}
    </form>
</div>