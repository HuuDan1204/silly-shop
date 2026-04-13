@extends('layout.auth')

@section('title', 'Đăng ký - Silly Shop')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-6 col-md-8">
            <div class="card auth-card p-4">
                <div class="card-body">

                    <div class="text-center mb-4">
                        <h1 class="logo mb-1">
                            <i class="fas fa-shopping-bag"></i> Silly
                        </h1>
                        <p class="text-muted fs-5">Shop</p>
                    </div>

                    <h4 class="text-center mb-4 fw-bold text-dark">Tạo tài khoản mới</h4>

                    <form method="POST" action="{{ route('register') }}">
                        @csrf

                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <label class="form-label fw-semibold">Họ và tên</label>
                                <input type="text" name="name" class="form-control form-control-lg @error('name') is-invalid @enderror" 
                                       value="{{ old('name') }}" >
                                @error('name')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Email</label>
                            <input type="email" name="email" class="form-control form-control-lg @error('email') is-invalid @enderror" 
                                   value="{{ old('email') }}" >
                            @error('email')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Mật khẩu</label>
                            <input type="password" name="password" class="form-control form-control-lg @error('password') is-invalid @enderror" >
                            @error('password')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-semibold">Xác nhận mật khẩu</label>
                            <input type="password" name="password_confirmation" class="form-control form-control-lg" >
                        </div>

                        <button type="submit" class="btn btn-primary btn-lg w-100">
                            Đăng ký tài khoản
                        </button>
                    </form>

                    <div class="text-center mt-4">
                        <p class="mb-0">Đã có tài khoản? 
                            <a href="{{ route('login') }}" class="text-primary fw-bold">Đăng nhập ngay</a>
                        </p>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection