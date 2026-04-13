<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class CategoryController extends Controller
{
    public function index()
    {
        $categories = Category::latest()->paginate(10);
        return view('dashboard.categories.index', compact('categories'));
    }

    public function create()
    {
        return view('dashboard.categories.create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => [
                'required',
                'string',
                'min:3',
                'max:255',
                'unique:categories,name',
                'regex:/^[\p{L}\p{N}\s\-]+$/u',
            ],
            'image' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048'
        ], [
            'name.required' => 'Tên danh mục không được bỏ trống.',
            'name.min'      => 'Tên danh mục phải ít nhất 3 ký tự.',
            'name.max'      => 'Tên danh mục không được vượt quá 255 ký tự.',
            'name.unique'   => 'Tên danh mục này đã tồn tại.',
            'name.regex'    => 'Tên danh mục chỉ được chứa chữ cái, số, khoảng trắng và dấu gạch ngang.',
            'image.image'   => 'File phải là hình ảnh.',
            'image.mimes'   => 'Ảnh phải có định dạng jpg, jpeg, png hoặc webp.',
            'image.max'     => 'Ảnh tối đa 2MB.'
        ]);

        if ($request->hasFile('image')) {
            $validated['image'] = $request->file('image')->store('categories', 'public');
        }

        Category::create($validated);

        return redirect()->route('dashboard.categories.index')
            ->with('success', 'Danh mục đã được thêm thành công!');
    }

    public function show(Category $category)
    {
        return view('dashboard.categories.show', compact('category'));
    }

    public function edit(Category $category)
    {
        return view('dashboard.categories.edit', compact('category'));
    }

    public function update(Request $request, Category $category)
    {
        $validated = $request->validate([
            'name' => [
                'required',
                'string',
                'min:3',
                'max:255',
                'unique:categories,name,' . $category->id,
                'regex:/^[\p{L}\p{N}\s\-]+$/u',
            ],
            'image' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048'
        ], [
            'name.required' => 'Tên danh mục không được bỏ trống.',
            'name.min'      => 'Tên danh mục phải ít nhất 3 ký tự.',
            'name.max'      => 'Tên danh mục không được vượt quá 255 ký tự.',
            'name.unique'   => 'Tên danh mục này đã tồn tại.',
            'name.regex'    => 'Tên danh mục chỉ được chứa chữ cái, số, khoảng trắng và dấu gạch ngang.',
        ]);

        if ($request->hasFile('image')) {

            if ($category->image) {
                Storage::disk('public')->delete($category->image);
            }

            $validated['image'] = $request->file('image')->store('categories', 'public');
        }

        $category->update($validated);

        return redirect()->route('dashboard.categories.index')
            ->with('success', 'Danh mục đã được cập nhật thành công!');
    }

    public function destroy(Category $category)
    {
        if ($category->image) {
            Storage::disk('public')->delete($category->image);
        }

        $category->delete();

        return redirect()->route('dashboard.categories.index')
            ->with('success', 'Danh mục đã được xóa thành công!');
    }
}