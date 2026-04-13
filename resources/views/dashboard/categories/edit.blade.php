@extends('layouts.layoutdashboard')

@section('content')
<div class="container-fluid">

    <h1 class="h3 mb-4 text-gray-800">Sửa danh mục: {{ $category->name }}</h1>

    <div class="card shadow mb-4">

        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Thông tin danh mục</h6>
        </div>

        <div class="card-body">

            <form action="{{ route('dashboard.categories.update', $category) }}" 
                  method="POST" 
                  enctype="multipart/form-data">

                @csrf
                @method('PUT')

                <div class="row">

                    <div class="col-md-8">

                        <!-- Tên -->
                        <div class="form-group mb-4">
                            <label class="font-weight-bold">Tên danh mục</label>

                            <input type="text"
                                   name="name"
                                   class="form-control @error('name') is-invalid @enderror"
                                   value="{{ old('name', $category->name) }}"
                                   required>

                            @error('name')
                            <div class="invalid-feedback">{{ $message }}</div>
                            @enderror

                        </div>


                      


                        <!-- Ảnh hiện tại -->
                        <div class="form-group mb-4">
                            <label class="font-weight-bold">Ảnh hiện tại</label>

                            <div>
                                <img src="{{ asset('storage/'.$category->image) }}"
                                     width="150"
                                     class="img-thumbnail">
                            </div>
                        </div>


                        <!-- Upload ảnh mới -->
                        <div class="form-group mb-4">
                            <label class="font-weight-bold">Chọn ảnh mới</label>

                            <input type="file"
                                   name="image"
                                   class="form-control @error('image') is-invalid @enderror">

                            @error('image')
                            <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                    </div>

                </div>


                <div class="mt-4">

                    <button type="submit"
                        class="btn btn-primary btn-icon-split shadow-sm">

                        <span class="icon text-white-50">
                            <i class="fas fa-save"></i>
                        </span>

                        <span class="text">
                            Cập nhật danh mục
                        </span>

                    </button>


                    <a href="{{ route('dashboard.categories.index') }}"
                       class="btn btn-secondary btn-icon-split shadow-sm ml-2">

                        <span class="icon text-white-50">
                            <i class="fas fa-arrow-left"></i>
                        </span>

                        <span class="text">
                            Quay lại
                        </span>

                    </a>

                </div>

            </form>

        </div>
    </div>
</div>
@endsection