@foreach($products as $product)
    <!-- Single Product -->
    <article class="hoproduct {{ $different_class }}">
        <div class="hoproduct-image">
            <a class="hoproduct-thumb" href="{{ route('products.show',[$product->id]) }}">
                <img class="hoproduct-frontimage" src="{{ $product->image_url }}" alt="{{ $product->title }}">
                <!--<img class="hoproduct-backimage" src="upload/product/product-image-22.jpg" alt="product image">-->
            </a>
        </div>
        <div class="hoproduct-content">
            <h5 class="hoproduct-title"><a href="{{ route('products.show',[$product->id]) }}">{{ $product->title }}</a></h5>
            <div class="hoproduct-rattingbox">
                <div class="rattingbox">
                    <span class="active"><i class="ion ion-ios-star"></i></span>
                    <span class="active"><i class="ion ion-ios-star"></i></span>
                    <span class="active"><i class="ion ion-ios-star"></i></span>
                    <span class="active"><i class="ion ion-ios-star"></i></span>
                    <span class="active"><i class="ion ion-ios-star"></i></span>
                </div>
            </div>
            <div class="hoproduct-pricebox">
                <div class="pricebox">
                    @if($product->discount_num>0)
                    <del class="oldprice">￥{{ $product->original_price }}</del>
                    @endif
                    <span class="price">￥{{ $product->price }}</span>
                </div>
            </div>
        </div>
    </article>
    <!--// Single Product -->
@endforeach