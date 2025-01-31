<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Api\NewRegisteredUserController;

Route::post('/register', [NewRegisteredUserController::class, 'store'])
    ->middleware('guest')
    ->name('register');
