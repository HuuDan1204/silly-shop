<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\Category;      // giữ nguyên
use App\Models\Admin\Color;         // giữ nguyên
use App\Models\Admin\Product;       // giữ nguyên
use App\Models\Admin\Size;          // giữ nguyên
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;

class ProductController extends Controller
{

public function index(Request $request)
{
    $status = $request->get('status', 'active');
    $search = $request->get('keyword');
    $categoryId = $request->get('category_id');

    $query = Product::query()->with('category');

    // Phân theo status
    if ($status === 'trashed') {
        $query = Product::onlyTrashed()->with('category');
    } elseif ($status === 'all') {
        $query = Product::withTrashed()->with('category');
    }

    // Tìm kiếm
    if ($search) {
        $query->where(function ($q) use ($search) {
            $q->where('name', 'like', "%$search%")
              ->orWhere('slug', 'like', "%$search%");
        });
    }

    // Lọc danh mục
    if ($categoryId) {
        $query->where('category_id', $categoryId);
    }

    // Load thêm biến thể để đếm số lượng
    $products = $query->withCount('variants')   // <-- quan trọng
                      ->paginate(10)
                      ->appends(request()->query());

    // Đếm tổng
    $totalActive = Product::count();
    $totalTrashed = Product::onlyTrashed()->count();
    $totalAll = $totalActive + $totalTrashed;

    $categories = Category::all();

    return view('dashboard.products.index', compact(
        'products',
        'status',
        'totalActive',
        'totalTrashed',
        'totalAll',
        'categories'
    ));
}


public function create()
    {
        $categories = Category::all();
        $colors     = Color::all();
        $sizes      = Size::all();

        return view('dashboard.products.create', compact('categories', 'colors', 'sizes'));
    }
    public function uploadTempImage(Request $request)
    {
        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $filename = time() . '_' . $file->getClientOriginalName();
            $path = public_path('uploads/temp/' . $filename);

            $src = imagecreatefromstring(file_get_contents($file->getPathname()));
            $dst = imagecreatetruecolor(600, 765);
            imagecopyresampled($dst, $src, 0, 0, 0, 0, 600, 765, imagesx($src), imagesy($src));
            imagejpeg($dst, $path, 90);

            imagedestroy($src);
            imagedestroy($dst);

            return response()->json(['url' => asset('uploads/temp/' . $filename)]);
        }
        return response()->json(['url' => '']);
    }

    public function uploadTempVariantImage(Request $request)
    {
        if ($request->hasFile('variant_image')) {
            $file = $request->file('variant_image');
            $filename = time() . '_' . $file->getClientOriginalName();
            $path = public_path('uploads/temp/' . $filename);

            $src = imagecreatefromstring(file_get_contents($file->getPathname()));
            $dst = imagecreatetruecolor(600, 765);
            imagecopyresampled($dst, $src, 0, 0, 0, 0, 600, 765, imagesx($src), imagesy($src));
            imagejpeg($dst, $path, 90);

            imagedestroy($src);
            imagedestroy($dst);

            return response()->json(['url' => asset('uploads/temp/' . $filename)]);
        }
        return response()->json(['url' => '']);
    }
