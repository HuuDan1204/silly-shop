<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use App\Models\Client\Cart;
use App\Models\Client\Order;
use App\Models\Client\OrderItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

class OrderController extends Controller
{
 public function checkout()
{
    $userId = Auth::id();

    $selectedIds = session('cart_selected_ids', []);

    if (empty($selectedIds)) {
        return redirect()->route('cart.index')
            ->with('error', 'Vui lòng chọn sản phẩm trước khi thanh toán');
    }

    $cartItems = Cart::with(['productVariant.product', 'productVariant.color', 'productVariant.size'])
        ->where('user_id', $userId)
        ->whereIn('id', $selectedIds)
        ->get();

    if ($cartItems->isEmpty()) {
        return redirect()->route('cart.index')
            ->with('error', 'Giỏ hàng của bạn đang trống!');
    }

    // 🔥 Tổng tiền
    $subtotal = $cartItems->sum(fn($item) => $item->quantity * $item->price_at_time);

    // 🔥 Lấy voucher từ session
    $voucher = session('voucher');
    $discount = session('voucher_discount', 0);
    // 🔥 Phí ship
    $shipping_fee = 30000;

    // 🔥 Tổng cuối
    $total = $subtotal - $discount + $shipping_fee;
// dd(session()->all());
    return view('shop.checkout', compact(
        'cartItems',
        'subtotal',
        'shipping_fee',
        'voucher',
        'discount',
        'total'
    ));
}

public function processCheckout(Request $request)
{
    $request->validate([
        'name'           => 'required|string|max:255',
        'phone'          => 'required|string|min:10|max:15',
        'address'        => 'required|string|min:5',
        'province_code'  => 'required|exists:provinces,province_code',
        'ward_code'      => 'required|exists:wards,ward_code',
        'payment_method' => 'required|in:cash,bank_transfer',
        'notes'          => 'nullable|string|max:500',
    ]);

    $userId = Auth::id();
    $selectedIds = session('cart_selected_ids', []);

    if (empty($selectedIds)) {
        return back()->with('error', 'Vui lòng chọn sản phẩm để thanh toán');
    }

    DB::beginTransaction();

    try {
        $cartItems = Cart::with(['productVariant.product', 'productVariant.color', 'productVariant.size'])
            ->where('user_id', $userId)
            ->whereIn('id', $selectedIds)
            ->lockForUpdate()
            ->get();

        if ($cartItems->isEmpty()) {
            throw new \Exception('Không có sản phẩm nào hợp lệ');
        }

        // Kiểm tra tồn kho
        foreach ($cartItems as $item) {
            $variant = $item->productVariant;
            if (!$variant || $variant->stock < $item->quantity) {
                throw new \Exception("{$item->product_name} chỉ còn {$variant->stock} sản phẩm");
            }
        }

        // // Trừ tồn kho
        // foreach ($cartItems as $item) {
        //     $item->productVariant->decrement('stock', $item->quantity);
        // }
$voucherCode = session('voucher_code');

$voucher = null;
if ($voucherCode) {
    $voucher = DB::table('vouchers')
        ->where('code', $voucherCode)
        ->first();
}
      $subtotal = $cartItems->sum(fn($item) => $item->quantity * $item->price_at_time);
$shipping_fee = 30000;

// 🔥 lấy discount từ session
$discount = session('voucher_discount', 0);

// 🔥 tính lại tổng tiền
$final_amount = $subtotal - $discount + $shipping_fee;

        $order = Order::create([
    'user_id'         => $userId,
    'code_order'      => 'ORD-' . strtoupper(Str::random(8)),
    'name'            => $request->name,
    'phone'           => $request->phone,
    'address'         => $request->address,
    'province_code'   => $request->province_code,
    'ward_code'       => $request->ward_code,

    // 🔥 Voucher snapshot
    'voucher_id' => $voucher->id ?? null,
    'voucher_code_snapshot' => $voucher->code ?? null,
    'voucher_type_discount_snapshot' => $voucher->type_discount ?? null,
    'voucher_value_snapshot' => $voucher->value ?? null,
    'voucher_max_discount_snapshot' => $voucher->max_discount ?? null,
    'voucher_min_order_value_snapshot' => $voucher->min_order_value ?? null,

    // 🔥 Tiền
    'total_amount'    => $subtotal,
    'discount_amount' => $discount,
    'shipping_fee'    => $shipping_fee,
    'final_amount'    => $final_amount,

    'shipping_method' => 'basic',
    'pay_method'      => $request->payment_method === 'cash' ? 'COD' : 'VNPAY',
    'status_pay'      => 'unpaid',
    'status'          => 'pending',
    'notes'           => $request->notes,
]);

        foreach ($cartItems as $item) {
            $variant = $item->productVariant;
            OrderItem::create([
                'order_id'           => $order->id,
                'product_variant_id' => $variant->id,
                'product_id'         => $variant->product_id,
                'product_name'       => $item->product_name,
                'product_image_url'  => $variant->variant_image_url ?? '',
                'sale_price'         => $item->price_at_time,
                'listed_price' => $variant->listed_price ?? $item->price_at_time,
                'import_price' => $variant->import_price ?? 0,
                'quantity'           => $item->quantity,
                'size_name'          => optional($variant->size)->size_name,
                'color_name'         => optional($variant->color)->color_name,
            ]);
        }

        // // Xóa giỏ hàng đã chọn
        // Cart::where('user_id', $userId)
        //     ->whereIn('id', $selectedIds)
        //     ->delete();

        // session()->forget(['cart_selected_ids']);

        DB::commit();

        // ==================== QUYẾT ĐỊNH ĐIỀU HƯỚNG ====================
        if ($request->payment_method === 'cash') {

    // ✅ COD: xử lý luôn

    foreach ($cartItems as $item) {
        $item->productVariant->decrement('stock', $item->quantity);
    }

  Cart::where('user_id', $userId)
    ->whereIn('id', $selectedIds)
    ->delete();

session()->forget([
    'cart_selected_ids',
    'voucher_code',
    'voucher_discount'
]);

    DB::commit();

    return redirect()->route('home')
        ->with('success', 'Đặt hàng thành công! Mã đơn: ' . $order->code_order);

} else {

   

    session([
        'pending_order_id' => $order->id,
        'pending_cart_ids' => $selectedIds
    ]);

    DB::commit();

    $paymentUrl = $this->createVnpayPaymentUrl($order, $final_amount);
    return redirect($paymentUrl);
}

    } catch (\Exception $e) {
        DB::rollBack();
        return back()->with('error', 'Đặt hàng thất bại: ' . $e->getMessage());
    }
}

