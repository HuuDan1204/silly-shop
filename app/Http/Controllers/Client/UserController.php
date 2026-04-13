<?php

namespace App\Http\Controllers\Client;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;
use App\Models\Client\Address;
use App\Models\Admin\Order as AdminOrder;
use App\Models\Order;

class UserController extends Controller
{
    /**
     * Trang Hồ sơ cá nhân
     */
    public function index()
    {
        $user = Auth::user();

        // Lấy địa chỉ từ bảng address_books
        $addresses = Address::where('user_id', $user->id)->get();

        // Lấy 10 đơn hàng mới nhất
        $orders = AdminOrder::where('user_id', $user->id)
                       ->latest()
                       ->take(10)
                       ->get();

        // Lấy voucher của user (dùng bảng trung gian vouchers_users)
        $vouchers = DB::table('vouchers_users')
            ->join('vouchers', 'vouchers.id', '=', 'vouchers_users.voucher_id')
            ->where('vouchers_users.user_id', $user->id)
            ->where(function ($query) {
                $query->whereNull('vouchers.end_date')
                      ->orWhere('vouchers.end_date', '>=', now());
            })
            ->select('vouchers.*')
            ->get();

        return view('shop.user', compact('user', 'addresses', 'orders', 'vouchers'));
    }

    /**
     * Cập nhật thông tin cá nhân
     */
  public function update(Request $request)
    {
        $request->validate([
            'name'            => 'required|string|max:255',
            'default_phone'   => 'nullable|string|max:20',
            'default_address' => 'nullable|string|max:500',
        ]);

        $user = Auth::user();

        $user->update([
            'name'            => $request->name,
            'default_phone'   => $request->default_phone,
            'default_address' => $request->default_address,
        ]);

        // Nếu có upload avatar trong cùng form (tùy chọn)
        if ($request->hasFile('avatar')) {
            if ($user->avatar && Storage::disk('public')->exists($user->avatar)) {
                Storage::disk('public')->delete($user->avatar);
            }

            $path = $request->file('avatar')->store('avatars', 'public');
            $user->update(['avatar' => $path]);
        }

        return redirect()->back()->with('success', 'Cập nhật thông tin thành công!');
    }

    /**
     * Upload Avatar
     */
    public function updateAvatar(Request $request)
    {
        $request->validate([
            'avatar' => 'required|image|mimes:jpeg,png,jpg,gif,webp|max:2048',
        ]);

        $user = Auth::user();

        // Xóa avatar cũ nếu có
        if ($user->avatar && Storage::disk('public')->exists($user->avatar)) {
            Storage::disk('public')->delete($user->avatar);
        }

        $path = $request->file('avatar')->store('avatars', 'public');

        $user->update(['avatar' => $path]);

        return response()->json([
            'success' => true,
            'url'     => asset('storage/' . $path)
        ]);
    }
}