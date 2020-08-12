<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <!-- Favicon -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="images/icon.png">
    <link rel="stylesheet" href="{{ mix('css/app.css') }}">
    <link rel="stylesheet" href="/css/plugins.css">
    <link rel="stylesheet" href="{{ mix('css/style.css') }}">
    <title>@yield('title',"我的商城系统")</title>
</head>
<body>
    <div id="app" class="wrapper {{ route_class() }}-page">
        @include('layouts._header')
        <div class="container mt-2 mb-2">
            @yield('content')
        </div>
        @include('layouts._footer')

        @yield('modal')
    </div>
    <!-- JS 脚本 -->
    <script src="{{ mix('js/app.js') }}"></script>
    <script src="/js/vendor/modernizr-3.6.0.min.js"></script>
    <script src="/js/popper.min.js"></script>
    <script src="/js/plugins.js"></script>
    <script src="/js/public.js"></script>
@yield('scriptAfterJs')
</body>
</html>