@extends('layouts.layouts')

@section('content')

<!-- Page Header -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 150px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Chi tiết sản phẩm</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="{{ route('home') }}">Trang chủ</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">{{ $product->name }}</p>
        </div>
    </div>
</div>

<div class="container-fluid py-5">
    <div class="row px-xl-5">

        <!-- Ảnh sản phẩm -->
        <div class="col-lg-5 pb-5">
            <div class="border p-3 bg-white rounded">
                <img id="main-product-image" 
                     src="{{ asset($product->image_url ?? 'storage/no-image.png') }}" 
                     alt="{{ $product->name }}"
                     class="img-fluid w-100 rounded"
                     style="height: 450px; object-fit: contain;">
            </div>
        </div>

        <!-- Thông tin sản phẩm -->
        <div class="col-lg-7 pb-5">
            <h3 class="font-weight-semi-bold">{{ $product->name }}</h3>

            <h4 class="text-primary mb-4" id="variant-price">
                {{ number_format($product->variants->first()->sale_price ?? 0, 0, ',', '.') }} đ
            </h4>

            <p class="mb-4">{{ $product->description ?? 'Chưa có mô tả.' }}</p>

            <form id="add-to-cart-form" action="{{ route('cart.add', $product->id) }}" method="POST">
                @csrf

                <input type="hidden" name="product_id" value="{{ $product->id }}">
                <input type="hidden" name="size_id" id="selected_size_id" required>
                <input type="hidden" name="color_id" id="selected_color_id" required>
                <input type="hidden" name="quantity" id="quantity_input" value="1">

                <!-- Chọn Size -->
                <div class="mb-4">
                    <label class="form-label fw-bold">Kích thước <span class="text-danger">*</span></label>
                    <div class="d-flex flex-wrap gap-2" id="size-options">
                        @foreach($product->variants->pluck('size')->unique('id') as $size)
                            <label class="btn btn-outline-secondary btn-sm size-btn" data-size-id="{{ $size->id }}">
                                <input type="radio" name="size_radio" value="{{ $size->id }}" class="d-none">
                                {{ $size->size_name }}
                            </label>
                        @endforeach
                    </div>
                </div>

                <!-- Chọn Color -->
                <div class="mb-4">
                    <label class="form-label fw-bold">Màu sắc <span class="text-danger">*</span></label>
                    <div class="d-flex flex-wrap gap-2" id="color-options">
                        @foreach($product->variants->pluck('color')->unique('id') as $color)
                            <label class="btn btn-outline-secondary btn-sm color-btn" 
                                   data-color-id="{{ $color->id }}"
                                   style="background-color: {{ $color->color_code }}; width: 40px; height: 40px; border-radius: 50%;">
                                <input type="radio" name="color_radio" value="{{ $color->id }}" class="d-none">
                            </label>
                        @endforeach
                    </div>
                </div>

                <!-- Số lượng -->
                <div class="mb-4">
                    <label class="form-label fw-bold">Số lượng</label>
                    <div class="input-group" style="width: 140px;">
                        <button type="button" class="btn btn-primary btn-minus">-</button>
                        <input type="text" class="form-control text-center" id="quantity_display" value="1" readonly>
                        <button type="button" class="btn btn-primary btn-plus">+</button>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary px-5 py-2">
                    <i class="fa fa-shopping-cart mr-2"></i> Thêm vào giỏ hàng
                </button>
            </form>
        </div>
    </div>
</div>

@endsection

@section('js')
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Toastr -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<script>
// 🔥 truyền variants từ blade sang JS
const variants = @json($product->variants);

toastr.options = {
    "closeButton": true,
    "progressBar": true,
    "positionClass": "toast-top-right",
    "timeOut": "4000"
};

$(document).ready(function() {

    // ==================== HÀM UPDATE VARIANT ====================
    function updateVariant() {
        let sizeId = $('#selected_size_id').val();
        let colorId = $('#selected_color_id').val();

        if (!sizeId || !colorId) return;

        let variant = variants.find(v => 
            v.size_id == sizeId && v.color_id == colorId
        );

        if (variant) {

            // 🔥 đổi ảnh
            if (variant.variant_image_url) {
                $('#main-product-image').attr(
                    'src',
                    "{{ asset('') }}" + variant.variant_image_url
                );
            }

            // 🔥 đổi giá
            $('#variant-price').text(
                new Intl.NumberFormat('vi-VN').format(variant.sale_price) + ' đ'
            );

        } else {
            toastr.error('Biến thể không tồn tại hoặc đã hết hàng');
        }
    }

    // ==================== CHỌN SIZE ====================
    $('.size-btn').on('click', function() {
        $('.size-btn').removeClass('active btn-primary').addClass('btn-outline-secondary');
        $(this).addClass('active btn-primary');

        $('#selected_size_id').val($(this).data('size-id'));

        updateVariant(); // 🔥 gọi
    });

    // ==================== CHỌN COLOR ====================
    $('.color-btn').on('click', function() {
        $('.color-btn').removeClass('active').css('border', '2px solid #ddd');
        $(this).addClass('active').css('border', '3px solid #007bff');

        $('#selected_color_id').val($(this).data('color-id'));

        updateVariant(); // 🔥 gọi
    });

    // ==================== TĂNG / GIẢM SỐ LƯỢNG ====================
    $('.btn-plus').on('click', function() {
        let qty = parseInt($('#quantity_display').val()) || 1;
        $('#quantity_display').val(qty + 1);
        $('#quantity_input').val(qty + 1);
    });

    $('.btn-minus').on('click', function() {
        let qty = parseInt($('#quantity_display').val()) || 1;
        if (qty > 1) {
            $('#quantity_display').val(qty - 1);
            $('#quantity_input').val(qty - 1);
        }
    });

    // ==================== TOAST SESSION ====================
    @if (session('success'))
        toastr.success("{{ session('success') }}", "Thành công");
    @endif

    @if (session('error'))
        toastr.error("{{ session('error') }}", "Lỗi");
    @endif

    // ==================== VALIDATE FORM ====================
    $('#add-to-cart-form').on('submit', function(e) {
        const sizeId = $('#selected_size_id').val();
        const colorId = $('#selected_color_id').val();

        if (!sizeId || !colorId) {
            e.preventDefault();
            toastr.error('Vui lòng chọn Size và Màu sắc trước khi thêm vào giỏ hàng!', 'Thiếu thông tin');
            return false;
        }
    });

});
</script>
@endsection