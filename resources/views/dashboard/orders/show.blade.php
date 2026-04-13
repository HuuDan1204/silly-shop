@extends('layouts.layoutdashboard')

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0">Chi tiết đơn hàng #{{ $order->code_order }}</h4>
                <a href="{{ route('dashboard.orders.index') }}" class="btn btn-light">← Quay lại</a>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-8">
            <!-- Thông tin đơn hàng -->
            <div class="card">
               <div class="card-body">
    <h5>Thông tin khách hàng</h5>
    <p><strong>Tên:</strong> {{ $order->name }} | <strong>Điện thoại:</strong> {{ $order->phone }}</p>
    <p><strong>Địa chỉ:</strong> {{ $order->address }}</p>

    @if ($order->notes)
        <p><strong>Ghi chú đơn hàng:</strong> {{ $order->notes }}</p>
    @endif

    <hr>

    <h5>Danh sách sản phẩm</h5>
    <table class="table table-bordered">
        <thead class="table-light">
            <tr>
                <th>Sản phẩm</th>
                <th>Biến thể</th>
                <th>Số lượng</th>
                <th>Giá bán</th>
                <th>Thành tiền</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($order->orderItems as $item)
            <tr>
                <td>{{ $item->product_name }}</td>
                <td>{{ $item->color_name ?? '—' }} - {{ $item->size_name ?? '—' }}</td>
                <td class="text-center">{{ $item->quantity }}</td>
                <td class="text-end">{{ number_format($item->sale_price) }} đ</td>
                <td class="text-end">{{ number_format($item->sale_price * $item->quantity) }} đ</td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <hr>

    <!-- Phần tính tiền chi tiết -->
    <div class="row justify-content-end">
        <div class="col-md-6">
            <table class="table table-borderless text-end">
                <tr>
                    <td><strong>Tạm tính:</strong></td>
                    <td>{{ number_format($order->total_amount) }} đ</td>
                </tr>
                <tr>
                    <td><strong>Phí vận chuyển:</strong></td>
                    <td>
                        @if ($order->shipping_fee > 0)
                            {{ number_format($order->shipping_fee) }} đ 
                            <small class="text-muted">({{ ucfirst($order->shipping_method ?? 'basic') }})</small>
                        @else
                            <span class="text-success">Miễn phí</span>
                        @endif
                    </td>
                </tr>
                
                @if ($order->discount_amount > 0)
                <tr>
                    <td><strong>Giảm giá (Voucher):</strong></td>
                    <td class="text-danger">- {{ number_format($order->discount_amount) }} đ</td>
                </tr>
                @endif

                <tr class="border-top">
                    <td><h5 class="mb-0"><strong>Thành tiền:</strong></h5></td>
                    <td><h4 class="mb-0 text-primary"><strong>{{ number_format($order->final_amount) }} đ</strong></h4></td>
                </tr>
            </table>
        </div>
    </div>
</div>
            </div>
        </div>

        <!-- Sidebar -->
        <div class="col-lg-4">
            <!-- Trạng thái -->
            <div class="card">
                <div class="card-body">
                    <h5>Trạng thái hiện tại</h5>
                  <p><strong>Trạng thái đơn hàng:</strong> 
    @switch($order->status)
        @case('pending')
            <span class="badge bg-warning text-dark fw-bold">Chờ xác nhận</span>
            @break
        @case('confirmed')
            <span class="badge bg-primary text-white fw-bold">Đã xác nhận</span>
            @break
        @case('shipping')
            <span class="badge bg-info text-white fw-bold">Đang giao hàng</span>
            @break
        @case('delivered')
            <span class="badge bg-secondary text-white fw-bold">Đã giao hàng</span>
            @break
        @case('success')
            <span class="badge bg-success text-white fw-bold">Hoàn thành</span>
            @break
        @case('cancelled')
            <span class="badge bg-danger text-white fw-bold">Đã hủy</span>
            @break
        @case('failed')
            <span class="badge bg-dark text-white fw-bold">Thất bại</span>
            @break
        @default
            <span class="badge bg-secondary text-white">{{ ucfirst($order->status) }}</span>
    @endswitch
</p>

                    <form action="{{ route('dashboard.orders.update.status', $order->id) }}" method="POST">
                        @csrf
                        <div class="mb-3">
                            <label class="form-label">Đổi trạng thái</label>
                            <select name="status" class="form-select" required>
                                <option value="pending" {{ $order->status == 'pending' ? 'selected' : '' }}>Chờ xác nhận</option>
                                <option value="confirmed" {{ $order->status == 'confirmed' ? 'selected' : '' }}>Đã xác nhận</option>
                                <option value="shipping" {{ $order->status == 'shipping' ? 'selected' : '' }}>Đang giao</option>
                                <option value="delivered" {{ $order->status == 'delivered' ? 'selected' : '' }}>Đã giao</option>
                                <option value="success" {{ $order->status == 'success' ? 'selected' : '' }}>Thành công</option>
                                <option value="cancelled" {{ $order->status == 'cancelled' ? 'selected' : '' }}>Hủy đơn</option>
                                <option value="failed" {{ $order->status == 'failed' ? 'selected' : '' }}>Thất bại</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Ghi chú</label>
                            <textarea name="notes" class="form-control" rows="2" placeholder="Lý do thay đổi..."></textarea>
                        </div>
                        <button type="submit" class="btn btn-success w-100">Cập nhật trạng thái</button>
                    </form>
                </div>
            </div>

            <!-- Lịch sử đơn hàng -->
            <div class="card mt-3">
                <div class="card-header">Lịch sử thay đổi</div>
                <div class="card-body">
                    @foreach ($histories as $history)
                    <div class="d-flex mb-3">
                        <div class="flex-shrink-0">
                            <span class="badge bg-secondary text-white">{{ $history->created_at->format('H:i d/m') }}</span>
                        </div>
                        <div class="flex-grow-1 ms-3">
                            <strong>{{ $history->status }}</strong><br>
                            <small class="text-muted">{{ $history->notes }}</small>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>
@endsection