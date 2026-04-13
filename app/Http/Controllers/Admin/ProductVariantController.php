<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\Color;
use App\Models\Admin\Product;
use App\Models\Admin\ProductVariant;
use App\Models\Admin\Size;
use Illuminate\Http\Request;

class ProductVariantController extends Controller
{
    // ==================== DANH SÁCH BIẾN THỂ ====================
    public function index(Request $request)
    {
        $productId = $request->query('product_id');
        $keyword   = $request->query('keyword');
        $colorId   = $request->query('color_id');
        $sizeId    = $request->query('size_id');
        $status    = $request->query('status');

        $query = ProductVariant::query()->with(['product', 'color', 'size']);

        // Lọc theo sản phẩm
        if ($productId) {
            $query->where('product_id', $productId);
        }

        // Tìm kiếm theo tên biến thể
        if ($keyword) {
            $query->where('name', 'LIKE', "%$keyword%");
        }

        // Lọc theo màu
        if ($colorId) {
            $query->where('color_id', $colorId);
        }

        // Lọc theo size
        if ($sizeId) {
            $query->where('size_id', $sizeId);
        }

        // Lọc theo trạng thái
        if ($status === 'deleted') {
            $variants = $query->onlyTrashed()->paginate(15);
        } elseif ($status === 'all') {
            $variants = $query->withTrashed()->paginate(15);
        } else {
            $variants = $query->paginate(15);
        }

        $colors = Color::all();
        $sizes  = Size::all();

        return view('dashboard.pages.variants.index', compact('variants', 'colors', 'sizes', 'status'));
    }

    // ==================== FORM THÊM BIẾN THỂ ====================
    public function create()
    {
        $products = Product::all();
        $colors   = Color::all();
        $sizes    = Size::all();

        return view('dashboard.pages.variants.create', compact('products', 'colors', 'sizes'));
    }

