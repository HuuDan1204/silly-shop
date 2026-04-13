 <div class="container-fluid">
        <div class="row bg-secondary py-2 px-xl-5">
            <div class="col-lg-6 d-none d-lg-block">
                <div class="d-inline-flex align-items-center">
                    <a class="text-dark" href="">FAQs</a>
                    <span class="text-muted px-2">|</span>
                    <a class="text-dark" href="">Help</a>
                    <span class="text-muted px-2">|</span>
                    <a class="text-dark" href="">Support</a>
                </div>
            </div>
            <div class="col-lg-6 text-center text-lg-right">
                <div class="d-inline-flex align-items-center">
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a class="text-dark pl-2" href="">
                        <i class="fab fa-youtube"></i>
                    </a>
                </div>
            </div>
        </div>
        <div class="row align-items-center py-3 px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a href="{{ route('home') }}" class="text-decoration-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">Silly</span>Shop</h1>
                </a>
            </div>
            <div class="col-lg-6 col-6 text-left">
                {{-- <form action="{{ route('search') }}" method="GET" id="searchForm">
    <div class="input-group">
        <input type="text" 
               name="q" 
               id="searchInput"
               class="form-control" 
               placeholder="Tìm kiếm sản phẩm..." 
               autocomplete="off">
        
        <button type="submit" class="input-group-append btn btn-primary px-4">
            <i class="fa fa-search"></i>
        </button>
    </div>
</form> --}}

<!-- Gợi ý tìm kiếm sẽ hiện ở đây -->
<div id="searchSuggestions" class="search-suggestions dropdown-menu w-100"></div>
            </div>
            <div class="col-lg-3 col-6 text-right">
                {{-- <a href="" class="btn border">
                    <i class="fas fa-heart text-primary"></i>
                    <span class="badge">0</span>
                </a> --}}
                <a href="{{ route('cart.index') }}" class="btn border">
                    <i class="fas fa-shopping-cart text-primary"></i>
                    <span class="badge">1</span>
                </a>
            </div>
        </div>
    </div>