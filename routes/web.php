<?php

use App\Http\Controllers\Client\HomeController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Client\CartController;

Route::get('/', function () {
    return view('welcome');
});


Route::middleware(['web', 'auth', 'is_admin'])
    ->prefix('admin')
    ->name('admin.')
    ->group(function () {
        Route::resource('products', ProductController::class);
    });



Route::get('/', [HomeController::class, 'index'])->name('home');
Route::get('/cart', [CartController::class, 'index'])->name('cart.add');

// Auth::routes();

