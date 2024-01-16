<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\UsersPassword;
use Illuminate\Support\Facades\Crypt;

class PasswordController extends Controller
{
    public function storePassword(Request $request)
    {
        $fields = $request->validate([
            'website' => 'required',
            'account_name' => 'required',
            'password' => 'required',
        ]);

        $fields['website'] = strip_tags($fields['website']);
        $fields['password'] = strip_tags($fields['password']);

        $fields['password'] = Crypt::encryptString($fields['password'],env('ENC_KEY'));

        $fields['users_id'] = auth()->id();

        // return [$fields, Crypt::decryptString($fields['password'],env('ENC_KEY'))];
        $stored = UsersPassword::create($fields);
        return back();
    }

    public function decryptPassword(Request $request)
    {
        return Crypt::decryptString($request['pass'],env('ENC_KEY'));
    }
}
