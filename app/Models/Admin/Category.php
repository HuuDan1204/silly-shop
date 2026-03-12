<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Category extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'slug',
         'image'
    ];

    protected static function booted()
    {
        static::creating(function ($category) {
            $category->slug = Str::slug($category->name);
        });

        static::updating(function ($category) {
            if ($category->isDirty('name')) {
                $category->slug = Str::slug($category->name);
            }
        });
    }

    // Quan hệ với sản phẩm (nếu sau này cần)
    public function products()
    {
        return $this->hasMany(Product::class, 'category_id');
    }
       public function getImageUrlAttribute()
    {
        return $this->image
            ? asset('storage/' . $this->image)
            : 'https://via.placeholder.com/150?text=No+Image';
    }
    public function index()
{
    $categories = Category::withCount('products')->get();

    return view('client.home', compact('categories'));
}
}