@extends('layouts.layouts')

@section('content')
<section class="top-space-margin half-section bg-gradient-very-light-gray py-4">
    <div class="container">
        <div class="row text-center">
            <h1 class="alt-font fw-600 text-dark-gray">Thanh Toán</h1>
        </div>
    </div>
</section>

<div class="container py-5">
    <div class="row g-4">

        <!-- ==================== FORM THÔNG TIN ==================== -->
        <div class="col-lg-7">
            <div class="card shadow-sm border-0">
                <div class="card-body p-4 p-md-5">
                    <h4 class="fw-600 mb-4">Thông tin giao hàng</h4>

                    <form action="{{ route('checkout.process') }}" method="POST" id="checkout-form">
                        @csrf

                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Họ và tên <span class="text-danger">*</span></label>
                                <input type="text" name="name" class="form-control @error('name') is-invalid @enderror" value="{{ old('name') }}" >
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Số điện thoại <span class="text-danger">*</span></label>
                                <input type="text" name="phone" class="form-control @error('phone') is-invalid @enderror" value="{{ old('phone') }}" >
                            </div>

                            <div class="col-12">
                                <label class="form-label">Địa chỉ chi tiết <span class="text-danger">*</span></label>
                                <input type="text" name="address" class="form-control @error('address') is-invalid @enderror" value="{{ old('address') }}" >
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Tỉnh/Thành phố <span class="text-danger">*</span></label>
                                <select name="province_code" id="province" class="form-control @error('province_code') is-invalid @enderror" >
                                    <option value="">Chọn tỉnh/thành phố</option>
                                    @foreach(\App\Models\Province::all() as $province)
                                        <option value="{{ $province->province_code }}" {{ old('province_code') == $province->province_code ? 'selected' : '' }}>
                                            {{ $province->name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Phường/Xã <span class="text-danger">*</span></label>
                                <select name="ward_code" id="ward" class="form-control @error('ward_code') is-invalid @enderror" >
                                    <option value="">Chọn phường/xã</option>
                                </select>
                            </div>

                            <div class="col-12">
                                <label class="form-label">Ghi chú (tùy chọn)</label>
                                <textarea name="notes" class="form-control" rows="3">{{ old('notes') }}</textarea>
                            </div>
                        </div>

                       <!-- Phương thức thanh toán -->
<div class="mt-5">
    <h5 class="fw-600 mb-3">Phương thức thanh toán</h5>

    <div class="border p-3 rounded">

        <div class="form-check mb-3">
            <input class="form-check-input" type="radio" name="payment_method" value="cash" checked>
            <label class="form-check-label fw-bold">
                Thanh toán khi nhận hàng (COD)
            </label>
        </div>

        <div class="form-check">
            <input class="form-check-input" type="radio" name="payment_method" value="bank_transfer">
            <label class="form-check-label fw-bold">
                Thanh toán VNPay
            </label>
        </div>

    </div>
</div>

                        <button type="submit" class="btn btn-primary btn-lg w-100 mt-4 py-3">
                            <i class="fa fa-credit-card me-2"></i> XÁC NHẬN ĐẶT HÀNG
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <!-- ==================== TÓM TẮT ĐƠN HÀNG (ĐÃ SỬA ĐẸP) ==================== -->
        <div class="col-lg-5">
            <div class="card shadow-sm border-0 sticky-top" style="top: 20px;">
                <div class="card-header bg-light py-3">
                    <h5 class="mb-0 fw-600">Tóm tắt đơn hàng</h5>
                </div>
                <div class="card-body p-4">

                    @foreach($cartItems as $item)
                    <div class="d-flex align-items-center mb-4 pb-4 border-bottom">
                        <img src="{{ asset($item->productVariant?->variant_image_url ?? 'storage/no-image.png') }}" 
                             class="rounded me-3" 
                             style="width: 70px; height: 70px; object-fit: cover; border: 1px solid #eee;">
                        <div class="flex-grow-1">
                            <h6 class="mb-1 text-truncate">{{ $item->product_name }}</h6>
                            <small class="text-muted">
                                {{ optional($item->productVariant?->color)->color_name ?? '' }} - 
                                {{ optional($item->productVariant?->size)->size_name ?? '' }}
                            </small>
                            <div class="mt-2">
                                <strong class="text-primary">{{ number_format($item->price_at_time) }}đ</strong> 
                                <span class="text-muted">× {{ $item->quantity }}</span>
                            </div>
                        </div>
                        <div class="text-end">
                            <strong>{{ number_format($item->quantity * $item->price_at_time) }}đ</strong>
                        </div>
                    </div>
                    {{-- {{ dd($discount) }} --}}
                    @endforeach

                    <div class="mt-4">
    <div class="d-flex justify-content-between py-2">
        <span class="text-muted">Tạm tính:</span>
        <span>{{ number_format($subtotal ?? 0) }} đ</span>
    </div>

    {{-- 🔥 Hiển thị giảm giá --}}
    @if(!empty($discount) && $discount > 0)
        <div class="d-flex justify-content-between py-2 text-success">
            <span>Giảm giá:</span>
            <span>-{{ number_format($discount) }} đ</span>
        </div>
    @endif

    <div class="d-flex justify-content-between py-2">
        <span class="text-muted">Phí vận chuyển:</span>
        <span>{{ number_format($shipping_fee ?? 30000) }} đ</span>
    </div>

    <hr>

    <div class="d-flex justify-content-between fw-bold fs-5">
        <span>Tổng thanh toán:</span>
        <span class="text-primary">
            {{ number_format(
                ($subtotal ?? 0) 
                - ($discount ?? 0) 
                + ($shipping_fee ?? 30000)
            ) }} đ
        </span>
    </div>
</div>
                </div>
            </div>
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
$(document).ready(function() {
    toastr.options = {
        "closeButton": true,
        "progressBar": true,
        "positionClass": "toast-top-right",
        "timeOut": "6000",
        "extendedTimeOut": "2000"
    };

    // Hiển thị success / error từ session
    @if (session('success'))
        toastr.success("{{ session('success') }}", "Thành công!");
    @endif

    @if (session('error'))
        toastr.error("{{ session('error') }}", "Lỗi!");
    @endif

    // Hiển thị lỗi validation bằng Toastr (quan trọng nhất)
    @if ($errors->any())
        @foreach ($errors->all() as $error)
            toastr.error("{{ addslashes($error) }}", "Thiếu thông tin");
        @endforeach
    @endif

    // Load phường/xã
    $('#province').on('change', function() {
        const provinceCode = $(this).val();
        const $ward = $('#ward');

        if (!provinceCode) {
            $ward.html('<option value="">Chọn phường/xã</option>');
            return;
        }

        $ward.html('<option value="">Đang tải...</option>');

        $.ajax({
            url: '/api/wards/' + provinceCode,
            type: 'GET',
            success: function(data) {
                $ward.empty().append('<option value="">Chọn phường/xã</option>');
                $.each(data, function(i, ward) {
                    $ward.append(`<option value="${ward.ward_code}">${ward.name}</option>`);
                });
            },
            error: function() {
                toastr.error('Không tải được danh sách phường/xã', 'Lỗi');
                $ward.html('<option value="">Chọn phường/xã</option>');
            }
        });
    });
});
</script>
@endsection