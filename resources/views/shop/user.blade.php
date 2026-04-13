@extends('layouts.layouts')

@section('title', 'Hồ sơ cá nhân - ' . auth()->user()->name)

@section('content')
<div class="container py-5">
    <div class="row g-4">

        <!-- Sidebar -->
        <div class="col-lg-3">
            <div class="card border-0 shadow-sm sticky-top" style="top: 90px;">
                <div class="card-body text-center p-4">
                    <div class="position-relative d-inline-block">
                        <img id="avatar-preview" 
                             src="{{ auth()->user()->avatar ? asset('storage/' . auth()->user()->avatar) : asset('frontend/images/default-avatar.png') }}"
                             class="rounded-circle border border-4 border-white shadow" 
                             style="width: 130px; height: 130px; object-fit: cover;" alt="Avatar">

                        <label for="avatar-upload" class="position-absolute bottom-0 end-0 bg-primary rounded-circle p-2 shadow-sm text-white cursor-pointer">
                            <i class="ri-camera-line fs-5"></i>
                        </label>
                        <input type="file" id="avatar-upload" class="d-none" accept="image/*">
                    </div>

                    <h5 class="mt-3 mb-1 fw-bold">{{ auth()->user()->name }}</h5>
                 

                    <span class="badge bg-{{ auth()->user()->rank === 'diamond' ? 'danger' : (auth()->user()->rank === 'gold' ? 'warning' : 'primary') }} px-3 py-2">
                        {{ ucfirst(auth()->user()->rank ?? 'newbie') }}
                    </span>

                    <div class="row mt-4 text-center">
                        <div class="col-6 border-end">
                            <h4 class="mb-0 text-primary fw-bold">{{ number_format(auth()->user()->total_spent ?? 0) }}đ</h4>
                            <small class="text-muted">Tổng chi tiêu</small>
                        </div>
                    </div>
                </div>

                <div class="list-group list-group-flush">
                    <a href="#" class="list-group-item list-group-item-action active" data-tab="info">
                        <i class="ri-user-3-line me-2"></i> Thông tin cá nhân
                    </a>
                    <a href="#" class="list-group-item list-group-item-action" data-tab="address">
                        <i class="ri-map-pin-line me-2"></i> Sổ địa chỉ
                    </a>
                    <a href="#" class="list-group-item list-group-item-action" data-tab="orders">
                        <i class="ri-shopping-bag-3-line me-2"></i> Đơn hàng của tôi
                    </a>
                    <a href="#" class="list-group-item list-group-item-action" data-tab="vouchers">
                        <i class="ri-coupon-3-line me-2"></i> Voucher của tôi
                    </a>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="col-lg-9">

            <!-- ==================== TAB THÔNG TIN CÁ NHÂN ==================== -->
           <div id="tab-info">
    <div class="card shadow-sm">
        <div class="card-header bg-white">
            <h5 class="mb-0"><i class="ri-user-settings-line"></i> Thông tin cá nhân</h5>
        </div>
        <div class="card-body">
            <form id="profile-form" method="POST" action="{{ route('profile.update') }}" enctype="multipart/form-data">
                @csrf
                @method('PUT')

                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Họ và tên</label>
                        <input type="text" name="name" class="form-control" value="{{ old('name', auth()->user()->name) }}" required>
                    </div>
                      <div class="col-md-6">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" value="{{ old('email', auth()->user()->email) }}" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Số điện thoại</label>
                        <input type="text" name="default_phone" class="form-control" value="{{ old('default_phone', auth()->user()->default_phone) }}">
                    </div>
                    <div class="col-12">
                        <label class="form-label">Địa chỉ mặc định</label>
                        <textarea name="default_address" class="form-control" rows="2">{{ old('default_address', auth()->user()->default_address) }}</textarea>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary mt-4">Cập nhật thông tin</button>
            </form>
        </div>
    </div>
