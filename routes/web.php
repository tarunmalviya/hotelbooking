<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\SearchController;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/', function () {
    return view('search');
});

Route::get('/search', [SearchController::class, 'search']);
