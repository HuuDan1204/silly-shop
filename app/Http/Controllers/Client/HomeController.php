<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use App\Models\Admin\Category;
use App\Models\Admin\Product;
use App\Models\Admin\FlashSaleItem;
use App\Models\Admin\Voucher;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    // Trang chủ

public function index()
{
    // sản phẩm
    $products = Product::with([
        'variants.color',
        'variants.size'
    ])
    ->latest()
    ->take(12)
    ->get();

    // danh mục
    $categories = Category::where('status', '1')
        ->latest()
        ->take(6)
        ->get();

    // flash sale
    $flashSales = FlashSaleItem::with([
        'product'
    ])
    ->latest()
    ->take(8)
    ->get();

    // 🔥 THÊM ĐOẠN NÀY
    $vouchers = Voucher::where('status', 'active')
        ->where('max_used', '>', 0)
        ->latest()
        ->take(2) // lấy 2 banner
        ->get();

    return view('shop.index', compact(
        'products',
        'categories',
        'flashSales',
        'vouchers' // 🔥 nhớ truyền qua view
    ));
}

    // Chi tiết sản phẩm
    public function productDetail($slug)
    {
        $product = Product::with([
            'variants.color',
            'variants.size'
        ])
        ->where('slug', $slug)
        ->firstOrFail();

        // sản phẩm liên quan
        $relatedProducts = Product::with(['variants'])
            ->where('category_id', $product->category_id)
            ->where('id', '!=', $product->id)
            ->take(4)
            ->get();

        return view('shop.detail', compact(
            'product',
            'relatedProducts'
        ));
    }
}