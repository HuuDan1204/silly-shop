<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Client\HomeController;
use App\Http\Controllers\Client\CartController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\CategoryController;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
*/

// ----------------- Client Routes -----------------
Route::get('/', [HomeController::class, 'index'])->name('home');

Route::get('/category/{slug}', [HomeController::class, 'category'])
    ->name('shop.category');
Route::get('/cart', [CartController::class, 'index'])->name('cart.index');


// ----------------- Admin Routes -----------------
Route::prefix('dashboard')
    ->middleware('dashboard.auth')   // tên middleware mới, đẹp hơn
    ->name('dashboard.')             // tên route cũng đổi cho đồng bộ
    ->group(function () {

    Route::get('/', [DashboardController::class, 'index'])
        ->name('index');             // → route: dashboard.index

    Route::resource('products', ProductController::class)
        ->names([
            'index'   => 'products.index',
            'create'  => 'products.create',
            'store'   => 'products.store',
            'show'    => 'products.show',
            'edit'    => 'products.edit',
            'update'  => 'products.update',
            'destroy'=> 'products.destroy',
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


Auth::routes();
