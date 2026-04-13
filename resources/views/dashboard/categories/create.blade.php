@extends('layouts.layoutdashboard')

@section('content')
<div class="container-fluid">
    <h1 class="h3 mb-4">Thêm danh mục mới</h1>

    <form action="{{ route('dashboard.categories.store') }}" method="POST" enctype="multipart/form-data">
        @csrf

        <div class="mb-3">
            <label class="form-label">Tên danh mục</label>
            <input type="text" name="name" 
                   class="form-control @error('name') is-invalid @enderror"
                   value="{{ old('name') }}" autofocus>

            @error('name')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>

        <div class="mb-3">
            <label class="form-label">Ảnh danh mục</label>

            <input type="file" name="image"
                   class="form-control @error('image') is-invalid @enderror">

            @error('image')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>

        <button type="submit" class="btn btn-primary">
            Lưu danh mục
        </button>

    </form>
</div>
@endsection