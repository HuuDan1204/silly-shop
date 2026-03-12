<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">Just Arrived</span></h2>
    </div>

    <div class="row px-xl-5 pb-3">

@foreach($products as $product)

<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
    <div class="card product-item border-0 mb-4">

        <div class="card-header product-img bg-transparent border p-0">
            <img class="product-image"
                 src="{{ asset('storage/'.$product->image) }}"
                 alt="{{ $product->name }}">
        </div>

        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
            <h6 class="text-truncate mb-3">{{ $product->name }}</h6>

            <div class="d-flex justify-content-center">
                <h6>{{ number_format($product->price) }}đ</h6>
            </div>
        </div>

    </div>
</div>

@endforeach

    </div>
</div>

<style>
.product-img{
    width: 100%;
    height: 250px;
    overflow: hidden;
}

.product-image{
    width: 100%;
    height: 100%;
    object-fit: cover;
}
</style>