</div>

            <!-- ==================== TAB SỔ ĐỊA CHỈ ==================== -->
            <div id="tab-address" class="d-none">
                <div class="card shadow-sm">
                    <div class="card-header bg-white d-flex justify-content-between">
                        <h5 class="mb-0"><i class="ri-map-pin-line"></i> Sổ địa chỉ</h5>
                        <button class="btn btn-sm btn-success" data-bs-toggle="modal" data-bs-target="#addAddressModal">+ Thêm địa chỉ</button>
                    </div>
                    <div class="card-body">
                        @if($addresses->isEmpty())
                            <p class="text-muted text-center py-4">Chưa có địa chỉ nào.</p>
                        @else
                            @foreach($addresses as $addr)
                            <div class="border rounded p-3 mb-3">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <strong>{{ $addr->name }}</strong> - {{ $addr->phone }}<br>
                                        <span class="text-muted">{{ $addr->address }}</span>
                                    </div>
                                    @if($addr->id == auth()->user()->default_address) 
                                        <span class="badge bg-primary">Mặc định</span>
                                    @endif
                                </div>
                            </div>
                            @endforeach
                        @endif
                    </div>
                </div>
            </div>

            <!-- ==================== TAB ĐƠN HÀNG ==================== -->
            <div id="tab-orders" class="d-none">
                <div class="card shadow-sm">
                    <div class="card-header bg-white">
                        <h5 class="mb-0"><i class="ri-shopping-bag-3-line"></i> Đơn hàng của tôi</h5>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead class="table-light">
                                    <tr>
                                        <th>Mã đơn</th>
                                        <th>Ngày đặt</th>
                                        <th>Tổng tiền</th>
                                        <th>Trạng thái</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($orders as $order)
                                    <tr>
                                        <td><strong>#{{ $order->code_order }}</strong></td>
                                        <td>{{ $order->created_at->format('d/m/Y H:i') }}</td>
                                        <td class="fw-bold">{{ number_format($order->final_amount) }}đ</td>
                                        <td>
                                            @php
                                                $statusLabels = [
                                                    'pending'    => ['Chờ xác nhận', 'bg-warning text-white'],
                                                    'confirmed'  => ['Đã xác nhận', 'bg-info text-white'],
                                                    'shipping'   => ['Đang giao hàng', 'bg-primary text-white'],
                                                    'delivered'  => ['Đã giao hàng', 'bg-secondary text-white'],
                                                    'success'    => ['Hoàn thành', 'bg-success text-white'],
                                                    'cancelled'  => ['Đã hủy', 'bg-danger text-white'],
                                                    'failed'     => ['Thất bại', 'bg-dark text-white'],
                                                ];

                                                $status = $statusLabels[$order->status] ?? ['Không xác định', 'bg-secondary'];
                                            @endphp

                                            <span class="badge {{ $status[1] }}">
                                                {{ $status[0] }}
                                            </span>
                                        </td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary view-order" data-id="{{ $order->id }}">
                                                Xem chi tiết
                                            </button>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ==================== TAB VOUCHER ==================== -->
            <div id="tab-vouchers" class="d-none">
                <div class="card shadow-sm">
                    <div class="card-header bg-white">
                        <h5 class="mb-0"><i class="ri-coupon-3-line"></i> Voucher của tôi</h5>
                    </div>
                    <div class="card-body">
                        <div class="row g-3">
                            @foreach($vouchers as $v)
                            <div class="col-md-6">
                                <div class="border rounded p-3 h-100 position-relative" 
                                     style="background: linear-gradient(135deg, #f8f9fa, #e9ecef);">
                                    <div class="d-flex justify-content-between align-items-start">
                                        <div>
                                            <h5 class="text-danger fw-bold mb-1">{{ $v->code }}</h5>
                                            <p class="mb-1">
                                                Giảm 
                                                @if($v->type_discount === 'percent')
                                                    <strong>{{ $v->value }}%</strong>
                                                @else
                                                    <strong>{{ number_format($v->value) }}đ</strong>
                                                @endif
                                            </p>
                                        </div>
                                        <span class="badge text-white bg-success">Còn hạn</span>
                                    </div>
                                    <small class="text-muted">
    HSD: 
    {{ $v->end_date 
        ? \Carbon\Carbon::parse($v->end_date)->format('d/m/Y') 
        : 'Không giới hạn' 
    }}
</small>
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
@endsection

@section('js')
<style>
    .list-group-item.active { background-color: #0d6efd; color: white; }
    .card { border-radius: 12px; }
</style>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {

    // Tab switching
    document.querySelectorAll('.list-group-item').forEach(item => {
        item.addEventListener('click', function(e) {
            e.preventDefault();
            document.querySelectorAll('.list-group-item').forEach(i => i.classList.remove('active'));
            this.classList.add('active');

            document.querySelectorAll('#tab-info, #tab-address, #tab-orders, #tab-vouchers').forEach(tab => tab.classList.add('d-none'));
            document.getElementById('tab-' + this.dataset.tab).classList.remove('d-none');
        });
    });

    // Upload avatar
    document.getElementById('avatar-upload').addEventListener('change', function(e) {
        const file = e.target.files[0];
        if (!file) return;

        let formData = new FormData();
        formData.append('avatar', file);
        formData.append('_token', '{{ csrf_token() }}');

        fetch('{{ route('profile.avatar.update') }}', {
            method: 'POST',
            body: formData
        })
        .then(r => r.json())
        .then(data => {
            if (data.success) {
                document.getElementById('avatar-preview').src = data.url;
                Swal.fire('Thành công', 'Đã cập nhật ảnh đại diện', 'success');
            }
        });
    });

});
</script>
@endsection