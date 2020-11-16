@extends('layouts.app')
@section('title',"通知公告")
@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    {{ $announce->title }}
                </div>
                <div class="card-body">
                    <table class="table">
                        <tr>
                            <td><img src="{{ $announce->cover }}"></td>
                            <td>{!! $announce->content  !!}</td>
                        </tr>
                    </table>
                </div>
            </div>

        </div>
    </div>
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
        });
    </script>
@endsection