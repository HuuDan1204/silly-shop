<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class DashboardAuth
{
    public function handle(Request $request, Closure $next): Response
    {
        // Kiểm tra đã login chưa + role phải là admin
        if (! $request->user() || $request->user()->role !== 'admin') {
            return redirect('/login')
                ->with('error', 'Bạn không có quyền truy cập khu vực Dashboard!');
        }

        return $next($request);
    }
}