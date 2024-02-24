<?php

use App\Http\Controllers\PasswordController;
use App\Http\Controllers\UserController;
use App\Models\User;
use App\Models\UsersPassword;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

//View Routes Are Here
Route::get('/register', function () {
    return view('register');
});
Route::get('/', function () {
    return view('login');
})->name('login');

Route::get('/home', [UserController::class, 'showHomePage'])->middleware('auth');

Route::get('/create-pass', function () {
    return view('createPass');
});

// Login Register routes
Route::post('/register', [UserController::class, 'actionRegister']);

Route::post('/login', [UserController::class, 'actionLogin']);

Route::post('/logout', [UserController::class, 'logout']);

//Password Related Routes
Route::post('/create-pass', [PasswordController::class, 'storePassword']);
Route::post('/decrypt', [PasswordController::class, 'decryptPassword']);

Route::get('/updating/{password}',[PasswordController::class,'showUpdateForm'])->middleware('can:update,password');
Route::put('/update/{password}',[PasswordController::class,'updatePassword']);

Route::post('/delete/{password}',[PasswordController::class,'showDeleteForm']);
Route::delete('/delete/{password}',[PasswordController::class,'deletePassword']);

//Email Testing
Route::get('/sendMail',[UserController::class,'sendMail'])->name('sendmail');
Route::get('/sm', function () {
    return view('sm');
});
Route::post('/sm', [UserController::class,'checkOtp']);
