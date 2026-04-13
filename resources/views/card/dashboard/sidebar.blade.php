 <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="{{ url('dashboard') }}">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Trang Quản Trị </div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="index.html">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Thống kê</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Quản lý
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Danh mục</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Quản lý danh mục</h6>
                        <a class="collapse-item" href="{{ route('dashboard.categories.index') }}">Danh mục</a>
                        <a class="collapse-item" href="{{ route('dashboard.categories.create') }}">Thêm mới</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
           <li class="nav-item">
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseProducts"
        aria-expanded="true" aria-controls="collapseProducts">
        <i class="fas fa-fw fa-wrench"></i>
        <span>Sản phẩm</span>
    </a>
    <div id="collapseProducts" class="collapse" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Quản lý sản phẩm:</h6>
            <a class="collapse-item" href="{{ route('dashboard.products.index') }}">Danh sách</a>
            <a class="collapse-item" href="{{ route('dashboard.products.create') }}">Thêm mới</a>
        </div>
    </div>
</li>

               <li class="nav-item">
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseVoucher"
        aria-expanded="true" aria-controls="collapseVoucher">
        <i class="fas fa-fw fa-wrench"></i>
        <span>Voucher</span>
    </a>

    <div id="collapseVoucher" class="collapse" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Quản lý voucher:</h6>

            @foreach (App\Models\Admin\CategoryVoucher::all() as $render_menu)
                <a class="collapse-item" href="{{ url("dashboard/voucher/{$render_menu->slug}") }}">
                    {{ $render_menu->name }}
                </a>
            @endforeach

        </div>
    </div>
</li>
<li class="nav-item">
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOrders"
        aria-expanded="true" aria-controls="collapseOrders">
        <i class="fas fa-fw fa-shopping-cart"></i>
        <span>Đơn hàng</span>
    </a>

    <div id="collapseOrders" class="collapse" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Quản lý đơn hàng:</h6>
            <a class="collapse-item" href="{{ route('dashboard.orders.index') }}">Danh sách đơn hàng</a>
        </div>
    </div>
</li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>

            <!-- Nav Item - Pages Collapse Menu -->


            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

           

        </ul>