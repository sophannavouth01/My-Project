<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function dashboard()
    {
        // Admin-specific logic here
        return response()->json([
            'message' => 'Welcome to the Admin Dashboard',
            // Add additional data as needed
        ]);
    } 
}
