<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use App\Models\Admin\Category;
use App\Models\Admin\Product;
use App\Models\Admin\ProductVariant;
use Illuminate\Http\Request;

class ShopController extends Controller
{
public function index(Request $request)
{
    $keyword      = $request->get('keyword');
    $category_id  = $request->get('category_id');
    $price_range  = $request->get('price_range');
    $colors       = $request->get('colors', []);
    $sizes        = $request->get('sizes', []);
    $sort         = $request->get('sort', 'latest');

    $query = \App\Models\Admin\ProductVariant::with(['product', 'color', 'size'])
        ->where('is_show', 1)
        ->where('stock', '>', 0);   // chỉ lấy biến thể còn hàng

    // Tìm kiếm theo tên sản phẩm
    if ($keyword) {
        $query->whereHas('product', function ($q) use ($keyword) {
            $q->where('name', 'like', "%{$keyword}%")
              ->orWhere('slug', 'like', "%{$keyword}%");
        });
    }

    // Lọc theo danh mục
    if ($category_id) {
        $query->whereHas('product', function ($q) use ($category_id) {
            $q->where('category_id', $category_id);
        });
    }

    // Lọc theo giá (dùng sale_price của variant)
    if ($price_range && $price_range !== 'all') {
        if ($price_range === '0-500000') {
            $query->where('sale_price', '<=', 500000);
        } elseif ($price_range === '500000-1000000') {
            $query->whereBetween('sale_price', [500000, 1000000]);
        } elseif ($price_range === '1000000-2000000') {
            $query->whereBetween('sale_price', [1000000, 2000000]);
        } elseif ($price_range === '2000000-5000000') {
            $query->whereBetween('sale_price', [2000000, 5000000]);
        } elseif ($price_range === '5000000') {
            $query->where('sale_price', '>', 5000000);
        }
    }

    // Lọc theo màu
    if (!empty($colors)) {
        $query->whereIn('color_id', $colors);
    }

    // Lọc theo size
    if (!empty($sizes)) {
        $query->whereIn('size_id', $sizes);
    }

    // Sắp xếp
    switch ($sort) {
        case 'price_asc':
            $query->orderBy('sale_price', 'asc');
            break;
        case 'price_desc':
            $query->orderBy('sale_price', 'desc');
            break;
        default:
            $query->latest();
    }

    $variants = $query->paginate(12)->appends(request()->query());

    // Lấy danh mục để hiển thị sidebar
    $categories = Category::where('status', '1')
        ->orderBy('name')
        ->get();

    return view('shop.product', compact(
        'variants', 
        'categories', 
        'keyword', 
        'category_id', 
        'price_range', 
        'sort'
    ));
}
}