<?php

use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\Auth\RegisteredUserController;
use App\Http\Controllers\Auth\TestRegisteredUserController;
use Illuminate\Support\Facades\Route;

Route::post('/register', [RegisteredUserController::class, 'store'])
    ->middleware('guest')
    ->name('register');

Route::post('/verify', [RegisteredUserController::class, 'verify'])
    ->middleware('guest')
    ->name('verify');

Route::post('/login', [AuthenticatedSessionController::class, 'store'])
    ->middleware('guest')
    ->name('login');

Route::post('/logout', [AuthenticatedSessionController::class, 'destroy'])
    ->middleware('auth')
    ->name('logout');


//testing endpoints
Route::prefix('test')->group(function () {
    Route::post('/register', [TestRegisteredUserController::class, 'store'])
        ->middleware('guest')
        ->name('register');

    Route::post('/verify', [TestRegisteredUserController::class, 'verify'])
        ->middleware('guest')
        ->name('verify');
});
