<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\BienController;
use Illuminate\Support\Facades\Route;

// Route::get('/', function () {
//     return view('index');
// });

Route::get('/', [BienController::class, 'index'])->name('index');
Route::get('/create/bien', [BienController::class, 'create'])->name('creer.bien');
Route::get('/show/bien/{id}', [BienController::class, 'show'])->name('show.bien');
Route::post('/store/bien', [BienController::class, 'store'])->name('store.bien');
Route::get('/delete/bien/{id}', [BienController::class, 'delete'])->name('delete.bien');
Route::get('/update/bien/{id}', [BienController::class, 'update'])->name('update.bien');

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
