@extends('layouts.layoutdashboard')

@section('content')
    <div class="container-fluid">
        <div class="container-fluid">

            <!-- Page title -->
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h4 class="mb-sm-0">Thêm mới sản phẩm</h4>
                    </div>
                </div>
            </div>

            <form id="createproduct-form" method="POST" action="{{ route('dashboard.products.store') }}" enctype="multipart/form-data" class="needs-validation" novalidate>
    @csrf

    <div class="row">

        <!-- Thông tin sản phẩm chính -->
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">

                    <!-- Tên sản phẩm -->
                    <div class="mb-3">
                        <label class="form-label">Tên sản phẩm <span class="text-danger">*</span></label>
                        <input type="text" class="form-control @error('name') is-invalid @enderror" 
                               name="name" placeholder="Nhập tên sản phẩm" value="{{ old('name') }}" required>
                        @error('name')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <!-- Slug -->
                    <div class="mb-3">
                        <label class="form-label">Slug</label>
                        <input type="text" class="form-control @error('slug') is-invalid @enderror" 
                               name="slug" value="{{ old('slug') }}" readonly>
                        @error('slug')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <!-- Mô tả -->
                    <div class="mb-3">
                        <label class="form-label">Mô tả sản phẩm</label>
                        <textarea id="description-editor" class="form-control @error('description') is-invalid @enderror" 
                                  name="description" rows="4">{{ old('description') }}</textarea>
                        @error('description')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <!-- Danh mục -->
                    <div class="mb-3">
                        <label class="form-label">Danh mục sản phẩm <span class="text-danger">*</span></label>
                        <select class="form-select @error('category_id') is-invalid @enderror" 
                                name="category_id" required>
                            <option value="">-- Chọn danh mục --</option>
                            @foreach ($categories as $category)
                                <option value="{{ $category->id }}" {{ old('category_id') == $category->id ? 'selected' : '' }}>
                                    {{ $category->name }}
                                </option>
                            @endforeach
                        </select>
                        @error('category_id')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <!-- Ảnh đại diện -->
                    <div class="mb-3">
                        <label class="form-label">Hình ảnh sản phẩm <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <input type="file" class="form-control" id="product-image" accept="image/*">
                            <label class="input-group-text" for="product-image">Chọn ảnh</label>
                        </div>
                        <input type="hidden" name="temp_image_url" id="temp_image_url" value="{{ old('temp_image_url') }}">
                        <div id="product-image-preview" class="mt-2"></div>
                        @error('temp_image_url')
                            <div class="invalid-feedback d-block">{{ $message }}</div>
                        @enderror
                    </div>

                </div>
            </div>
        </div>

        <!-- Biến thể -->
        <div class="col-lg-12 mt-4">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">Biến thể sản phẩm</h5>
                </div>
                <div class="card-body">

                    <div id="variant-container">
                        @php $oldVariants = old('variants', []); @endphp
                        @if (count($oldVariants) > 0)
                            @foreach ($oldVariants as $index => $variant)
                                @include('dashboard.products.partial.variant-item', [
                                    'index' => $index,
                                    'variant' => $variant,
                                    'sizes' => $sizes,
                                    'colors' => $colors,
                                ])
                            @endforeach
                        @else
                            @include('dashboard.products.partial.variant-item', [
                                'index' => 0,
                                'variant' => [],
                                'sizes' => $sizes,
                                'colors' => $colors,
                            ])
                        @endif
                    </div>

                    <p class="text-muted fst-italic mt-3">
                        (*) Mỗi tổ hợp Màu + Size sẽ tạo ra một biến thể. 
                        Tên biến thể sẽ tự động là: <strong>Tên sản phẩm + Màu + Size</strong>
                    </p>

                    <div class="text-center">
                        <button type="button" id="add-variant" class="btn btn-success btn-sm">
                            + Thêm biến thể
                        </button>
                    </div>

                </div>
            </div>
        </div>

        <!-- Nút hành động -->
      <div class="d-flex justify-content-start mb-5">
    <button type="submit" class="btn btn-primary me-2" id="btn-submit-debug">
        THÊM MỚI SẢN PHẨM
    </button>
    <a href="{{ route('dashboard.products.index') }}" class="btn btn-danger">QUAY LẠI</a>
</div>

    </div>
</form>
        </div>
    </div>
@endsection

@section('js-content')
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/35.3.2/classic/ckeditor.js"></script>

<script>
document.addEventListener('DOMContentLoaded', function() {

    // Khởi tạo CKEditor an toàn
    const descriptionEditor = document.querySelector('#description-editor');
    if (descriptionEditor) {
        ClassicEditor.create(descriptionEditor)
            .catch(error => {
                console.error('CKEditor error:', error);
            });
    }

    let variantIndex = {{ count(old('variants', [])) > 0 ? count(old('variants', [])) : 1 }};

    // Tự động tạo slug
    function removeVietnameseTones(str) {
        return str.normalize('NFD').replace(/[\u0300-\u036f]/g, '')
                 .replace(/đ/g, 'd').replace(/Đ/g, 'D');
    }

    $(document).on('input', 'input[name="name"]', function() {
        let name = $(this).val();
        let slug = removeVietnameseTones(name).toLowerCase()
            .trim()
            .replace(/[^a-z0-9\s-]/g, '')
            .replace(/[\s-]+/g, '-')
            .replace(/^-+|-+$/g, '');
        $('input[name="slug"]').val(slug);
    });

    // Thêm biến thể
    $('#add-variant').on('click', function() {
        let newVariant = `@include('dashboard.products.partial.variant-item', ['index' => '__INDEX__'])`;
        newVariant = newVariant.replace(/__INDEX__/g, variantIndex);
        $('#variant-container').append(newVariant);
        variantIndex++;
    });

    // Upload ảnh sản phẩm
    $(document).on('change', '#product-image', function() {
        let formData = new FormData();
        formData.append('image', this.files[0]);
        formData.append('_token', '{{ csrf_token() }}');

        $.ajax({
            url: '{{ route("dashboard.products.uploadTempImage") }}',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            success: function(response) {
                if (response.url) {
                    $('#temp_image_url').val(response.url);
                    $('#product-image-preview').html(`<img src="${response.url}" class="img-thumbnail" style="max-height: 250px;">`);
                }
            },
            error: function(xhr) {
                console.error(xhr.responseJSON);
                alert('Upload ảnh sản phẩm thất bại!');
            }
        });
    });

    // Upload ảnh biến thể
    $(document).on('change', '.variant-image-input', function() {
        let index = $(this).data('index');
        let formData = new FormData();
        formData.append('variant_image', this.files[0]);
        formData.append('_token', '{{ csrf_token() }}');

        $.ajax({
            url: '{{ route("dashboard.products.uploadTempVariantImage") }}',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            success: function(response) {
                if (response.url) {
                    $(`input[name="variants[${index}][temp_variant_image_url]"]`).val(response.url);
                    $(`#variant-image-preview-${index}`).html(`<img src="${response.url}" width="100" class="img-thumbnail">`);
                }
            }
        });
    });

    // Xóa biến thể
    $(document).on('click', '.remove-variant', function() {
        if ($('.variant-item').length > 1) {
            $(this).closest('.variant-item').remove();
        } else {
            alert('Sản phẩm phải có ít nhất một biến thể!');
        }
    });

});

</script>
@endsection