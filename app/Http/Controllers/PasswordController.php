<?php

namespace App\Http\Controllers;

use Defuse\Crypto\Key;
use Defuse\Crypto\Crypto;
use Defuse\Crypto\Encoding;
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


        // Encrypt the password using OpenSSL in PHP
        $encryptedPassword = openssl_encrypt(
            $fields['password'],
            'AES-256-CBC',
            'def00000c123cf86290d9e124ce4d6ec9ff24650c28742763052c8ca6e98084bb86669766f633eb109b45b1ba5e9c0d99ccb5fac8940f0ded0ea937a283f688d83c48ac1', // Replace with your actual secret key
            0, // Options, typically 0
            '0587af72554b4281' // Replace with your actual IV
        );

        $fields['password'] = $encryptedPassword;
        $fields['users_id'] = auth()->id();

        $stored = UsersPassword::create($fields);
        return back();
    }
}
