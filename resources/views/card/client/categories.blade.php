<div class="container-fluid pt-5">
    <div class="text-center mb-5">
        <h2 class="section-title px-5"><span class="px-2">Danh Mục Sản Phẩm</span></h2>
    </div>

    <div class="row px-xl-5 pb-3">

        @foreach($categories as $category)

            <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">

                    <!-- Ảnh danh mục -->
                    <a href="{{ route('shop.category', $category->slug) }}" 
                       class="cat-img position-relative overflow-hidden mb-3">
                        
                        <div style="width:100%; height:220px; overflow:hidden; border-radius: 8px;">
                            <img 
                                src="{{ asset($category->image_url ?? 'storage/no-image.png') }}"
                                alt="{{ $category->name }}"
                                style="width:100%; height:100%; object-fit:cover; transition: all 0.3s ease;">
                        </div>
                    </a>

                    <!-- Tên danh mục -->
                    <a href="{{ route('shop.category', $category->slug) }}" 
                       class="text-decoration-none">
                        <h5 class="font-weight-semi-bold m-0 text-dark text-center">
                            {{ $category->name }}
                        </h5>
                    </a>

                    <!-- Số lượng sản phẩm -->
                    <p class="text-right mt-2 mb-0 text-muted">
                        {{ $category->products_count ?? $category->products->count() ?? 0 }} sản phẩm
                    </p>

                </div>
            </div>

        @endforeach

    </div>
</div>

<style>
.cat-item {
    transition: all 0.3s ease;
}

.cat-item:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 20px rgba(0,0,0,0.1);
}

.cat-img img {
    transition: transform 0.4s ease;
}

.cat-img:hover img {
    transform: scale(1.08);
}
</style> 