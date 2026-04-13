<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\Order;
use App\Models\Admin\OrderHistory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class OrderControllerAdmin extends Controller
{
public function index(Request $request)
    {
        $status     = $request->get('status', 'all');
        $keyword    = $request->get('keyword');
        $payStatus  = $request->get('pay_status');

        $query = Order::query()
            ->with(['user', 'orderItems.productVariant']);   // không dùng .product nữa

        if ($status !== 'all') {
            $query->where('status', $status);
        }

        if ($payStatus) {
            $query->where('status_pay', $payStatus);
        }

        if ($keyword) {
            $query->where(function ($q) use ($keyword) {
                $q->where('code_order', 'like', "%$keyword%")
                  ->orWhere('name', 'like', "%$keyword%")
                  ->orWhere('phone', 'like', "%$keyword%")
                  ->orWhereHas('user', function ($u) use ($keyword) {
                      $u->where('name', 'like', "%$keyword%")
                        ->orWhere('email', 'like', "%$keyword%");
                  });
            });
        }

        $orders = $query->latest()->paginate(15)->appends(request()->query());

        $counts = [
            'all'       => Order::count(),
            'pending'   => Order::where('status', 'pending')->count(),
            'confirmed' => Order::where('status', 'confirmed')->count(),
            'shipping'  => Order::where('status', 'shipping')->count(),
            'delivered' => Order::where('status', 'delivered')->count(),
            'success'   => Order::where('status', 'success')->count(),
            'cancelled' => Order::where('status', 'cancelled')->count(),
            'failed'    => Order::where('status', 'failed')->count(),
        ];

        return view('dashboard.orders.index', compact('orders', 'status', 'counts', 'keyword', 'payStatus'));
    }

    public function show($id)
    {
        $order = Order::with([
            'user',
            'orderItems.productVariant',
            'orderItems.productVariant.color',
            'orderItems.productVariant.size',
            'addressBook',
            'voucher'
        ])->findOrFail($id);

        $histories = OrderHistory::where('order_id', $id)
            ->with('user')
            ->latest()
            ->get();

        return view('dashboard.orders.show', compact('order', 'histories'));
    }

    public function updateStatus(Request $request, $id)
    {
        $request->validate([
            'status' => 'required|in:pending,confirmed,shipping,delivered,success,cancelled,failed',
            'notes'  => 'nullable|string|max:500',
        ]);
        $order = Order::findOrFail($id);

        if (in_array($order->status, ['success', 'cancelled', 'failed'])) {
            return back()->with('error', 'Không thể thay đổi trạng thái của đơn hàng đã hoàn tất hoặc hủy.');
        }

        DB::beginTransaction();
        try {
            $oldStatus = $order->status;
            $order->status = $request->status;
            $order->save();

          OrderHistory::create([
    'order_id'     => $order->id,
    'from_status'  => $oldStatus,                    // từ trạng thái cũ
    'to_status'    => $request->status,              // đến trạng thái mới
    'note'         => $request->notes ?? "Admin thay đổi trạng thái từ {$oldStatus} sang {$request->status}",
    'users'        => auth()->id(),                  // cột là 'users' theo fillable
    'time_action'  => now(),                         // thêm thời gian hành động
    // 'content'   => có thể để null hoặc thêm nội dung nếu cần
]);
// dd($request->all());

            DB::commit();
            return back()->with('success', 'Cập nhật trạng thái đơn hàng thành công!');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', 'Có lỗi xảy ra: ' . $e->getMessage());
        }
    }
}