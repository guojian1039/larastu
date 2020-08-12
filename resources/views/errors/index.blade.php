@extends('layouts.app')
@section('title', '信息')

@section('content')
    <div class="card">
        <div class="card-header">提示信息</div>
        <div class="card-body text-center">
            <h1>{{ $message }}</h1>
            <a class="btn btn-primary" href="{{ url('/') }}">返回首页</a>
        </div>
    </div>
@endsection