public function store(Request $request)
    {
        $request->validate([
        'name' => 'required|string|max:255|unique:products,name',
        'slug' => 'nullable|unique:products,slug',
        'category_id' => 'required|exists:categories,id',
        'description' => 'nullable|string',
        'temp_image_url' => 'nullable|string',

        'variants' => 'required|array|min:1',
        'variants.*.size_id' => 'required|exists:sizes,id',
        'variants.*.color_id' => 'required|exists:colors,id',
        'variants.*.import_price' => 'required|numeric|min:0',
        'variants.*.listed_price' => 'required|numeric|min:0',
        'variants.*.sale_price' => 'required|numeric|min:0|lte:variants.*.listed_price',
        'variants.*.stock' => 'required|integer|min:0',

        // Ảnh biến thể: tạm thời không required
        'variants.*.temp_variant_image_url' => 'nullable|string',
    ],
        [
            'name.required' => 'Vui lòng nhập tên sản phẩm.',
            'name.unique' => 'Tên sản phẩm đã tồn tại.',
            'slug.unique' => 'Slug đã tồn tại.',
            'category_id.required' => 'Vui lòng chọn danh mục.',
            'temp_image_url.required' => 'Vui lòng chọn ảnh sản phẩm.',

            'variants.required' => 'Vui lòng thêm ít nhất một biến thể.',
            'variants.*.size_id.required' => 'Vui lòng chọn size.',
            'variants.*.color_id.required' => 'Vui lòng chọn màu.',

            'variants.*.import_price.required' => 'Giá nhập không được để trống.',
            'variants.*.import_price.numeric' => 'Giá nhập phải là số.',
            'variants.*.import_price.min' => 'Giá nhập không được nhỏ hơn 0.',

            'variants.*.listed_price.required' => 'Giá niêm yết không được để trống.',
            'variants.*.listed_price.numeric' => 'Giá niêm yết phải là số.',
            'variants.*.listed_price.min' => 'Giá niêm yết không được nhỏ hơn 0.',

            'variants.*.sale_price.required' => 'Giá bán không được để trống.',
            'variants.*.sale_price.numeric' => 'Giá bán phải là số.',
            'variants.*.sale_price.min' => 'Giá bán không được nhỏ hơn 0.',
            'variants.*.sale_price.lte' => 'Giá bán phải nhỏ hơn hoặc bằng giá niêm yết.',

            'variants.*.stock.required' => 'Số lượng kho không được để trống.',
            'variants.*.stock.integer' => 'Số lượng kho phải là số nguyên.',
            'variants.*.stock.min' => 'Số lượng kho không được nhỏ hơn 0.',

            'variants.*.temp_variant_image_url.required' => 'Vui lòng chọn ảnh cho biến thể.',
    ]);
     $productImage = $request->temp_image_url;
        $variantImages = collect($request->variants)->pluck('temp_variant_image_url');

        if ($productImage && $variantImages->contains($productImage)) {
            return back()->withErrors([
                'temp_image_url' => 'Ảnh sản phẩm chính không được trùng với ảnh biến thể.'
            ])->withInput();
        }

        if ($variantImages->duplicates()->isNotEmpty()) {
            return back()->withErrors([
                'variants' => 'Các ảnh biến thể không được trùng nhau.'
            ])->withInput();
        }


        // Kiểm tra trùng size + color
        $combinations = [];
        $errors = [];
        foreach ($request->variants as $index => $variant) {
            $key = $variant['color_id'] . '-' . $variant['size_id'];
            if (in_array($key, $combinations)) {
                $errors["variants.$index.size_id"] = ['Size này đã bị trùng cho cùng một màu.'];
                $errors["variants.$index.color_id"] = ['Màu này đã bị trùng cho cùng một size.'];
            }
            $combinations[] = $key;
        }
        if (!empty($errors)) {
            throw ValidationException::withMessages($errors);
        }

        try {
            DB::beginTransaction();

            // Lưu ảnh sản phẩm chính
            $imagePath = null;
            if ($productImage) {
                $tempPath = public_path(parse_url($productImage, PHP_URL_PATH));
                if (file_exists($tempPath)) {
                    $filename = time() . '_' . basename($tempPath);
                    $img = imagecreatefromstring(file_get_contents($tempPath));
                    $resized = imagescale($img, 600, 765);
                    imagejpeg($resized, public_path('uploads/products/' . $filename), 90);
                    imagedestroy($img);
                    imagedestroy($resized);
                    unlink($tempPath);
                    $imagePath = 'uploads/products/' . $filename;
                }
            }

            $slug = Str::slug($request->slug ?: $request->name, '-');
            $product = Product::create([
                'name'        => $request->name,
                'description' => $request->description,
                'slug'        => $slug,
                
                'image_url'   => $imagePath,
                'category_id' => $request->category_id,
            ]);
// dd($product);
// dd($request->all());
            // Lưu biến thể
            foreach ($request->variants as $variantData) {
                $variantImagePath = null;
                if (!empty($variantData['temp_variant_image_url'])) {
                    $tempVariantPath = public_path(parse_url($variantData['temp_variant_image_url'], PHP_URL_PATH));
                    if (file_exists($tempVariantPath)) {
                        $variantFileName = time() . '_' . basename($tempVariantPath);
                        $img = imagecreatefromstring(file_get_contents($tempVariantPath));
                        $resized = imagescale($img, 600, 765);
                        imagejpeg($resized, public_path('uploads/product_variants/' . $variantFileName), 90);
                        imagedestroy($img);
                        imagedestroy($resized);
                        unlink($tempVariantPath);
                        $variantImagePath = 'uploads/product_variants/' . $variantFileName;
                    }
                }
                $color = Color::find($variantData['color_id']);
                $size = Size::find($variantData['size_id']);
                $variantName = $product->name . ' - ' . ($color->color_name ?? '') . ' - ' . ($size->size_name ?? '');

                $product->variants()->create([ 
                    'color_id'          => $variantData['color_id'],
                    'size_id'           => $variantData['size_id'],
                    'name'              => $variantName,
                    'variant_image_url' => $variantImagePath,
                    'import_price'      => $variantData['import_price'],
                    'listed_price'      => $variantData['listed_price'],
                    'sale_price'        => $variantData['sale_price'],
                    'stock'             => $variantData['stock'],
                    'initial_stock'     => $variantData['stock'],
                ]);
            }
// dd($request->all());    

            DB::commit();
            return redirect()->route('dashboard.products.index')->with('success', 'Thêm sản phẩm và biến thể thành công!');
;    
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()->with('error', 'Có lỗi xảy ra: ' . $e->getMessage())->withInput();
        }
    }
