<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use App\Models\Admin\Category;
use App\Models\Admin\Product;
use Illuminate\Http\Request;

class HomeController extends Controller
{
   public function index()
{
    $products = Product::latest()->get();
     $categories = Category::latest()->take(6)->get();
// dd($products);
    return view('shop.index', compact('products', 'categories'));
}
}
