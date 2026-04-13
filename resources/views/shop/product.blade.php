@extends('layouts.layouts')

@section('content')

<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Our Shop</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="{{ route('home') }}">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Shop</p>
        </div>
    </div>
</div>
<!-- Page Header End -->

<!-- Shop Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5">

        <!-- Shop Sidebar Start - Filter -->
        <div class="col-lg-3 col-md-12">

            <!-- Filter by Price -->
            <div class="border-bottom mb-4 pb-4">
                <h5 class="font-weight-semi-bold mb-4">Lọc theo giá</h5>
                <form action="{{ route('shop.products') }}" method="GET">
                    @if(request('keyword')) <input type="hidden" name="keyword" value="{{ request('keyword') }}"> @endif
                    @if(request('category_id')) <input type="hidden" name="category_id" value="{{ request('category_id') }}"> @endif

                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="radio" class="custom-control-input" id="price-all" name="price_range" value="all" 
                               {{ !request('price_range') || request('price_range') == 'all' ? 'checked' : '' }}>
                        <label class="custom-control-label" for="price-all">Tất cả giá</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="radio" class="custom-control-input" id="price-1" name="price_range" value="0-500000"
                               {{ request('price_range') == '0-500000' ? 'checked' : '' }}>
                        <label class="custom-control-label" for="price-1">Dưới 500.000 ₫</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="radio" class="custom-control-input" id="price-2" name="price_range" value="500000-1000000"
                               {{ request('price_range') == '500000-1000000' ? 'checked' : '' }}>
                        <label class="custom-control-label" for="price-2">500.000 ₫ - 1.000.000 ₫</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="radio" class="custom-control-input" id="price-3" name="price_range" value="1000000-2000000"
                               {{ request('price_range') == '1000000-2000000' ? 'checked' : '' }}>
                        <label class="custom-control-label" for="price-3">1.000.000 ₫ - 2.000.000 ₫</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                        <input type="radio" class="custom-control-input" id="price-4" name="price_range" value="5000000"
                               {{ request('price_range') == '5000000' ? 'checked' : '' }}>
                        <label class="custom-control-label" for="price-4">Trên 5.000.000 ₫</label>
                    </div>

                    <button type="submit" class="btn btn-primary btn-sm w-100 mt-3">Áp dụng</button>
                </form>
            </div>

            <!-- Filter by Color -->
            <div class="border-bottom mb-4 pb-4">
                <h5 class="font-weight-semi-bold mb-4">Lọc theo màu sắc</h5>
                <form action="{{ route('shop.products') }}" method="GET">
                    @if(request('keyword')) <input type="hidden" name="keyword" value="{{ request('keyword') }}"> @endif
                    @if(request('category_id')) <input type="hidden" name="category_id" value="{{ request('category_id') }}"> @endif
                    @if(request('price_range')) <input type="hidden" name="price_range" value="{{ request('price_range') }}"> @endif

                    <div class="d-flex flex-wrap gap-3">
                        @php $colors = \App\Models\Admin\Color::all(); @endphp
                        @foreach($colors as $color)
                            <div class="form-check form-check-inline me-3">
                                <input class="form-check-input" type="checkbox" name="colors[]" value="{{ $color->id }}" 
                                       id="color-{{ $color->id }}"
                                       {{ in_array($color->id, request('colors', [])) ? 'checked' : '' }}>
                                <label class="form-check-label d-flex align-items-center" for="color-{{ $color->id }}">
                                    <span class="d-inline-block rounded-circle border me-2" 
                                          style="width: 20px; height: 20px; background-color: {{ $color->color_code ?? '#ccc' }};">
                                    </span>
                                    {{ $color->color_name }}
                                </label>
                            </div>
                        @endforeach
                    </div>
                    <button type="submit" class="btn btn-primary btn-sm w-100 mt-4">Áp dụng màu</button>
                </form>
            </div>

            <!-- Filter by Size -->
            <div class="mb-5">
                <h5 class="font-weight-semi-bold mb-4">Lọc theo kích thước</h5>
                <form action="{{ route('shop.products') }}" method="GET">
                    @if(request('keyword')) <input type="hidden" name="keyword" value="{{ request('keyword') }}"> @endif
                    @if(request('category_id')) <input type="hidden" name="category_id" value="{{ request('category_id') }}"> @endif
                    @if(request('price_range')) <input type="hidden" name="price_range" value="{{ request('price_range') }}"> @endif

                    <div class="d-flex flex-wrap gap-3">
                        @php $sizes = \App\Models\Admin\Size::all(); @endphp
                        @foreach($sizes as $size)
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" name="sizes[]" value="{{ $size->id }}" 
                                       id="size-{{ $size->id }}"
                                       {{ in_array($size->id, request('sizes', [])) ? 'checked' : '' }}>
                                <label class="form-check-label" for="size-{{ $size->id }}">
                                    {{ $size->size_name }}
                                </label>
                            </div>
                        @endforeach
                    </div>
                    <button type="submit" class="btn btn-primary btn-sm w-100 mt-4">Áp dụng kích thước</button>
                </form>
            </div>
        </div>
        <!-- Shop Sidebar End -->

        <!-- Shop Product Start -->
        <div class="col-lg-9 col-md-12">
            <div class="row pb-3">

                <!-- Thanh tìm kiếm + Sắp xếp -->
                <div class="col-12 pb-1">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <form action="{{ route('shop.products') }}" method="GET" class="flex-grow-1 mr-3">
                            <div class="input-group">
                                <input type="text" name="keyword" class="form-control" 
                                       placeholder="Tìm kiếm sản phẩm..." 
                                       value="{{ request('keyword') }}">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </form>

                        <div class="dropdown ml-4">
                            <button class="btn border dropdown-toggle" type="button" data-toggle="dropdown">
                                @switch(request('sort'))
                                    @case('price_asc') Giá thấp → cao @break
                                    @case('price_desc') Giá cao → thấp @break
                                    @default Mới nhất
                                @endswitch
                            </button>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="{{ route('shop.products', array_merge(request()->query(), ['sort' => 'latest'])) }}">Mới nhất</a>
                                <a class="dropdown-item" href="{{ route('shop.products', array_merge(request()->query(), ['sort' => 'price_asc'])) }}">Giá thấp đến cao</a>
                                <a class="dropdown-item" href="{{ route('shop.products', array_merge(request()->query(), ['sort' => 'price_desc'])) }}">Giá cao đến thấp</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Danh sách sản phẩm -->
                @forelse($variants as $variant)
                    <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                        <div class="card product-item border-0 mb-4">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                <img class="img-fluid w-100" 
                                     src="{{ asset($variant->variant_image_url ?? $variant->product->image_url ?? 'img/default-product.jpg') }}" 
                                     alt="{{ $variant->name }}">
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3">
                                    <a href="{{ route('shop.product.detail', $variant->product->slug ?? $variant->product->id) }}" class="text-dark">
                                        {{ $variant->product->name }}
                                    </a>
                                </h6>
                                <p class="text-muted small mb-2">
                                    {{ $variant->color->color_name ?? '—' }} - {{ $variant->size->size_name ?? '—' }}
                                </p>
                                <div class="d-flex justify-content-center">
                                    <h6 class="text-primary">{{ number_format($variant->sale_price) }} ₫</h6>
                                    @if($variant->listed_price > $variant->sale_price)
                                        <h6 class="text-muted ml-2">
                                            <del>{{ number_format($variant->listed_price) }} ₫</del>
                                        </h6>
                                    @endif
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between bg-light border">
                                <a href="{{ route('shop.product.detail', $variant->product->slug ?? $variant->product->id) }}" 
                                   class="btn btn-sm text-dark p-0">
                                    <i class="fas fa-eye text-primary mr-1"></i> Xem chi tiết
                                </a>
                                <a href="#" class="btn btn-sm text-dark p-0 add-to-cart" data-variant-id="{{ $variant->id }}">
                                    <i class="fas fa-shopping-cart text-primary mr-1"></i> Thêm giỏ hàng
                                </a>
                            </div>
                        </div>
                    </div>
                @empty
                    <div class="col-12 text-center py-5">
                        <h5 class="text-muted">Không tìm thấy sản phẩm nào.</h5>
                    </div>
                @endforelse

                <!-- Phân trang -->
                <div class="col-12 pb-1">
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center mb-3">
                            {{ $variants->links() }}
                        </ul>
                    </nav>
                </div>

            </div>
        </div>
        <!-- Shop Product End -->

    </div>
</div>
<!-- Shop End -->

@endsection