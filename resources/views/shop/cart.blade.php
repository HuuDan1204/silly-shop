@extends('layouts.layouts')

@section('content')
    <!-- Page Header -->
    <section class="top-space-margin half-section bg-gradient-very-light-gray">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-12 col-xl-8 col-lg-10 text-center position-relative page-title-extra-large">
                    <h1 class="alt-font fw-600 text-dark-gray mb-10px">Giỏ Hàng</h1>
                </div>
                <div class="col-12 breadcrumb breadcrumb-style-01 d-flex justify-content-center">
                    <ul>
                        <li><a href="{{ route('home') }}">Trang chủ</a></li>
                        <li>Giỏ Hàng</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <section class="pt-0">
        <div class="container">

            @if (session('success'))
                <div class="alert alert-success">{{ session('success') }}</div>
            @endif
            @if (session('error'))
                <div class="alert alert-danger">{{ session('error') }}</div>
            @endif

            <div class="row">

                <!-- Danh sách sản phẩm trong giỏ -->
                <div class="col-lg-8 pe-lg-4 mb-5 mb-lg-0">
                    <table class="table table-bordered table-hover align-middle cart-table">
                        <thead class="table-light">
                            <tr>
                                <th class="text-center" width="50">
                                    <input type="checkbox" id="select-all-cart">
                                </th>
                                <th width="120">Ảnh</th>
                                <th>Sản phẩm</th>
                                <th class="text-end">Giá</th>
                                <th class="text-center" width="140">Số lượng</th>
                                <th class="text-end">Tổng tiền</th>
                                <th class="text-center" width="60">Xóa</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if ($cartItems->isEmpty())
                                <tr>
                                    <td colspan="7" class="text-center py-5">
                                        <p class="mb-0 fs-5">Giỏ hàng của bạn đang trống.</p>
                                    </td>
                                </tr>
                            @else
                                @foreach($cartItems as $item)
                                    <tr class="cart-item-row" data-id="{{ $item->id }}">
                                        <td class="text-center">
                                            <input type="checkbox" class="cart-item-checkbox" 
                                                   value="{{ $item->id }}"
                                                   {{ in_array($item->id, $selectedIds ?? []) ? 'checked' : '' }}>
                                        </td>

                                        <!-- Ảnh sản phẩm -->
                                        <td>
                                            @if ($item->productVariant && $item->productVariant->variant_image_url)
                                                <a href="{{ route('shop.product.detail', $item->productVariant->product->slug ?? '') }}">
                                                    <img src="{{ asset($item->productVariant->variant_image_url) }}" 
                                                         alt="{{ $item->productVariant->name ?? $item->product_name }}"
                                                         class="img-thumbnail"
                                                         style="width: 80px; height: 80px; object-fit: cover;">
                                                </a>
                                            @else
                                                <img src="{{ asset('storage/no-image.png') }}" 
                                                     alt="No image" 
                                                     class="img-thumbnail"
                                                     style="width: 80px; height: 80px; object-fit: cover;">
                                            @endif
                                        </td>

                                        <!-- Tên sản phẩm + thông tin biến thể -->
                                        <td>
                                            @if ($item->productVariant && $item->productVariant->product)
                                                <a href="{{ route('shop.product.detail', $item->productVariant->product->slug ?? '') }}" 
                                                   class="text-dark fw-500 text-decoration-none">
                                                    {{ $item->productVariant->product->name ?? $item->product_name }}
                                                </a>
                                                <br>
                                                <small class="text-muted">
                                                    Màu: <strong>{{ $item->productVariant->color->color_name ?? 'N/A' }}</strong> | 
                                                    Size: <strong>{{ $item->productVariant->size->size_name ?? 'N/A' }}</strong>
                                                </small>
                                            @else
                                                <span class="text-danger">Sản phẩm không tồn tại</span>
                                            @endif
                                        </td>

                                        <!-- Giá -->
                                        <td class="text-end fw-500">
                                            {{ number_format($item->price_at_time, 0, ',', '.') }} đ
                                        </td>

                                        <!-- Số lượng -->
                                        <td class="text-center">
                                            <div class="quantity d-inline-flex align-items-center" data-id="{{ $item->id }}">
                                                <button type="button" class="qty-minus btn btn-sm btn-inline-dark">-</button>
                                                <input type="text" class="qty-text mx-2 text-center" 
                                                       value="{{ $item->quantity }}" 
                                                       style="width: 50px;" readonly>
                                                <button type="button" class="qty-plus btn btn-sm btn-inline-primary">+</button>
                                            </div>
                                        </td>

                                        <!-- Tổng tiền -->
                                        <td class="text-end fw-600 product-subtotal">
                                            {{ number_format($item->quantity * $item->price_at_time, 0, ',', '.') }} đ
                                        </td>

                                        <!-- Nút xóa -->
                                        <td class="text-center">
                                            <button type="button" class="btn btn-sm btn-danger delete-item" 
                                                    data-id="{{ $item->id }}">
                                                <i class="fa fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                @endforeach
                            @endif
                        </tbody>
                    </table>

                    <div class="mt-4">
                        <button type="button" id="delete-selected-btn" class="btn btn-danger">
                            <i class="fa fa-trash"></i> Xóa các sản phẩm đã chọn
                        </button>
                    </div>
                </div>

                <!-- Phần tổng tiền -->
                <div class="col-lg-4">
                    <div class="bg-light border p-4 rounded">
                        <h5 class="alt-font fw-600 mb-4">Tổng đơn hàng</h5>
                        
                        <table class="w-100 mb-4">
                            <tr>
                                <td class="py-2">Tạm tính:</td>
                                <td class="text-end fw-500" id="subtotal">
                                    {{ number_format($subtotal ?? 0, 0, ',', '.') }} đ
                                </td>
                            </tr>
                            <tr class="border-top border-2">
                                <td class="py-3 fw-600">Tổng tiền:</td>
                                <td class="text-end fw-700 fs-4 text-primary" id="total">
                                    {{ number_format($total ?? 0, 0, ',', '.') }} đ
                                </td>
                            </tr>
                            <div class="mb-3">
                            <label class="fw-500 mb-2">Chọn mã giảm giá</label>

                            <div class="d-flex">
                            <select id="voucher_select" class="form-select me-2">
                                <option value="">-- Chọn voucher --</option>

                                @foreach($userVouchers as $voucher)
                                    <option value="{{ $voucher->code }}">
                                        {{ $voucher->code }} 
                                        (Giảm 
                                        {{ $voucher->type_discount == 'percent' 
                                            ? $voucher->value . '%' 
                                            : number_format($voucher->value) . 'đ' }})
                                    </option>
                                @endforeach
                            </select>

                            <button class="btn btn-primary" id="apply-voucher">
                                Áp dụng
                            </button>
                        </div>
                    </div>

                    <!-- Hiển thị voucher -->
                    <div id="voucher-info" class="mb-3 d-none">
                        <small class="text-success">
                            Đã áp mã: <span id="voucher-code-text"></span>
                        </small>
                        <button class="btn btn-sm btn-danger ms-2" id="remove-voucher">X</button>
                    </div>

                    <!-- Dòng giảm giá -->
                   <tr id="discount-row" class="{{ $discount > 0 ? '' : 'd-none' }}">
    <td>Giảm giá:</td>
    <td class="text-end text-danger" id="discount-amount">
        -{{ number_format($discount, 0, ',', '.') }} đ
    </td>
