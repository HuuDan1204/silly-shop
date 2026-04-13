@extends('layouts.layoutdashboard')

@section('content')
<div class="container-fluid">

    <h1 class="h3 mb-4 text-gray-800">Quản lý danh mục</h1>

    <a href="{{ route('dashboard.categories.create') }}" 
       class="btn btn-primary shadow-sm mb-4">
        <i class="fas fa-plus-circle mr-2"></i> Thêm danh mục mới
    </a>

    @if (session('success'))
        <div class="alert alert-success alert-dismissible fade show">
            <i class="fas fa-check-circle mr-2"></i>
            {{ session('success') }}

            <button type="button" class="close" data-dismiss="alert">
                <span>&times;</span>
            </button>
        </div>
    @endif


    <div class="card shadow mb-4">

        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">
                Danh sách danh mục
            </h6>
        </div>

        <div class="card-body">

            <div class="table-responsive">

                <table class="table table-bordered table-hover" id="dataTable">

                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Ảnh</th>
                            <th>Tên danh mục</th>
                            <th>Ngày tạo</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>

                    <tbody>

                        @forelse ($categories as $category)

                        <tr>

                            <td>{{ $category->id }}</td>

                            <!-- ẢNH -->
                             <td width="120">
                            <img src="{{ $category->image_url }}"
                                width="60"
                                height="60"
                                style="object-fit:cover"
                                class="rounded border">
                        </td>

                            <td>{{ $category->name }}</td>

                            

                            <td>
                                {{ $category->created_at ? $category->created_at->format('d/m/Y H:i') : 'N/A' }}
                            </td>

                            <td>

                                <!-- EDIT -->
                                <a href="{{ route('dashboard.categories.edit',$category) }}"
                                   class="btn btn-warning btn-circle btn-sm"
                                   title="Sửa">

                                    <i class="fas fa-edit"></i>

                                </a>

                                <!-- DELETE -->
                                <form action="{{ route('dashboard.categories.destroy',$category) }}"
                                      method="POST"
                                      class="d-inline">

                                    @csrf
                                    @method('DELETE')

                                    <button type="submit"
                                        class="btn btn-danger btn-circle btn-sm"
                                        onclick="return confirm('Bạn chắc chắn muốn xóa danh mục này?')">

                                        <i class="fas fa-trash"></i>

                                    </button>

                                </form>

                            </td>

                        </tr>

                        @empty

                        <tr>
                            <td colspan="6" class="text-center py-4 text-muted">
                                <i class="fas fa-folder-open fa-2x mb-3 d-block"></i>
                                Chưa có danh mục nào. Hãy thêm mới nhé!
                            </td>
                        </tr>

                        @endforelse

                    </tbody>

                </table>

            </div>


            <div class="d-flex justify-content-center mt-4">
                {{ $categories->links('pagination::bootstrap-5') }}
            </div>

        </div>

    </div>

</div>
@endsection