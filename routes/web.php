<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Client\HomeController;
use App\Http\Controllers\Client\CartController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\OrderControllerAdmin;
use App\Http\Controllers\Admin\ProductVariantController;
use App\Http\Controllers\Admin\VoucherController;
use App\Http\Controllers\Client\OrderController;
use App\Http\Controllers\Client\SearchController;
use App\Http\Controllers\Client\ShopController;
use App\Http\Controllers\Client\UserController;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
*/

Route::get('/login', function () {
    return view('auth.login');
})->name('login');
// Override trang register
Route::get('/register', function () {
    return view('auth.register');
})->name('register');
// Profile User

Route::middleware('auth')->group(function () {
    Route::get('/profile', [UserController::class, 'index'])->name('profile.index');
    Route::put('/profile', [UserController::class, 'update'])->name('profile.update');
    Route::post('/profile/avatar', [UserController::class, 'updateAvatar'])->name('profile.avatar.update');
});

// ----------------- Client Routes -----------------
Route::get('/', [HomeController::class, 'index'])->name('home');

Route::get('category', [HomeController::class, 'category'])
    ->name('shop.category');
Route::prefix('cart')->name('cart.')->group(function () {

    Route::get('/', [CartController::class, 'index'])->name('index');

    // Thêm sản phẩm vào giỏ (sửa lại cho đúng)
    Route::post('/add/{id}', [CartController::class, 'add_to_cart'])->name('add');
    Route::post('/update-quantity', [CartController::class, 'updateQuantity'])->name('updateQuantity');
    Route::post('/ajax-update-selected', [CartController::class, 'ajaxUpdateSelected'])->name('ajaxUpdateSelected');
    Route::post('/delete-selected', [CartController::class, 'deleteSelected'])->name('deleteSelected');
    Route::post('/calculate-total', [CartController::class, 'calculateTotal'])->name('calculateTotal');
    Route::post('/apply-voucher', [CartController::class, 'applyVoucher'])->name('applyVoucher');

});

// Trang Shop - Danh sách sản phẩm
Route::get('/shop', [ShopController::class, 'index'])
     ->name('shop.products');

// ==================== CHECKOUT & ORDER ====================
Route::middleware('auth')->group(function () {

    // Trang checkout
    Route::get('/checkout', [OrderController::class, 'checkout'])
         ->name('checkout');

    // Xử lý đặt hàng
    Route::post('/checkout', [OrderController::class, 'processCheckout'])
         ->name('checkout.process');

 

});
// API lấy phường/xã theo tỉnh
Route::get('/api/wards/{province_code}', function($province_code) {
    $wards = \App\Models\Ward::where('province_code', $province_code)
                              ->orderBy('name')
                              ->get(['ward_code', 'name']);
    return response()->json($wards);
});
// Trang chi tiết sản phẩm
Route::get('/product/{slug}', [HomeController::class, 'productDetail'])
    ->name('shop.product.detail');
    Route::post('/vnpay/ipn', [OrderController::class, 'vnpayIpn'])->name('vnpay.ipn');
    Route::get('/vnpay/return', [OrderController::class, 'vnpayReturn'])->name('vnpay.return');






Route::prefix('dashboard')->name('dashboard.')->middleware('auth')->group(function () {

    Route::resource('voucher', VoucherController::class)->except(['create', 'edit', 'show']);
    // Custom routes
    Route::get('voucher/{slug}', [VoucherController::class, 'index'])->name('voucher.index');
    Route::get('voucher/{action}/{id}', [VoucherController::class, 'detail'])->name('voucher.detail');
    Route::post('voucher/add_voucher', [VoucherController::class, 'store'])->name('voucher.add');
     Route::get('voucher/{action}/{id}/edit', [VoucherController::class, 'edit'])->name('voucher.edit');
    Route::post('voucher/{id}/update', [VoucherController::class, 'update'])->name('voucher.update');
    Route::post('voucher/disable/{id}', [VoucherController::class, 'disable'])->name('voucher.disable');
    Route::post('voucher/active/{id}', [VoucherController::class, 'active'])->name('voucher.active');
    Route::post('voucher/ads', [VoucherController::class, 'ads'])->name('voucher.ads');
    Route::post('voucher/accept/{id}', [VoucherController::class, 'accept_voucher'])->name('voucher.accept');
    Route::post('voucher/restore/{id}', [VoucherController::class, 'restore'])->name('voucher.restore');
      Route::post('voucher/ads', [VoucherController::class, 'ads'])->name('voucher.ads');
});
Route::prefix('dashboard')
    ->middleware('dashboard.auth')   // tên middleware mới, đẹp hơn
    ->name('dashboard.')             // tên route cũng đổi cho đồng bộ
    ->group(function () {

    Route::get('/', [DashboardController::class, 'index'])
        ->name('index');             // → route: dashboard.index

    Route::resource('products', ProductController::class);
    // Upload ảnh tạm cho sản phẩm
Route::post('products/upload-temp-image', [ProductController::class, 'uploadTempImage'])
     ->name('products.uploadTempImage');

// Upload ảnh tạm cho biến thể
Route::post('products/upload-temp-variant-image', [ProductController::class, 'uploadTempVariantImage'])
     ->name('products.uploadTempVariantImage');
   Route::resource('variants', ProductVariantController::class)->names([
    'index'   => 'variants.index',
    'create'  => 'variants.create',
    'store'   => 'variants.store',
    'edit'    => 'variants.edit',
    'update'  => 'variants.update',
    'destroy' => 'variants.destroy',
]);
        Route::resource('categories', CategoryController::class)->names([
            'index'   => 'categories.index',
            'create'  => 'categories.create',
            'store'   => 'categories.store',
            'show'    => 'categories.show',
            'edit'    => 'categories.edit',
            'update'  => 'categories.update',
            'destroy' => 'categories.destroy',
        ]);
});

Route::get('/home', [HomeController::class, 'index'])->name('home');
// ==================== QUẢN LÝ ĐƠN HÀNG ====================
// ==================== QUẢN LÝ ĐƠN HÀNG ====================
Route::prefix('dashboard/orders')
    ->name('dashboard.orders.')
    ->middleware(['auth'])           // ← chỉ giữ auth (phải đăng nhập)
    ->group(function () {

        Route::get('/', [OrderControllerAdmin::class, 'index'])
            ->name('index');

        Route::get('/{id}', [OrderControllerAdmin::class, 'show'])
            ->name('show');

        Route::post('/{id}/update-status', [OrderControllerAdmin::class, 'updateStatus'])
            ->name('update.status');
    });

Auth::routes();
