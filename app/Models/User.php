<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Casts\Attribute;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];
protected function role(): Attribute
{
    return Attribute::make(
        get: fn ($value) => $value, // tự động convert thành string
        set: fn ($value) => match(strtolower($value)) {
            'admin', '1', 1 => 'admin',
            default => 'guest',
        }
    );
}

// Helper để dùng trong blade/middleware
        public function isAdmin(): bool
        {
            return $this->role === 'admin';
        }

        public function isGuest(): bool
        {
            return $this->role === 'guest';
        }
    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }
}
