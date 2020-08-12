<!-- Banners Area -->
<div class="banners-area pb-30 bg-grey">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <!-- Hero Area -->
                <div class="herobanner slider-navigation slider-dots mt-30">
                    @foreach($ads[825530] as $ad)
                    <!-- Herobanner Single -->
                    <div class="herobanner-single">
                        <img src="{{ $ad->image_url }}" alt="{{ $ad->name }}">
                        <div class="herobanner-content">

                            {!! $ad->content !!}
                        </div>
                        <span class="herobanner-progress"></span>
                    </div>
                    <!--// Herobanner Single -->
                    @endforeach
                </div>
                <!--// Hero Area -->
            </div>

            <div class="col-md-3">
                @foreach($ads[255310] as $ad)
                <div class="imgbanner mt-30">
                    <a href="{{ $ad->url }}">
                        <img src="{{ $ad->image_url }}" alt="{{ $ad->name }}">
                    </a>
                </div>
                @endforeach
            </div>

            @foreach($ads[350160] as $ad)
            <div class="col-md-4">
                <div class="imgbanner mt-30">
                    <a href="{{ $ad->url }}">
                        <img src="{{ $ad->image_url }}" alt="{{ $ad->name }}">
                    </a>
                </div>
            </div>
            @endforeach

        </div>
    </div>
</div>
<!--// Banners Area -->