public function edit($id)
    {
        $product = Product::with('variants')->findOrFail($id);
        $categories = Category::all();
        $colors = Color::all();
        $sizes = Size::all();

        return view('dashboard.products.edit', compact('product', 'categories', 'colors', 'sizes'));
    }
    public function update(Request $request, $id)
    {
        $product = Product::with('variants')->findOrFail($id);

        $request->validate([
            'name' => 'required|string|max:255|unique:products,name,' . $id,
            'slug' => 'nullable|unique:products,slug,' . $id,
            'category_id' => 'required|exists:categories,id',
            'description' => 'nullable|string',
            'temp_image_url' => $request->filled('temp_image_url') ? 'required|string' : 'nullable|string',

            'variants' => 'required|array|min:1',
            'variants.*.size_id' => 'required|exists:sizes,id',
            'variants.*.color_id' => 'required|exists:colors,id',
            'variants.*.import_price' => 'required|numeric|min:0',
            'variants.*.listed_price' => 'required|numeric|min:0',
            'variants.*.sale_price' => 'required|numeric|min:0|lte:variants.*.listed_price',
            'variants.*.stock' => 'required|integer|min:0',

            'variants.*.temp_variant_image_url' => function ($attribute, $value, $fail) use ($request) {
                preg_match('/variants\.(\d+)\.temp_variant_image_url/', $attribute, $matches);
                $index = $matches[1] ?? null;
                if ($index !== null && empty($request->variants[$index]['id']) && empty($value)) {
                    $fail('Vui lòng chọn ảnh cho biến thể mới.');
                }
            },
        ], [
            'name.required' => 'Vui lòng nhập tên sản phẩm.',
            'name.unique' => 'Tên sản phẩm đã tồn tại.',
            'slug.unique' => 'Slug đã tồn tại.',
            'category_id.required' => 'Vui lòng chọn danh mục.',
            'temp_image_url.required' => 'Vui lòng chọn ảnh sản phẩm.',

            'variants.required' => 'Vui lòng thêm ít nhất một biến thể.',
            'variants.*.size_id.required' => 'Vui lòng chọn size.',
            'variants.*.color_id.required' => 'Vui lòng chọn màu.',

            'variants.*.import_price.required' => 'Giá nhập không được để trống.',
            'variants.*.import_price.numeric' => 'Giá nhập phải là số.',
            'variants.*.import_price.min' => 'Giá nhập không được nhỏ hơn 0.',

            'variants.*.listed_price.required' => 'Giá niêm yết không được để trống.',
            'variants.*.listed_price.numeric' => 'Giá niêm yết phải là số.',
            'variants.*.listed_price.min' => 'Giá niêm yết không được nhỏ hơn 0.',
            
            'variants.*.sale_price.required' => 'Giá bán không được để trống.',
            'variants.*.sale_price.numeric' => 'Giá bán phải là số.',
            'variants.*.sale_price.min' => 'Giá bán không được nhỏ hơn 0.',
            'variants.*.sale_price.lte' => 'Giá bán phải nhỏ hơn hoặc bằng giá niêm yết.',

            'variants.*.stock.required' => 'Số lượng kho không được để trống.',
            'variants.*.stock.integer' => 'Số lượng kho phải là số nguyên.',
            'variants.*.stock.min' => 'Số lượng kho không được nhỏ hơn 0.',
        ]);

        // Kiểm tra trùng biến thể
        $combinations = [];
        $errors = [];
        foreach ($request->variants as $index => $variant) {
            $key = $variant['color_id'] . '-' . $variant['size_id'];
            if (array_key_exists($key, $combinations)) {
                $firstIndex = $combinations[$key]['index'];
                $firstId = $combinations[$key]['id'] ?? null;
                $currentId = $variant['id'] ?? null;
                if ($currentId !== $firstId) {
                    $errors["variants.$index.color_id"] = ['Trùng biến thể với dòng ' . ($firstIndex + 1)];
                    $errors["variants.$index.size_id"] = ['Trùng biến thể với dòng ' . ($firstIndex + 1)];
                    if (!isset($errors["variants.$firstIndex.color_id"])) {
                        $errors["variants.$firstIndex.color_id"] = ['Trùng biến thể với dòng ' . ($index + 1)];
                    }
                    if (!isset($errors["variants.$firstIndex.size_id"])) {
                        $errors["variants.$firstIndex.size_id"] = ['Trùng biến thể với dòng ' . ($index + 1)];
                    }
                }
            } else {
                $combinations[$key] = [
                    'index' => $index,
                    'id' => $variant['id'] ?? null
                ];
            }
        }

        // Kiểm tra trùng ảnh biến thể
        $imagePaths = [];
        foreach ($request->variants as $index => $variant) {
            if (!empty($variant['temp_variant_image_url'])) {
                if (in_array($variant['temp_variant_image_url'], $imagePaths)) {
                    $errors["variants.$index.temp_variant_image_url"] = ['Ảnh biến thể bị trùng với dòng khác'];
                } else {
                    $imagePaths[] = $variant['temp_variant_image_url'];
                }
            }
        }

        if (!empty($errors)) {
            throw ValidationException::withMessages($errors);
        }

        try {
            DB::beginTransaction();

            // Xử lý ảnh sản phẩm
            $imagePath = $product->image_url;
            if ($request->filled('temp_image_url')) {
                $tempPath = public_path(parse_url($request->temp_image_url, PHP_URL_PATH));
                if (file_exists($tempPath)) {
                    $filename = time() . '_' . basename($tempPath);
                    $newPath = 'uploads/products/' . $filename;
                    rename($tempPath, public_path($newPath));
                    $imagePath = $newPath;
                }
            }

            $product->update([
                'name' => $request->name,
                'slug' => Str::slug($request->slug),
                'description' => $request->description,
                'category_id' => $request->category_id,
                'image_url' => $imagePath,
            ]);

            $existingIds = [];
            foreach ($request->variants as $variantData) {
                $variantImagePath = $variantData['variant_image_url'] ?? null;
                if (!empty($variantData['temp_variant_image_url'])) {
                    $tempPath = public_path(parse_url($variantData['temp_variant_image_url'], PHP_URL_PATH));
                    if (file_exists($tempPath)) {
                        $filename = time() . '_' . basename($tempPath);
                        $newPath = 'uploads/product_variants/' . $filename;
                        rename($tempPath, public_path($newPath));
                        $variantImagePath = $newPath;
                    }
                }

                $color = Color::find($variantData['color_id']);
                $size = Size::find($variantData['size_id']);
                $variantName = $product->name . ' - ' . ($color->color_name ?? '') . ' - ' . ($size->size_name ?? '');

                if (isset($variantData['id'])) {
                    $variant = $product->variants()->find($variantData['id']);
                    if ($variant) {
                        $variant->update([
                            'color_id' => $variantData['color_id'],
                            'size_id' => $variantData['size_id'],
                            'name' => $variantName,
                            'import_price' => $variantData['import_price'],
                            'listed_price' => $variantData['listed_price'],
                            'sale_price' => $variantData['sale_price'],
                            'stock' => $variantData['stock'],
                            'initial_stock' => $variantData['stock'],
                            'variant_image_url' => $variantImagePath,
                        ]);
                        
                        $existingIds[] = $variant->id;
                    }
                } else {
                    $newVariant = $product->variants()->create([
                        'color_id' => $variantData['color_id'],
                        'size_id' => $variantData['size_id'],
                        'name' => $variantName,
                        'import_price' => $variantData['import_price'],
                        'listed_price' => $variantData['listed_price'],
                        'sale_price' => $variantData['sale_price'],
                        'stock' => $variantData['stock'],
                        'initial_stock' => $variantData['stock'],
                        'variant_image_url' => $variantImagePath,
                    ]);
                    $existingIds[] = $newVariant->id;
                }
            }
            // dd($request->all());

            // Xoá biến thể không còn trong request
            $product->variants()->whereNotIn('id', $existingIds)->delete();

            DB::commit();

            return redirect()->route('dashboard.products.index', $product->id)
                ->with('success', 'Cập nhật sản phẩm và biến thể thành công!');
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', 'Lỗi: ' . $e->getMessage());
        }
    }
public function destroy(Product $product)
{
    $product->variants()->delete();
    $product->delete();

    return back()->with('success', 'Đã xoá');
}
 public function show($id)
    {
        $product = Product::with(['category', 'variants.color', 'variants.size'])->findOrFail($id);
        return view('dashboard.products.show', compact('product'));
    }

}