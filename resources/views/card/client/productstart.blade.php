<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">Just Arrived</span></h2>
    </div>

    <div class="row px-xl-5 pb-3">

        @foreach($products as $product)

            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">

                    <!-- Ảnh sản phẩm chính - Click chuyển đến chi tiết -->
                    <a href="{{ route('shop.product.detail', $product->slug) }}" class="text-decoration-none">
                        <div class="card-header product-img bg-transparent border p-0">
                            <img class="product-image"
                                 src="{{ asset($product->image_url ?? 'storage/no-image.png') }}"
                                 alt="{{ $product->name }}">
                        </div>
                    </a>

                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">

                        <!-- Tên sản phẩm - Click chuyển đến chi tiết -->
                        <a href="{{ route('shop.product.detail', $product->slug) }}" 
                           class="text-decoration-none text-dark">
                            <h6 class="text-truncate mb-3">{{ $product->name }}</h6>
                        </a>

                        <!-- Giá thấp nhất của các biến thể -->
                        {{-- <div class="d-flex justify-content-center">
                            <h6 class="text-primary fw-bold">
                                {{ number_format($product->variants->min('sale_price') ?? 0, 0, ',', '.') }}đ
                            </h6>
                        </div> --}}

                        <!-- Số biến thể (tùy chọn) -->
                        <small class="text-muted d-block mt-2">
                            {{ $product->variants_count ?? $product->variants->count() }} Sản Phẩm
                        </small>

                    </div>

                </div>
            </div>

        @endforeach

    </div>
</div>

<style>
.product-img {
    width: 100%;
    height: 250px;
    overflow: hidden;
}

.product-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s ease;
}

.product-image:hover {
    transform: scale(1.08);
}

.section-title {
    position: relative;
    display: inline-block;
}

.section-title::after {
    content: '';
    position: absolute;
    width: 60px;
    height: 2px;
    background: #007bff;
    bottom: -8px;
    left: 50%;
    transform: translateX(-50%);
}
</style>