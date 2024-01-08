<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class UserController extends Controller
{
    public function showHomePage()
    {
        $user = User::find(auth()->user()->id);
        $passwords = $user->userPasswords()->latest()->get();
        $countPass = $passwords->count();
        return view('home', [
            'data' => $passwords,
            'count' => $countPass,
        ]);
    }
    public function actionLogin(Request $request)
    {
        $Fields = $request->validate([
            'name' => 'required',
            'password' => 'required'
        ]);

        if (auth()->attempt(['name' => $Fields['name'], 'password' => $Fields['password']])) {
            $request->session()->regenerate();
            return redirect('/home');
        } else {
            return 'failed';
        }
        // return $request;
    }


    public function logout()
    {
        auth()->logout();
        return redirect('/');
    }


    public function actionRegister(Request $request)
    {
        // return $request;
        $Fields = $request->validate([
            'name' => ['required', 'min: 3', 'max:10', Rule::unique('user', 'name')],
            'email' => ['required', 'email', Rule::unique('users', 'email')],
            'password' => ['required', 'min:3', 'max:200']
        ]);

        $Fields['password'] = bcrypt($Fields['password']);
        $user = User::create($Fields);
        auth()->login($user);

        return redirect('/home');
    }
}
