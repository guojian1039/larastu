@extends('layouts.app')
@section('content')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-grey">
            <li class="breadcrumb-item"><a href="{{ route('home') }}">首页</a></li>
            <li class="breadcrumb-item active" aria-current="page">个人中心</li>
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
                        <div class="row row-cols-1 row-cols-md-3">
                            <div class="col mb-4">
                                <div class="card h-100">
                                    <img src="/images/banner/banner-image-15.jpg" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col mb-4">
                                <div class="card h-100">
                                    <img src="/images/banner/banner-image-15.jpg" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">This is a short card.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col mb-4">
                                <div class="card h-100">
                                    <img src="/images/banner/banner-image-15.jpg" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.</p>
                                    </div>
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