<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use App\Models\Admin\FlashSaleItem;
use App\Models\Admin\Product;
use App\Models\Admin\ProductVariant;
use App\Models\Admin\Voucher;
use App\Models\Admin\VoucherUser;
use App\Models\Client\Cart;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CartController extends Controller
{
public function index()
{
    $userId = Auth::id();

    if (!$userId) {
        return redirect()->route('login')
            ->with('error', 'Vui lòng đăng nhập để xem giỏ hàng.');
    }

    // ================= CART =================
    $cartItems = Cart::with([
        'productVariant' => function ($query) {
            $query->with(['product', 'color', 'size']);
        }
    ])
    ->where('user_id', $userId)
    ->whereNull('flash_sale_items_id')
    ->get();

    // ================= XÓA ITEM LỖI =================
    $invalidItems = $cartItems->filter(fn($item) =>
        !$item->productVariant || !$item->productVariant->product
    );

    if ($invalidItems->isNotEmpty()) {
        Cart::whereIn('id', $invalidItems->pluck('id'))->delete();
        session()->flash('error', 'Một số sản phẩm đã bị xóa khỏi giỏ hàng.');
    }

    $cartItems = $cartItems->filter(fn($item) =>
        $item->productVariant && $item->productVariant->product
    );

    // ================= TÍNH TIỀN =================
    $selectedIds = session('cart_selected_ids', []);

    $subtotal = 0;
    $discount = session('voucher_discount', 0);
    $total = 0;

    if (!empty($selectedIds)) {
        $subtotal = $cartItems
            ->whereIn('id', $selectedIds)
            ->sum(fn($item) => $item->quantity * $item->price_at_time);

        $total = $subtotal - $discount;
    }

    // ================= VOUCHER =================
    $userVouchers = $this->getUserVouchers($userId);
 
    return view('shop.cart', compact(
        'cartItems',
        'subtotal',
        'total',
        'selectedIds',
        'userVouchers',
        'discount'
    ));
}
  public function ajaxUpdateSelected(Request $request)
    {
        $userId = Auth::id();
        $items = $request->input('items', []);

        $selectedIds = [];
        $subtotal = 0;

        foreach ($items as $item) {
            $cartItem = Cart::where('user_id', $userId)
                ->where('id', $item['id'])
                ->first();

            if ($cartItem) {
                // Cập nhật số lượng
                $cartItem->quantity = (int) $item['qty'];
                $cartItem->save();

                $selectedIds[] = $cartItem->id;

                $subtotal += $cartItem->quantity * $cartItem->price_at_time;
            }
        }

        // Lưu lại danh sách được chọn
        session(['cart_selected_ids' => $selectedIds]);

        // Xử lý voucher
        $voucherDiscount = 0;
        $voucherRemoved = false;

        if (session()->has('voucher_code')) {
            $voucher = DB::table('vouchers')
                ->where('code', session('voucher_code'))
                ->where('status', 'active')
                ->first();

            if ($voucher) {
                if ($voucher->type_discount === 'percent') {
                    $voucherDiscount = round($subtotal * ($voucher->value / 100));

                    if ($voucher->max_discount && $voucherDiscount > $voucher->max_discount) {
                        $voucherDiscount = $voucher->max_discount;
                    }
                } else {
                    $voucherDiscount = $voucher->value;
                }

                if ($voucher->min_order_value && $subtotal < $voucher->min_order_value) {
                    session()->forget(['voucher_code', 'voucher_discount']);
                    $voucherDiscount = 0;
                    $voucherRemoved = true;
                } else {
                    session(['voucher_discount' => $voucherDiscount]);
                }
            } else {
                session()->forget(['voucher_code', 'voucher_discount']);
                $voucherDiscount = 0;
                $voucherRemoved = true;
            }
        }

        $total = $subtotal - $voucherDiscount;

        return response()->json([
            'success' => true,
            'subtotal' => number_format($subtotal, 0, ',', '.'),
            'voucher_discount' => number_format($voucherDiscount, 0, ',', '.'),
            'total' => number_format($total, 0, ',', '.'),
            'voucher_removed' => $voucherRemoved,
        ]);
    }




//     {
//         $userId = Auth::id();
//         $now = now();

//         $vouchers = DB::table('vouchers_users')
//             ->join('vouchers', 'vouchers_users.voucher_id', '=', 'vouchers.id')
//             ->where('vouchers_users.user_id', $userId)
//             ->where('vouchers_users.status', 'available')
//             ->where('vouchers_users.is_used', 'used')
//             ->where(function ($query) use ($now) {
//                 $query->whereNull('vouchers_users.start_date')->orWhere('vouchers_users.start_date', '<=', $now);
//             })
//             ->where(function ($query) use ($now) {
//                 $query->whereNull('vouchers_users.end_date')->orWhere('vouchers_users.end_date', '>=', $now);
//             })
//             ->where(function ($query) {
//                 $query->whereNull('vouchers.max_used')
//                     ->orWhereColumn('vouchers.used', '<', 'vouchers.max_used');
//             })
//             ->where('vouchers.status', 'used')
//             ->select('vouchers.*') // nếu cần thêm status thì thêm các field từ vouchers_users
//             ->get();
//         return response()->json($vouchers);
//     }


public function getUserVouchers()
{
    $userId = Auth::id();
    $now = now();

    return DB::table('vouchers_users')
        ->join('vouchers', 'vouchers_users.voucher_id', '=', 'vouchers.id')
        ->where('vouchers_users.user_id', $userId)
        ->where('vouchers_users.status', 'available')
        ->where('vouchers_users.is_used', 'unused') // ⚠️ sửa lại chỗ này
        ->where(function ($query) use ($now) {
            $query->whereNull('vouchers_users.start_date')
                  ->orWhere('vouchers_users.start_date', '<=', $now);
        })
        ->where(function ($query) use ($now) {
            $query->whereNull('vouchers_users.end_date')
                  ->orWhere('vouchers_users.end_date', '>=', $now);
        })
        ->where('vouchers.status', 'active') // ⚠️ sửa luôn
        ->select('vouchers.*')
        ->get();
}
    public function deleteSelected(Request $request)
    {
        $ids = $request->input('ids', []);
        $userId = auth()->id();

        // Xóa cart item
        Cart::where('user_id', $userId)->whereIn('id', $ids)->delete();

        // Lấy lại các cart item còn lại sau khi xóa
        $remainingItems = Cart::where('user_id', $userId)->get();

        $subtotal = $remainingItems->sum(function ($item) {
            return $item->quantity * $item->price_at_time;
        });

        $voucherRemoved = false;

        // Kiểm tra lại điều kiện voucher
        if (session()->has('voucher_code')) {
            $voucher = DB::table('vouchers')
                ->where('code', session('voucher_code'))
                ->where('status', 'active')
                ->first();

            if (!$voucher || ($voucher->min_order_value && $subtotal < $voucher->min_order_value)) {
                session()->forget(['voucher_code', 'voucher_discount']);
                $voucherRemoved = true;
            }
        }

        return response()->json([
            'success' => true,
            'voucher_removed' => $voucherRemoved,
        ]);
    }


    public function updateQuantity(Request $request)
    {
        try {
            $cartItem = Cart::with('productVariant')->findOrFail($request->id);
            $variant = $cartItem->productVariant;

            if ($request->action === 'increase') {

                // Nếu là flash_sale
                if ($cartItem->flash_sale_items_id) {
                    $flashSaleItem = FlashSaleItem::find($cartItem->flash_sale_items_id);

                    if (!$flashSaleItem) {
                        return response()->json([
                            'success' => false,
                            'message' => 'Sản phẩm Flash Sale không tồn tại.'
                        ]);
                    }

                    // Tính số lượng còn lại của Flash Sale
                    $available = $flashSaleItem->max_quantity;

                    if ($cartItem->quantity >= $available) {
                        return response()->json([
                            'success' => false,
                            'message' => 'Không thể tăng vượt quá số lượng Flash Sale còn lại.'
                        ]);
                    }
                } else {
                    // Sản phẩm thường: check tồn kho
                    if ($cartItem->quantity >= $variant->stock) {
                        return response()->json([
                            'success' => false,
                            'message' => 'Không thể tăng vượt quá tồn kho.'
                        ]);
                    }
                }

                $cartItem->quantity += 1;
            } elseif ($request->action === 'decrease') {
                if ($cartItem->quantity > 1) {
                    $cartItem->quantity -= 1;
                }
            }

            $cartItem->save();

            // Tính lại
            $subtotal = Cart::where('user_id', Auth::id())->sum(DB::raw('quantity * price_at_time'));
            $voucherDiscount = session('voucher_discount', 0);
            $total = $subtotal - $voucherDiscount;

            return response()->json([
                'success' => true,
                'quantity' => $cartItem->quantity,
                'item_total' => number_format($cartItem->quantity * $cartItem->price_at_time, 0, ',', '.') . ' đ',
                'subtotal' => number_format($subtotal, 0, ',', '.') . ' đ',
                'total' => number_format($total, 0, ',', '.') . ' đ',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Lỗi hệ thống: ' . $e->getMessage(),
            ], 500);
        }
    }


    public function calculateTotal(Request $request)
    {
        $cartItems = Cart::where('user_id', Auth::id())->get();
        $subtotal = $cartItems->sum(function ($item) {
            return $item->quantity * $item->price_at_time;
        });

        $voucherDiscount = session('voucher_discount', 0);
        $total = $subtotal - $voucherDiscount;

        return response()->json([
            'subtotal' => number_format($subtotal, 0, ',', '.') . ' đ',
            'total' => number_format($total, 0, ',', '.') . ' đ'
        ]);
        
    }
  public function applyVoucher(Request $request)
    {
        $request->validate([
            'code' => 'required|string'
        ]);

        $userId = Auth::id();
        $now = now();


        $voucher = VoucherUser::join('vouchers', 'vouchers_users.voucher_id', 'vouchers.id')
            ->where('code', $request->code)->where('is_used', 'unused')->first();
        // dd($voucher1);
        if (!$voucher) {
            return redirect()->back()->with('error', 'Mã giảm giá không hợp lệ hoặc đã sử dụng.');
        }

        if (($voucher->start_date && $now->lt($voucher->start_date)) ||
            ($voucher->end_date && $now->gt($voucher->end_date))
        ) {
            return redirect()->back()->with('error', 'Mã giảm giá đã hết hạn hoặc chưa đến thời gian sử dụng.');
        }

        if ($voucher->max_used !== null  && $voucher->used >= $voucher->max_used) {
            return redirect()->back()->with('error', 'Mã giảm giá đã được sử dụng hết lượt.');
        }
       

        $userHasVoucher = DB::table('vouchers_users')
            ->where('user_id', $userId)
            ->where('voucher_id', $voucher->id)
            ->where('status', 'available')
            ->exists();

        if (!$userHasVoucher) {
            return redirect()->back()->with('error', 'Bạn chưa nhận được mã giảm giá này.');
        }


        $selectedIds = session('cart_selected_ids', []);

        if (empty($selectedIds)) {
            return redirect()->back()->with('error', 'Vui lòng chọn sản phẩm để áp dụng mã giảm giá.');
        }

        $cartItems = Cart::where('user_id', $userId)
            ->whereIn('id', $selectedIds)
            ->get();

        if ($cartItems->isEmpty()) {
            return redirect()->back()->with('error', 'Không thể áp dụng mã vì không có sản phẩm hợp lệ được chọn.');
        }


        $subtotal = $cartItems->sum(function ($item) {
            return $item->quantity * $item->price_at_time;
        });


        if ($voucher->min_order_value && $subtotal < $voucher->min_order_value) {
            return redirect()->back()->with('error', 'Đơn hàng phải tối thiểu ' . number_format($voucher->min_order_value, 0, ',', '.') . ' đ để sử dụng mã này.');
        }


        $discount = 0;
        if ($voucher->type_discount === 'percent') {
            $discount = round($subtotal * ($voucher->value / 100));
            if ($voucher->max_discount && $discount > $voucher->max_discount) {
                $discount = $voucher->max_discount;
            }
        } else {
            $discount = $voucher->value;
        }


        session([
            'voucher_code' => $voucher->code,
            'voucher_discount' => $discount
        ]);

        // dd($voucher);


        return redirect()->back()->with('success', 'Áp dụng mã giảm giá thành công!');
    }

   public function add_to_cart($id, Request $request)
    {
    
       
   $request->validate([
        'size_id'   => 'required|exists:sizes,id',
        'color_id'  => 'required|exists:colors,id',
        'quantity'  => 'required|integer|min:1',
    ], [
        'color_id.required' => 'Bạn chưa chọn màu',
            'color_id.exists' => 'Không có màu này',
            'size_id.required' => 'Bạn chưa chọn size',
            'size_id.exists' => 'Không có size này',
            'quantity.required' => 'Bạn phải chọn số lượng',
            'quantity.integer' => 'Số lượng không hợp lệ',
            'quantity.min' => 'Số lượng sản phẩm tối thiểu phải là 1',
    ]);

  

        // Kiểm tra sản phẩm thường
        $product = Product::find($id);
        if (!$product) {
            return back()->with('error', 'Sản phẩm không tồn tại');
        }

        // Kiểm tra biến thể
        $variants = ProductVariant::where('product_id', $id)
            ->where('color_id', $request->color_id)
            ->where('size_id', $request->size_id)
            ->first();

        if (!$variants) {
            return back()->with('error', 'Sản phẩm này đã hết hàng hoặc không có, vui lòng thao tác lại');
        }

        // Kiểm tra tồn kho
        if ($variants->stock < $request->quantity) {
            return back()->with('error', "Số lượng sản phẩm tồn kho chỉ còn $variants->stock");
        }

        $user_id = auth()->id();
        $items_cart = Cart::where('user_id', $user_id)
            ->where('product_variants_id', $variants->id)
            ->whereNull('flash_sale_items_id') // phân biệt sản phẩm thường
            ->first();

        $quantity_in_db = $items_cart->quantity ?? 0;
        $new_quantity = $request->quantity + $quantity_in_db;

        if ($new_quantity > $variants->stock) {
            return back()->with('error', 'Số lượng sản phẩm tồn kho không đủ, vui lòng kiểm tra lại');
        }

        if (!$items_cart) {
            Cart::create([
                'user_id' => $user_id,
                'product_variants_id' => $variants->id,
                'quantity' => $request->quantity,
                'price_at_time' => $variants->sale_price,
                'product_name' => $variants->name
            ]);
        } else {
            $items_cart->update([
                'quantity' => $items_cart->quantity + $request->quantity
            ]);
        }
// dd($request->all());

        return back()->with('success', 'Thêm thành công');
    }
}