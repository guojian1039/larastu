@extends('layouts.app')
@section('title',"融资信息")
@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    {{ $borrow->title }}
                </div>
                <div class="card-body">
                    <table class="table">
                        <tr>
                            <td>{!! $borrow->borrow_des  !!}</td>
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