</tr>
                        </table>

                        <a href="{{ route('checkout') }}" class="btn btn-dark-gray w-100 py-3">
                            Tiếp tục thanh toán
                        </a>
                    </div>
                </div>

            </div>
        </div>
    </section>
@endsection

@section('js')
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Toastr CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>

<!-- Toastr JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
 <script>
 $('#apply-voucher').on('click', function() {

    let code = $('#voucher_select').val();

    if (!code) {
        toastr.warning('Vui lòng chọn voucher');
        return;
    }

    $.ajax({
        url: "{{ route('cart.applyVoucher') }}",
        type: "POST",
        data: {
            _token: '{{ csrf_token() }}',
            code: code
        },
        success: function(res) {

            if (res.success) {

                // ✅ hiển thị voucher
                $('#voucher-info').removeClass('d-none');
                $('#voucher-code-text').text(code);

                // ✅ hiển thị giảm giá
                $('#discount-row').removeClass('d-none');
                $('#discount-amount').text('-' + res.discount + ' đ');

                // ✅ update tổng tiền
                $('#total').text(res.total + ' đ');

                toastr.success('Áp dụng voucher thành công');

            } else {
                toastr.error(res.message);
            }
        },
        error: function() {
            toastr.error('Lỗi áp dụng voucher');
        }
    });
});
 </script>
