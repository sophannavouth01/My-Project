<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\PaymentController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
}); 
// Routes accessible by all authenticated users
Route::group(['middleware' => 'api', 'prefix' => 'auth'], function () {
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/login', [AuthController::class, 'login']);
    Route::post('/logout', [AuthController::class, 'logout']);

    Route::group(['middleware' => 'jwt.auth'], function () {
        Route::get('/users', [UserController::class, 'getAllUsers']);
        Route::get('/users/{id}', [UserController::class, 'getUserById']);
        Route::put('/users/{id}', [UserController::class, 'update']);

    });
    Route::get('/products', [ProductController::class, 'index']);
    Route::get('/products/{id}', [ProductController::class, 'show']);
    Route::post('/products', [ProductController::class, 'store']);
    Route::post('/products/{id}', [ProductController::class, 'update']);
    Route::delete('/products/{id}', [ProductController::class, 'destroy']);

    Route::post('/orders', [OrderController::class, 'createOrder']);
    Route::get('/orders/{id}', [OrderController::class, 'show']);
    Route::get('/orders', [OrderController::class, 'index']); // Add this line
    Route::post('/order/remove-item', [OrderController::class, 'removeItem']);
    Route::delete('/remove-product-from-order', [OrderController::class, 'removeProductFromOrder']);
    Route::post('/payments', [PaymentController::class, 'store']);
    Route::get('/payments', [PaymentController::class, 'index']);

});

// Admin routes
Route::group(['middleware' => ['jwt.auth', 'role:admin']], function () {
    Route::get('/admin/dashboard', [AdminController::class, 'dashboard']);
});

// User routes
Route::group(['middleware' => ['jwt.auth', 'role:user']], function () {
    Route::get('/user/profile', [UserController::class, 'profile']);
 
});
 