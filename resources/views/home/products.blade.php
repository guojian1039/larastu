@foreach($products as $product)
    <!-- Single Product -->
    <article class="hoproduct {{ $different_class }}">
        <div class="hoproduct-image">
            <a class="hoproduct-thumb" href="{{ route('products.show',[$product->id]) }}">
                <img class="hoproduct-frontimage" src="{{ $product->image_url }}" alt="{{ $product->title }}">
                <!--<img class="hoproduct-backimage" src="upload/product/product-image-22.jpg" alt="product image">-->
            </a>
            <ul class="hoproduct-actionbox">
                @if(Auth::check())
                    <li><a href="javascript:void(0);" data-id="{{ $product->id }}"><i class="lnr lnr-cart"></i></a></li>
                @endif
                    <li><a href="javascript:void(0);" data-id="{{ $product->id }}" class="quickview-trigger"><i class="lnr lnr-eye"></i></a></li>
                @if(Auth::check())
                 <li><a href="javascript:void(0); " class="{{ in_array($product->id,$favorite_Ids)?'is-active':'' }}" title="{{ in_array($product->id,$favorite_Ids)?'取消收藏':'收藏' }}" data-id="{{ $product->id }}"><i class="lnr lnr-heart"></i></a></li>
                 @endif
            </ul>
            <ul class="hoproduct-flags">
                <li class="flag-pack">New</li>
                <!--<li class="flag-discount">-15%</li>-->
            </ul>
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
                    <!--<del class="oldprice">$35.11</del>-->
                    <span class="price">￥{{ $product->price }}</span>
                </div>
            </div>
        </div>
    </article>
    <!--// Single Product -->
@endforeach