<script>
$(document).ready(function() {

    // ==================== CHỌN TẤT CẢ ====================
    $('#select-all-cart').on('change', function() {
        $('.cart-item-checkbox').prop('checked', this.checked).trigger('change');
    });

    // ==================== CHỌN SẢN PHẨM → TÍNH TIỀN ====================
    $(document).on('change', '.cart-item-checkbox', function () {

        let items = [];

        $('.cart-item-checkbox:checked').each(function () {
            let row = $(this).closest('tr');
            let id = $(this).val();
            let qty = row.find('.qty-text').val();

            items.push({
                id: id,
                qty: qty
            });
        });

        $.ajax({
    url: "{{ route('cart.ajaxUpdateSelected') }}",
    type: "POST",
    data: {
        _token: '{{ csrf_token() }}',
        items: items
    },
    success: function (res) {
        // ✅ Cập nhật tiền
        $('#subtotal').text(res.subtotal + ' đ');
        $('#total').text(res.total + ' đ');

        // ✅ HIỂN THỊ GIẢM GIÁ
        if (res.voucher_discount && res.voucher_discount != '0') {
            $('#discount-row').removeClass('d-none');
            $('#discount-amount').text('-' + res.voucher_discount + ' đ');
        } else {
            $('#discount-row').addClass('d-none');
            $('#discount-amount').text('-0 đ');
        }

        // ✅ Nếu voucher bị xoá
        if (res.voucher_removed) {
            toastr.warning('Voucher không còn hợp lệ');

            // reset UI voucher
            $('#voucher-info').addClass('d-none');
            $('#voucher-code-text').text('');
            $('#voucher_select').val('');
        }
    },
    error: function() {
        toastr.error('Lỗi khi cập nhật sản phẩm đã chọn');
    }
});
    });

    // ==================== TĂNG / GIẢM SỐ LƯỢNG ====================
    $(document).on('click', '.qty-plus, .qty-minus', function() {
        const $row = $(this).closest('tr');
        const $input = $row.find('.qty-text');
        const id = $row.data('id');
        const action = $(this).hasClass('qty-plus') ? 'increase' : 'decrease';

        $.ajax({
            url: "{{ route('cart.updateQuantity') }}",
            type: "POST",
            data: {
                _token: '{{ csrf_token() }}',
                id: id,
                action: action
            },
            success: function(res) {
                if (res.success) {
                    $input.val(res.quantity);
                    $row.find('.product-subtotal').text(res.item_total);

                    // nếu đang tick thì update lại total
                    if ($row.find('.cart-item-checkbox').is(':checked')) {
                        $row.find('.cart-item-checkbox').trigger('change');
                    }

                } else {
                    // 🔥 luôn show đúng thông báo
                    toastr.warning('Sản phẩm đã đạt giới hạn của tồn kho');
                }
            },
            error: function() {
                toastr.error('Không thể kết nối server');
            }
        });
    });

    // ==================== CHECKOUT ====================
    $('#checkout-btn').on('click', function(e) {
        let checked = $('.cart-item-checkbox:checked').length;

        if (checked === 0) {
            e.preventDefault();
            toastr.error('Vui lòng chọn ít nhất 1 sản phẩm để thanh toán');
        }
    });

    // ==================== XÓA MỘT SẢN PHẨM ====================
    $(document).on('click', '.delete-item', function() {
        const id = $(this).data('id');
        const $row = $(this).closest('tr');

        Swal.fire({
            title: 'Bạn có chắc chắn?',
            text: "Sản phẩm này sẽ bị xóa khỏi giỏ hàng!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Có, xóa!',
            cancelButtonText: 'Hủy'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: "{{ route('cart.deleteSelected') }}",
                    type: "POST",
                    data: {
                        _token: '{{ csrf_token() }}',
                        ids: [id]
                    },
                    success: function(res) {
                        if (res.success) {
                            $row.remove();

                            // 🔥 cập nhật lại total sau khi xóa
                            $('.cart-item-checkbox').trigger('change');

                            Swal.fire({
                                title: 'Đã xóa!',
                                icon: 'success',
                                timer: 1200,
                                showConfirmButton: false
                            });
                        }
                    }
                });
            }
        });
    });

    // ==================== XÓA NHIỀU ====================
    $('#delete-selected-btn').on('click', function() {

        const ids = $('.cart-item-checkbox:checked').map(function() {
            return this.value;
        }).get();

        if (ids.length === 0) {
            toastr.warning('Chọn ít nhất 1 sản phẩm để xóa');
            return;
        }

        Swal.fire({
            title: `Xóa ${ids.length} sản phẩm?`,
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Xóa',
            cancelButtonText: 'Hủy'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: "{{ route('cart.deleteSelected') }}",
                    type: 'POST',
                    data: {
                        _token: '{{ csrf_token() }}',
                        ids: ids
                    },
                    success: function(res) {
                        if (res.success) {
                            location.reload();
                        }
                    }
                });
            }
        });
    });

});
</script>
@endsection