    // ==================== LƯU BIẾN THỂ ====================
    public function store(Request $request)
    {
        $request->validate([
            'product_id' => 'required|exists:products,id',
            'variants' => 'required|array|min:1',
            'variants.*.size_id' => 'required|exists:sizes,id',
            'variants.*.color_id' => 'required|exists:colors,id',
            'variants.*.import_price' => 'required|numeric|min:0',
            'variants.*.listed_price' => 'required|numeric|min:0',
            'variants.*.sale_price' => 'nullable|numeric|min:0|lte:variants.*.listed_price',
            'variants.*.stock' => 'required|integer|min:0',
            'variants.*.variant_image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        $product = Product::findOrFail($request->product_id);

        foreach ($request->variants as $variantData) {
            // Kiểm tra trùng biến thể
            $exists = ProductVariant::where('product_id', $request->product_id)
                ->where('size_id', $variantData['size_id'])
                ->where('color_id', $variantData['color_id'])
                ->exists();

            if ($exists) {
                $size = Size::find($variantData['size_id']);
                $color = Color::find($variantData['color_id']);
                return back()->withErrors([
                    'error' => 'Biến thể ' . $product->name . ' - ' . $color->color_name . ' - ' . $size->size_name . ' đã tồn tại!'
                ])->withInput();
            }

            // Xử lý ảnh
            $imagePath = null;
            if (isset($variantData['variant_image'])) {
                $image = $variantData['variant_image'];
                $imageName = time() . '_' . uniqid() . '.' . $image->getClientOriginalExtension();
                $image->move(public_path('uploads/product_variants'), $imageName);
                $imagePath = 'uploads/product_variants/' . $imageName;
            }

            $size = Size::find($variantData['size_id']);
            $color = Color::find($variantData['color_id']);

            $variantName = $product->name . ' - ' . $color->color_name . ' - ' . $size->size_name;

            ProductVariant::create([
                'product_id'        => $request->product_id,
                'size_id'           => $variantData['size_id'],
                'color_id'          => $variantData['color_id'],
                'name'              => $variantName,
                'variant_image_url' => $imagePath,
                'import_price'      => $variantData['import_price'],
                'listed_price'      => $variantData['listed_price'],
                'sale_price'        => $variantData['sale_price'] ?? 0,
                'stock'             => $variantData['stock'],
                'initial_stock'     => $variantData['stock'],
            ]);
        }
dd($request->all());
        return redirect()->route('variants.index')
                         ->with('success', 'Thêm biến thể thành công!');
    }

    // ==================== SỬA BIẾN THỂ ====================
    public function edit($id)
    {
        $variant = ProductVariant::findOrFail($id);
        $colors  = Color::all();
        $sizes   = Size::all();

        return view('dashboard.pages.variants.edit', compact('variant', 'colors', 'sizes'));
    }

 public function update(Request $request, $id)
    {

        $variant = ProductVariant::findOrFail($id);

        $request->validate([
            'name' => 'required|string|max:255|unique:product_variants,name,' . $id,
            'color_id' => 'required|integer|exists:colors,id',
            'size_id' => 'required|integer|exists:sizes,id',
            'import_price' => 'required|numeric|min:0|max:99999999.99',
            'listed_price' => 'required|numeric|min:0|max:99999999.99',
            'sale_price' => 'required|numeric|min:0|max:99999999.99|lte:listed_price',
            'stock' => 'required|integer|min:0',
            'variant_image_url' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
            'is_show' => 'nullable|boolean',
        ], [
            'name.required' => 'Tên biến thể không được để trống.',
            'name.string' => 'Tên biến thể phải là chuỗi ký tự.',
            'name.max' => 'Tên biến thể không được vượt quá 255 ký tự.',
            'name.unique' => 'Tên biến thể đã tồn tại.',

            'color_id.required' => 'Bạn phải chọn màu.',
            'color_id.integer' => 'Màu không hợp lệ.',
            'color_id.exists' => 'Màu được chọn không tồn tại.',

            'size_id.required' => 'Bạn phải chọn size.',
            'size_id.integer' => 'Size không hợp lệ.',
            'size_id.exists' => 'Size được chọn không tồn tại.',

            'import_price.required' => 'Giá nhập không được để trống.',
            'import_price.numeric' => 'Giá nhập phải là số.',
            'import_price.min' => 'Giá nhập không được nhỏ hơn 0.',

            'listed_price.required' => 'Giá niêm yết không được để trống.',
            'listed_price.numeric' => 'Giá niêm yết phải là số.',
            'listed_price.min' => 'Giá niêm yết không được nhỏ hơn 0.',

            'sale_price.required' => 'Giá bán không được để trống.',
            'sale_price.numeric' => 'Giá bán phải là số.',
            'sale_price.min' => 'Giá bán không được nhỏ hơn 0.',
            'sale_price.lte' => 'Giá bán phải nhỏ hơn hoặc bằng giá niêm yết.',

            'stock.required' => 'Số lượng kho không được để trống.',
            'stock.integer' => 'Số lượng kho phải là số nguyên.',
            'stock.min' => 'Số lượng kho không được nhỏ hơn 0.',

            'variant_image_url.image' => 'Ảnh phải là file ảnh hợp lệ.',
            'variant_image_url.mimes' => 'Ảnh chỉ được chấp nhận định dạng jpg, jpeg, png, webp.',
            'variant_image_url.max' => 'Kích thước ảnh không được vượt quá 2MB.',
            'import_price.max' => 'Giá nhập không được vượt quá 99,999,999.99.',
            'listed_price.max' => 'Giá niêm yết không được vượt quá 99,999,999.99.',
            'sale_price.max' => 'Giá bán không được vượt quá 99,999,999.99.',
            'is_show.boolean' => 'Trạng thái hiển thị không hợp lệ.',
        ]);

        $data = $request->only([
            'name',
            'color_id',
            'size_id',
            'import_price',
            'listed_price',
            'sale_price',
            'stock',
            'is_show'
        ]);
        $data['is_show'] = $request->has('is_show') ? 1 : 0;

        if ($request->hasFile('variant_image_url')) {
            $file = $request->file('variant_image_url');
            $filename = time() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/variants'), $filename);
            $data['variant_image_url'] = 'uploads/variants/' . $filename;
        }

        $variant->update($data);

        return redirect()->route('dashboard.variants.index')->with('success', 'Cập nhật biến thể thành công!');
    }

    // ==================== XÓA BIẾN THỂ ====================
    public function destroy($id)
    {
        $variant = ProductVariant::findOrFail($id);
        if ($variant->use_flash_sale == 1) {
            $variant->update(['use_flash_sale' => 0]);
        }
        $variant->delete();

        return redirect()->route('variants.index')->with('success', 'Xóa biến thể thành công!');
    }

    // public function restore($id)
    // {
    //     $variant = ProductVariant::withTrashed()->findOrFail($id);
    //     $variant->restore();
    //     return redirect()->route('variants.index')->with('success', 'Khôi phục biến thể thành công!');
    // }

    // public function forceDelete($id)
    // {
    //     $variant = ProductVariant::onlyTrashed()->findOrFail($id);
    //     $variant->forceDelete();
    //     return back()->with('success', 'Xóa vĩnh viễn biến thể thành công.');
    // }
}