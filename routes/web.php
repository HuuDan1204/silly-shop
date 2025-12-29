<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Client\HomeController;
use App\Http\Controllers\Client\CartController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\ProductController;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
*/

// ----------------- Client Routes -----------------
Route::get('/', [HomeController::class, 'index'])->name('home');

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

});

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');


Auth::routes();
