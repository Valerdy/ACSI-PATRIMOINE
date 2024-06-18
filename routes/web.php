<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\BienController;
use App\Http\Controllers\EntreController;
use App\Http\Controllers\FournisseurController;
use App\Http\Controllers\HistoriqueBienController;
use Illuminate\Support\Facades\Route;

// Route::get('/', function () {
//     return view('index');
// });

Route::get('/historiques', [HistoriqueBienController::class, 'index'])->name('historiques');

Route::get('/entres', [EntreController::class, 'index'])->name('entres');
Route::get('/create/entre', [EntreController::class, 'create'])->name('creer.entre');
Route::get('/show/entre/{id}', [EntreController::class, 'show'])->name('show.entre');
Route::post('/store/entre', [EntreController::class, 'store'])->name('store.entre');
Route::delete('/delete/entre/{id}', [EntreController::class, 'delete'])->name('delete.entre');
Route::put('/update/entre/{id}', [EntreController::class, 'update'])->name('update.entre');

Route::get('/', [BienController::class, 'index'])->name('index');
Route::get('/create/bien', [BienController::class, 'create'])->name('creer.bien');
Route::get('/show/bien/{id}', [BienController::class, 'show'])->name('show.bien');
Route::post('/store/bien', [BienController::class, 'store'])->name('store.bien');
Route::delete('/delete/bien/{id}', [BienController::class, 'delete'])->name('delete.bien');
Route::put('/update/bien/{id}', [BienController::class, 'update'])->name('update.bien');

Route::get('create/fournisseurs', [FournisseurController::class, 'index'])->name('index_fournisseurs');
Route::post('create/fournisseurs', [FournisseurController::class, 'create']);
Route::get('show/fournisseurs', [FournisseurController::class, 'show'])->name('voir_fournisseurs');
Route::delete('show/fournisseurs/{id}', [FournisseurController::class, 'destroy'])->name('delete_fournisseur');
Route::get('show/fournisseurs/{id}', [FournisseurController::class, 'edit'])->name('update_fournisseurs');
Route::put('show/fournisseurs/{id}', [FournisseurController::class, 'update'])->name('update_fournisseur');


Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
