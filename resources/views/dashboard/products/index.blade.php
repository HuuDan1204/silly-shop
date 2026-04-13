@extends('layouts.layoutdashboard')

@section('content')
    <div class="container-fluid">
        <div class="container-fluid">

            <!-- start page title -->
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h4 class="mb-sm-0">Quản lý sản phẩm</h4>
                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="javascript: void(0);">Thương mại điện tử</a></li>
                                <li class="breadcrumb-item active">Quản lý sản phẩm</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>

            @if (session('success'))
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    {{ session('success') }}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            @endif

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header border-0">
                            <div class="row g-4">
                                <div class="col-sm-auto">
                                    <a href="{{ route('dashboard.products.create') }}" class="btn btn-success">
                                        <i class="ri-add-line align-bottom me-1"></i> Thêm sản phẩm
                                    </a>
                                </div>
                                <div class="col-sm">
                                    <form method="GET" action="{{ route('dashboard.products.index') }}" class="row g-2">
                                        <input type="hidden" name="status" value="{{ $status }}">
                                        <div class="col">
                                            <input type="text" name="keyword" class="form-control"
                                                placeholder="Tìm tên hoặc slug..." value="{{ request('keyword') }}">
                                        </div>
                                        <div class="col">
                                            <select name="category_id" class="form-select">
                                                <option value="">-- Tất cả danh mục --</option>
                                                @foreach ($categories as $cat)
                                                    <option value="{{ $cat->id }}"
                                                        {{ request('category_id') == $cat->id ? 'selected' : '' }}>
                                                        {{ $cat->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-auto">
                                            <button type="submit" class="btn btn-primary">
                                                <i class="ri-search-line"></i> Tìm
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="card-header">
                            <div class="row align-items-center">
                                <div class="col">
                                    <ul class="nav nav-pills mb-3">
                                        <li class="nav-item">
                                            <a class="nav-link {{ $status == 'active' ? 'active' : '' }}"
                                                href="{{ route('dashboard.products.index', ['status' => 'active']) }}">
                                                Đang hoạt động ({{ $totalActive }})
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link {{ $status == 'trashed' ? 'active' : '' }}"
                                                href="{{ route('dashboard.products.index', ['status' => 'trashed']) }}">
                                                Đã xóa ({{ $totalTrashed }})
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link {{ $status == 'all' ? 'active' : '' }}"
                                                href="{{ route('dashboard.products.index', ['status' => 'all']) }}">
                                                Tất cả ({{ $totalAll }})
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        @if ($products->isEmpty())
                            <div class="card-body">
                                <div class="noresult text-center">
                                    <lord-icon src="https://cdn.lordicon.com/msoeawqm.json" trigger="loop"
                                        colors="primary:#405189,secondary:#0ab39c"
                                        style="width:75px;height:75px"></lord-icon>
                                    <h5 class="mt-2">Rất tiếc! Không tìm thấy kết quả</h5>
                                    <p class="text-muted">Chúng tôi đã tìm nhưng không thấy sản phẩm nào phù hợp.</p>
                                </div>
                            </div>
                        @else
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <h6 class="mb-0">Danh sách sản phẩm</h6>
                                    <div class="d-flex gap-2">
                                        <button id="delete-selected" class="btn btn-danger btn-sm">
                                            <i class="ri-delete-bin-line me-1"></i> Xóa đã chọn
                                        </button>
                                        @if (in_array($status, ['trashed', 'all']))
                                            <button id="restore-all" class="btn btn-success btn-sm">
                                                <i class="ri-refresh-line me-1"></i> Khôi phục tất cả
                                            </button>
                                        @endif
                                    </div>
                                </div>

                                <table class="table align-middle table-nowrap mb-0">
                                    <thead class="table-light">
                                        <tr>
                                            <th scope="col"><input type="checkbox" id="select-all"></th>
                                            <th scope="col">STT</th>
                                             <th scope="col">Hình ảnh</th>
                                            <th scope="col">Tên sản phẩm</th>
                                            <th scope="col">Slug</th>
                                            <th scope="col">Danh mục</th>
                                            <th scope="col">Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($products as $index => $product)
                                            <tr>
                                                <td><input type="checkbox" class="select-item" value="{{ $product->id }}"></td>
                                                <td>{{ $products->firstItem() + $index }}</td>
                                                {{-- Ảnh --}}
                                                    <td class="text-center">
                                                        <div class="avatar-sm bg-light rounded p-1 d-flex align-items-center justify-content-center"
                                                            style="width: 80px; height: 80px; overflow: hidden; margin:auto;">
                                                            
                                                          <img 
                                                                src="{{ asset($product->image_url) }}" 
                                                                alt="{{ $product->name }}"
                                                                style="width:100%; height:100%; object-fit: cover;">
                                                        </div>
                                                    </td>

                                                    {{-- Tên --}}
                                                    <td>
                                                        <h5 class="fs-14 mb-1">
                                                            <a href="{{ route('dashboard.products.show', $product->id) }}" 
                                                            class="text-body text-truncate d-inline-block" 
                                                            style="max-width: 250px;" 
                                                            title="{{ $product->name }}">
                                                                {{ $product->name }}
                                                            </a>
                                                        </h5>

                                                        <small class="text-muted">
                                                            {{ $product->slug }}
                                                        </small>
                                                    </td>

                                                <td class="text-truncate" style="max-width: 150px;" title="{{ $product->slug }}">
                                                    {{ $product->slug }}
                                                </td>
                                                <td>{{ $product->category->name ?? 'Chưa có' }}</td>
                                               <td class="text-center">
                                                    <a href="{{ route('dashboard.products.show', $product->id) }}" 
                                                    class="btn btn-info btn-sm">
                                                        Xem
                                                    </a>

                                                    <a href="{{ route('dashboard.products.edit', $product->id) }}" 
                                                    class="btn btn-warning btn-sm">
                                                        Sửa
                                                    </a>

                                                   <form action="{{ route('dashboard.products.destroy', $product->id) }}" 
                                                        method="POST" 
                                                        class="d-inline form-delete">
                                                        @csrf
                                                        @method('DELETE')

                                                        <button type="submit" class="btn btn-danger btn-sm">
                                                            Xóa
                                                        </button>
                                                    </form>
                                                </td>

                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>

                                <div class="mt-3">
                                    {{ $products->appends(request()->query())->links() }}
                                </div>
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
document.addEventListener('DOMContentLoaded', function () {

    // 🔥 1. Ẩn alert sau 3s
    setTimeout(function() {
        let alert = document.querySelector('.alert');
        if (alert) {
            alert.classList.remove('show');
            alert.classList.add('hide');
        }
    }, 3000);


    // 🔥 2. XÓA 1 sản phẩm (SweetAlert)
    document.querySelectorAll('.form-delete').forEach(form => {
        form.addEventListener('submit', function(e) {
            e.preventDefault();

            Swal.fire({
                title: 'Xác nhận xóa',
                text: 'Bạn có chắc muốn xóa sản phẩm này?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Xóa',
                cancelButtonText: 'Hủy',
                confirmButtonColor: '#d33'
            }).then((result) => {
                if (result.isConfirmed) {
                    form.submit();
                }
            });
        });
    });

});
</script>