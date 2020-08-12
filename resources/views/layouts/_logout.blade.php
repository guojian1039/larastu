<a href="#" onclick="event.preventDefault();document.getElementById('logout-form').submit();">退出登录</a>
<form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
    {{ csrf_field() }}
</form>