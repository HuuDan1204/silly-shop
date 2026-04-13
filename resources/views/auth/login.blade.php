@extends('layout.auth')

@section('title', 'Đăng nhập - Silly Shop')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-5 col-md-7">
            <div class="card auth-card p-4">
                <div class="card-body">

                    <!-- Logo + Tên shop -->
                    <div class="text-center mb-4">
                        <h1 class="logo mb-1">
                            <i class="fas fa-shopping-bag"></i> Silly
                        </h1>
                        <p class="text-muted fs-5">Shop</p>
                    </div>

                    <h4 class="text-center mb-4 fw-bold text-dark">Đăng nhập</h4>

                    @if (session('error'))
                        <div class="alert alert-danger">{{ session('error') }}</div>
                    @endif

                    <form method="POST" action="{{ route('login') }}">
                        @csrf

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Email</label>
                            <input type="email" name="email" class="form-control form-control-lg @error('email') is-invalid @enderror" 
                                   value="{{ old('email') }}"  autofocus>
                            @error('email')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-semibold">Mật khẩu</label>
                            <input type="password" name="password" class="form-control form-control-lg @error('password') is-invalid @enderror" >
                            @error('password')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <div class="form-check">
                                <input type="checkbox" name="remember" class="form-check-input" id="remember">
                                <label class="form-check-label" for="remember">Ghi nhớ đăng nhập</label>
                            </div>
                            <a href="{{ route('password.request') }}" class="text-decoration-none small">Quên mật khẩu?</a>
                        </div>

                        <button type="submit" class="btn btn-primary btn-lg w-100">
                            Đăng nhập
                        </button>
                    </form>

                    <div class="text-center mt-4">
                        <p class="mb-0">Chưa có tài khoản? 
                            <a href="{{ route('register') }}" class="text-primary fw-bold">Đăng ký ngay</a>
                        </p>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection