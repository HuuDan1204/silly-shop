<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\AdsRequest;
use App\Http\Requests\VoucherRequest;
use App\Models\Admin\CategoryVoucher;
use App\Models\Admin\Voucher;
use App\Models\Admin\VoucherUser;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;

class VoucherController extends Controller
{
     public function index($id, Request $request)
    {
        $action = $request->query('type');
        $name_voucher = CategoryVoucher::all();
        $title = CategoryVoucher::where('slug', $id)->first();
        if ($title) {
            $type = $title->name;
        }
        if (!$title) {
            abort(403, 'Không tìm thấy trang này');
        } else if ($action) {
            $data_voucher = Voucher::with('cate_Voucher')->where('category_id', $title->id)->Where('status', $action)->paginate(5);
        } else {
            $data_voucher = Voucher::with('cate_Voucher')->where('category_id', $title->id)->paginate(5);
        }
        return view('dashboard.voucher.index', compact('type', 'name_voucher', 'id', 'data_voucher'));
    }
    public function store(VoucherRequest $voucherRequest)
    {
        $action = $voucherRequest->query('action');
        $data = $voucherRequest->validated();
        $data['code'] = strtoupper($data['code']);
        if ($voucherRequest->hasFile('image')) {
            $file = $voucherRequest->file('image');
            $filename = time() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/Voucher'), $filename);
            $data['image'] = 'uploads/Voucher/' . $filename;
        } else {
            $data['image'] = null;
        }
        if ($data['type_discount'] == "value") {
            $data['max_discount'] = 0;
        }
        // VoucherHistory::create([
        //     voucher_id
        //     	user_id
        //         user_name
        //         	from_status
        //             	to_status
        //                 	note
        //                     	time_action

        // ]);
        Voucher::create($data);
        return redirect()->back();
    }
    public function detail($action, $id)
    {
        $categories = CategoryVoucher::all();
        // dd($categories);
        $data_voucher = Voucher::with('cate_Voucher')->where('id', $id)->first();
        if (!$data_voucher) {
            abort(403, 'Không thấy');
        }
        return view('dashboard.voucher.detail', compact('data_voucher', 'action', 'categories'));
    }

public function update(VoucherRequest $request, $id)
{
    $data_voucher = Voucher::findOrFail($id);

    if ($data_voucher->status === 'active') {
        $data = Arr ::only($request->validated(), ['end_date', 'max_used']);
    } else {
        $data = $request->validated();
        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $filename = time() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/Voucher'), $filename);
            $data['image'] = 'uploads/Voucher/' . $filename;
        } else {
            $data['image'] = $data_voucher->image;
        }

        if (isset($data['type_discount']) && $data['type_discount'] === "value") {
            $data['max_discount'] = 0;
        }
    }

    $data_voucher->update($data);

    return redirect()->back()->with('success', 'Cập nhật thành công');
}

  public function ads(AdsRequest $request)
    {
        $data = $request->validated();
        CategoryVoucher::create($data);
        return redirect()->back();
    }
    public function disable($id)
    {
        $data = Voucher::findOrFail($id);
        if ($data->status !== 'active') {
            abort(403, 'Không thể làm hành động này');
        }
        $data->update(['status' => 'disabled']);
        return redirect()->back();
    }
    public function active($id)
    {
        $data = Voucher::findOrFail($id);
        $result = Voucher::where('block', $data->block)->where('status', 'active')->first();
        if ($result) {
            return redirect()->back()->with('error', "Voucher {$result->code} đang hoạt động ở khu vực này");
        }
        if ($data->status !== 'draft') {
            abort(403, 'Không thể làm hành động này');
        }
        if (!$data->block) {
            return redirect()->back()->with('error', 'Vui lòng chọn nơi hiển thị cho voucher này');
        }
        if ($data->block == 1 || $data->block == 2) {
            if (!$data->image) {
                return redirect()->back()->with('error', 'Bắt buộc phải có ảnh đại diện cho khu vực 1 và 2');
            }
        }
        if ($data->start_date > now()) {
            return redirect()->back()->with('error', 'Chưa tới thời gian có thể khởi động');
        }
        $data->update(['status' => 'active']);
        return redirect()->back();
    }
    public function accept_voucher($id)
    {
        
        $user_id = Auth::id();
        $voucher = Voucher::find($id);
        if (!$voucher) {
            return redirect()->back()->with('error', 'Voucher này không tồn tại vui lòng thử lại sau');
        }
        if ($voucher->status != 'active') {
            return redirect()->back()->with('error', 'Voucher này chưa phát hành');
        }
        $voucher_user = VoucherUser::where('voucher_id', $id)->where('user_id', $user_id)->exists();
        if ($voucher_user) {
            return redirect()->back()->with('error', 'Bạn đã có voucher này');
        }
        if ($voucher->max_used == 0) {
            return redirect()->back()->with('error', 'Voucher này đã hết lượt nhận. Cảm ơn bạn đã quan tâm! Hãy đón chờ nhiều ưu đãi mới từ chúng tôi trong thời gian tới');
        }
        VoucherUser::create([
            'user_id' => $user_id,
            'voucher_id' => $id,
            'start_date' => $voucher->start_date,
            'end_date' => $voucher->end_date
        ]);
        $voucher->update([
            'max_used' => $voucher->max_used - 1,
            'received' => $voucher->received + 1
        ]);
        return redirect()->back()->with('success', 'Nhận thành công');
    }
    public function delete($id)
    {
        $data_voucher = Voucher::find($id);
        $data = Voucher::join('categories_Voucher', 'Voucher.category_id', 'categories_Voucher.id')->where('Voucher.id', $id)->first();
        // dd($data);
        if (!$data_voucher) {
            return redirect()->back()->with('error', 'Không tìm thấy voucher này');
        }
        if($data_voucher->status != 'save' && $data_voucher->status != 'draft'){
            return redirect()->back()->with('error', 'Bạn chỉ có thể xóa voucher này khi nó chưa phát hành hoặc đã lưu trữ');
        }
        if (!$data) {
            return abort(403, 'Không hợp lệ');
        }
        // if ($data_voucher->status != 'draft') {
        //     return redirect()->back()->with('error', 'Bạn chỉ có thể xóa voucher này khi nó chưa phát hành');
        // }

        $data_voucher->forceDelete();
        return redirect(url("dashboard/voucher/$data->slug"))->with('success', 'Xóa thành công');
    }
    public function restore($id)
    {
        $voucher = Voucher::where('id', $id)->first();
        if (!$voucher) {
            return redirect()->back()->with('error', 'Voucher không tồn tại');
        }
        // dd($voucher);

        if ($voucher->status != 'save') {
            return redirect()->back()->with('error', 'Voucher này không thể phát hành lại');
        }
        // dd($voucher);

        if ($voucher->created_at > now()->subDays(30)) {
            return redirect()->back()->with('error', 'Chỉ có thể khôi phục lại sau 30 ngày');
        }
        // dd( $voucher );
        VoucherUser::where('voucher_id', $id)->delete();
        $voucher->update(['status' => 'draft']);
        return redirect()->back()->with('success', 'Phát hành lại voucher thành công');
    }

}
