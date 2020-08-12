@foreach($items as $products)
    <div class="product-slider-col">
        @if($different_class=='hoproduct-3')
            @include('home.products',['products'=>$products,'different_class'=>$different_class])
            @elseif($different_class=='hoproduct-4')

            @include('home.special_products',['products'=>$products,'different_class'=>$different_class])
           @else
            @include('home.product',['product'=>$products,'different_class'=>$different_class])
        @endif
    </div>
@endforeach