    /**
     * Tạo URL thanh toán VNPay
     */
  private function createVnpayPaymentUrl($order, $amount)
    {
        $environment = Config::get('vnpay.environment', 'test');
        $config = Config::get("vnpay.{$environment}");

        $vnp_TmnCode = $config['tmn_code'];
        $vnp_HashSecret = $config['hash_secret'];
        $vnp_Url = $config['url'];

        // Sử dụng domain thực tế thay vì localhost
      $vnp_Returnurl = $config['return_url'];

        // Nếu đang ở localhost, thử sử dụng IP thực tế
        if (strpos($vnp_Returnurl, 'localhost') !== false || strpos($vnp_Returnurl, '127.0.0.1') !== false) {
            // Thử lấy IP thực tế
            $serverIP = $_SERVER['SERVER_ADDR'] ?? $_SERVER['LOCAL_ADDR'] ?? '127.0.0.1';
            $serverPort = $_SERVER['SERVER_PORT'] ?? '80';
            $protocol = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? 'https' : 'http';

            if ($serverIP !== '127.0.0.1' && $serverIP !== '::1') {
                $vnp_Returnurl = $protocol . '://' . $serverIP . ':' . $serverPort . '/checkout';
            }
        }

        $vnp_TxnRef = $order->code_order;
        $vnp_OrderInfo = 'Thanh toán đơn hàng ' . $order->code_order;
        $vnp_OrderType = 'other'; // Thay đổi về 'other' thay vì 'billpayment'
        $vnp_Amount = $amount * 100; // VNPAY yêu cầu amount * 100
        $vnp_Locale = 'vn';
        $vnp_IpAddr = request()->ip();
        $vnp_CreateDate = date('YmdHis');
        $vnp_ExpireDate = date('YmdHis', strtotime('+15 minutes')); // Thời gian hết hạn

        $inputData = array(
            "vnp_Version" => "2.1.0",
            "vnp_TmnCode" => $vnp_TmnCode,
            "vnp_Amount" => $vnp_Amount,
            "vnp_Command" => "pay",
            "vnp_CreateDate" => $vnp_CreateDate,
            "vnp_CurrCode" => "VND",
            "vnp_IpAddr" => $vnp_IpAddr,
            "vnp_Locale" => $vnp_Locale,
            "vnp_OrderInfo" => $vnp_OrderInfo,
            "vnp_OrderType" => $vnp_OrderType,
            "vnp_ReturnUrl" => $vnp_Returnurl,
            "vnp_TxnRef" => $vnp_TxnRef,
            "vnp_ExpireDate" => $vnp_ExpireDate,
        );

        ksort($inputData);
        $query = "";
        $i = 0;
        $hashdata = "";
        foreach ($inputData as $key => $value) {
            if ($i == 1) {
                $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
            } else {
                $hashdata .= urlencode($key) . "=" . urlencode($value);
                $i = 1;
            }
            $query .= urlencode($key) . "=" . urlencode($value) . '&';
        }

        $vnp_Url = $vnp_Url . "?" . $query;
        if (isset($vnp_HashSecret)) {
            $vnpSecureHash = hash_hmac('sha512', $hashdata, $vnp_HashSecret);
            $vnp_Url .= 'vnp_SecureHash=' . $vnpSecureHash;
        }

        return $vnp_Url;
    }
public function vnpayReturn(Request $request)
{
    $result = $this->verifyVnpayPayment($request);

    $orderCode = $request->vnp_TxnRef;

    $order = Order::where('code_order', $orderCode)->first();

    if (!$order) {
        return redirect()->route('home')->with('error', 'Không tìm thấy đơn hàng');
    }

    if ($result['success']) {

        $order->update([
            'status_pay' => 'paid',
            'status' => 'confirmed'
        ]);

        $cartIds = session('pending_cart_ids', []);

        $cartItems = Cart::whereIn('id', $cartIds)->get();

        foreach ($cartItems as $item) {
            $item->productVariant->decrement('stock', $item->quantity);
        }

        Cart::whereIn('id', $cartIds)->delete();

        session()->forget([
            'pending_cart_ids',
            'pending_order_id',
            'voucher_code',
            'voucher_discount'
        ]);

        return redirect()->route('home')
            ->with('success', 'Thanh toán thành công!');
    }

    return redirect()->route('home')
        ->with('error', 'Thanh toán thất bại!');
}
    /**
     * Xác thực callback từ VNPAY
     */
    private function verifyVnpayPayment($request)
    {
        $environment = Config::get('vnpay.environment', 'test');
        $config = Config::get("vnpay.{$environment}");
        $vnp_HashSecret = $config['hash_secret'];

        $inputData = array();
        $data = $request->all();

        foreach ($data as $key => $value) {
            if (substr($key, 0, 4) == "vnp_") {
                $inputData[$key] = $value;
            }
        }

        $vnp_SecureHash = $inputData['vnp_SecureHash'] ?? '';
        unset($inputData['vnp_SecureHash']);
        ksort($inputData);
        $i = 0;
        $hashData = "";
        foreach ($inputData as $key => $value) {
            if ($i == 1) {
                $hashData = $hashData . '&' . urlencode($key) . "=" . urlencode($value);
            } else {
                $hashData = $hashData . urlencode($key) . "=" . urlencode($value);
                $i = 1;
            }
        }

        $secureHash = hash_hmac('sha512', $hashData, $vnp_HashSecret);

        $isValidSignature = ($vnp_SecureHash == $secureHash);
        $isSuccess = ($inputData['vnp_ResponseCode'] ?? '') == '00';

        return [
            'success' => $isValidSignature && $isSuccess,
            'data' => $inputData,
            'is_valid_signature' => $isValidSignature,
            'is_success' => $isSuccess,
            'calculated_hash' => $secureHash
        ];
    }

private function queryVnpayTransaction($orderCode)
    {
        $environment = Config::get('vnpay.environment', 'test');
        $config = Config::get("vnpay.{$environment}");

        $vnp_TmnCode = $config['tmn_code'];
        $vnp_HashSecret = $config['hash_secret'];
        $vnp_apiUrl = $config['api_url'];

        $vnp_RequestId = time() . "";
        $vnp_Version = Config::get('vnpay.version', '2.1.0');
        $vnp_Command = "querydr";
        $vnp_TxnRef = $orderCode;
        $vnp_OrderInfo = "Truy van GD:" . $orderCode;
        $vnp_TxnDate = date('YmdHis');

        $inputData = array(
            "vnp_RequestId" => $vnp_RequestId,
            "vnp_Version" => $vnp_Version,
            "vnp_Command" => $vnp_Command,
            "vnp_TmnCode" => $vnp_TmnCode,
            "vnp_TxnRef" => $vnp_TxnRef,
            "vnp_OrderInfo" => $vnp_OrderInfo,
            "vnp_TxnDate" => $vnp_TxnDate,
        );

        ksort($inputData);
        $query = "";
        $i = 0;
        $hashdata = "";
        foreach ($inputData as $key => $value) {
            if ($i == 1) {
                $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
            } else {
                $hashdata .= urlencode($key) . "=" . urlencode($value);
                $i = 1;
            }
            $query .= urlencode($key) . "=" . urlencode($value) . '&';
        }

        $vnp_Url = $vnp_apiUrl . "?" . $query;
        if (isset($vnp_HashSecret)) {
            $vnpSecureHash = hash_hmac('sha512', $hashdata, $vnp_HashSecret);
            $vnp_Url .= 'vnp_SecureHash=' . $vnpSecureHash;
        }

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $vnp_Url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);

        $response = curl_exec($ch);
        $error = curl_error($ch);
        curl_close($ch);

        return [
            'response' => $response,
            'error' => $error,
            'url' => $vnp_Url
        ];
    }
 public function vnpayIpn(Request $request)
    {
        // Xử lý IPN từ VNPAY
        Log::info('VNPAY IPN received', $request->all());

        // Thực hiện xác minh và xử lý IPN
        // Code xử lý IPN sẽ được thêm ở đây

        return response()->json(['RspCode' => '00', 'Message' => 'Confirmed']);
    }



}