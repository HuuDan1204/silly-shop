<!-- Footer -->
<div class="container-fluid bg-secondary text-dark mt-5 pt-5">
    <div class="row px-xl-5 pt-5">
        
        <!-- Cột 1: Thông tin cửa hàng -->
        <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
            <a href="{{ url('/') }}" class="text-decoration-none">
                <h1 class="mb-4 display-5 font-weight-semi-bold">
                    <span class="text-primary font-weight-bold border border-white px-3 mr-1">Silly</span>Shop
                </h1>
            </a>
            <p class="mb-4">Cửa hàng thời trang uy tín với nhiều sản phẩm chất lượng và dịch vụ tốt nhất dành cho bạn.</p>
            
            <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>Hà Nội, Việt Nam</p>
            <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>support@sillyshop.vn</p>
            <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>0395 069 694</p>
        </div>

        <!-- Cột 2: Liên kết nhanh -->
        <div class="col-lg-3 col-md-6 mb-5">
            <h5 class="font-weight-bold text-dark mb-4">Thông tin</h5>
            <div class="d-flex flex-column justify-content-start">
                <a class="text-dark mb-2" href="{{ url('/') }}"><i class="fa fa-angle-right mr-2"></i>Trang chủ</a>
                <a class="text-dark mb-2" href="{{ url('/shop') }}"><i class="fa fa-angle-right mr-2"></i>Cửa hàng</a>
                <a class="text-dark mb-2" href="{{ url('/about') }}"><i class="fa fa-angle-right mr-2"></i>Về chúng tôi</a>
                <a class="text-dark mb-2" href="{{ url('/contact') }}"><i class="fa fa-angle-right mr-2"></i>Liên hệ</a>
            </div>
        </div>

        <!-- Cột 3: Hỗ trợ khách hàng -->
        <div class="col-lg-3 col-md-6 mb-5">
            <h5 class="font-weight-bold text-dark mb-4">Hỗ trợ</h5>
            <div class="d-flex flex-column justify-content-start">
                <a class="text-dark mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Chính sách đổi trả</a>
                <a class="text-dark mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Chính sách bảo hành</a>
                <a class="text-dark mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Hướng dẫn mua hàng</a>
                <a class="text-dark mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Câu hỏi thường gặp</a>
            </div>
        </div>

        <!-- Cột 4: Newsletter -->
        <div class="col-lg-2 col-md-12 mb-5">
            <h5 class="font-weight-bold text-dark mb-4">Newsletter</h5>
            <p class="mb-3">Đăng ký nhận tin khuyến mãi mới nhất</p>
            <form action="">
                <div class="form-group mb-3">
                    <input type="email" class="form-control border-0 py-3" placeholder="Nhập email của bạn" required />
                </div>
                <button class="btn btn-primary btn-block border-0 py-3" type="submit">Đăng ký</button>
            </form>
        </div>
    </div>

    <!-- Dòng dưới cùng -->
    <div class="row border-top border-light mx-xl-5 py-4">
        <div class="col-md-6 px-xl-0">
            <p class="mb-0">&copy; {{ date('Y') }} SillyShop. All Rights Reserved.</p>
        </div>
        <div class="col-md-6 px-xl-0 text-center text-md-right">
            <img class="img-fluid" src="{{ asset('img/payments.png') }}" alt="Payment Methods" style="height: 30px;">
        </div>
    </div>
</div>