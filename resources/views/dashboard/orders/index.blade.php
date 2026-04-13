@extends('layouts.layoutdashboard')

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0">Quản lý Đơn hàng</h4>
                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                        <li class="breadcrumb-item active">Đơn hàng</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="card" id="orderList">
                <div class="card-header border-0">
                    <div class="row align-items-center gy-3">
                        <div class="col-sm">
                            <h5 class="card-title mb-0">Danh sách đơn hàng</h5>
                        </div>
                    </div>
                </div>

                <div class="card-body pt-0">
                    <!-- TABS -->
                    <ul class="nav nav-tabs nav-tabs-custom nav-success mb-3" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link {{ $status == 'all' ? 'active' : '' }}" href="{{ route('dashboard.orders.index') }}">Tất cả ({{ $counts['all'] }})</a>
                        </li>
                        <li class="nav-item"><a class="nav-link {{ $status == 'pending' ? 'active' : '' }}" href="?status=pending">Chờ xác nhận ({{ $counts['pending'] }})</a></li>
                        <li class="nav-item"><a class="nav-link {{ $status == 'confirmed' ? 'active' : '' }}" href="?status=confirmed">Đã xác nhận ({{ $counts['confirmed'] }})</a></li>
                        <li class="nav-item"><a class="nav-link {{ $status == 'shipping' ? 'active' : '' }}" href="?status=shipping">Đang giao ({{ $counts['shipping'] }})</a></li>
                        <li class="nav-item"><a class="nav-link {{ $status == 'delivered' ? 'active' : '' }}" href="?status=delivered">Đã giao ({{ $counts['delivered'] }})</a></li>
                        <li class="nav-item"><a class="nav-link {{ $status == 'success' ? 'active' : '' }}" href="?status=success">Thành công ({{ $counts['success'] }})</a></li>
                        <li class="nav-item"><a class="nav-link {{ $status == 'cancelled' ? 'active' : '' }}" href="?status=cancelled">Đã hủy ({{ $counts['cancelled'] }})</a></li>
                        <li class="nav-item"><a class="nav-link {{ $status == 'failed' ? 'active' : '' }}" href="?status=failed">Thất bại ({{ $counts['failed'] }})</a></li>
                    </ul>

                    <div class="table-responsive table-card mb-1">
                        <table class="table table-nowrap align-middle" id="orderTable">
                            <thead class="text-muted table-light">
                                <tr>
                                    <th>Mã đơn</th>
                                    <th>Khách hàng</th>
                                    <th>Ngày đặt</th>
                                    <th>Tổng tiền</th>
                                    <th>Thanh toán</th>
                                    <th>Trạng thái</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($orders as $order)
                                <tr>
                                    <td><a href="{{ route('dashboard.orders.show', $order->id) }}" class="fw-medium link-primary">{{ $order->code_order }}</a></td>
                                    <td>{{ $order->name }}<br><small class="text-muted">{{ $order->phone }}</small></td>
                                    <td>{{ $order->created_at->format('d/m/Y H:i') }}</td>
                                    <td>{{ number_format($order->final_amount) }} đ</td>
                                    <td>
                                        @switch($order->status_pay)
                                            @case('paid')<span class="badge text-white bg-success">Đã thanh toán</span>@break
                                            @case('cod_paid')<span class="badge text-white bg-info">COD đã thu</span>@break
                                            @case('unpaid')<span class="badge text-white bg-warning">Chưa thanh toán</span>@break
                                            @default<span class="badge text-white bg-danger">{{ $order->status_pay }}</span>
                                        @endswitch
                                    </td>
                                    <td>
                                        @switch($order->status)
                                            @case('pending')<span class="badge text-white bg-warning">Chờ xác nhận</span>@break
                                            @case('confirmed')<span class="badge text-white bg-primary">Đã xác nhận</span>@break
                                            @case('shipping')<span class="badge text-white bg-info">Đang giao</span>@break
                                            @case('delivered')<span class="badge text-white bg-secondary">Đã giao</span>@break
                                            @case('success')<span class="badge text-white bg-success">Thành công</span>@break
                                            @case('cancelled')<span class="badge text-white bg-danger">Đã hủy</span>@break
                                            @case('failed')<span class="badge text-white bg-dark">Thất bại</span>@break
                                        @endswitch
                                    </td>
                                    <td>
                                        <a href="{{ route('dashboard.orders.show', $order->id) }}" class="btn btn-sm btn-primary">Xem</a>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>

                    <div class="d-flex justify-content-end">
                        {{ $orders->appends(request()->query())->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection