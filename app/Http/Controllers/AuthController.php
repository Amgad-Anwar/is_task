<?php

namespace App\Http\Controllers;

use App\Http\Resources\CustomerResource;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function signUp(Request $request) {
        $request->validate([
            'name_en' => 'required|string',
            'name_ar' => 'required|string',
            'dob_hijri' => 'required|date',
            'mobile' => 'required|unique:users',
            'password' => 'required|min:6|confirmed'
        ]);

        $user = User::create([
            'name_en' => $request->name_en,
            'name_ar' => $request->name_ar,
            'dob_hijri' => $request->dob_hijri,
            'mobile' => $request->mobile,
            'password' => Hash::make($request->password),
        ]);


        $token = $user->createToken('api_token')->plainTextToken;

        return response()->json([
            'success'=> true ,
            'token' => $token,
            'customer' => new CustomerResource($user),
        ] ) ;
    }

    public function signIn(Request $request) {
        $request->validate([
            'mobile' => 'required',
            'password' => 'required'
        ]);

        $user = User::where('mobile', $request->mobile)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json([
                'success' => false,
                'message' =>  'invalid Phone Or Password',
            ], 401);
        }

        $token = $user->createToken('api_token')->plainTextToken;
        return response()->json([
            'success' => true,
            'message' =>  'User Found',
            'token' => $token,
            'customer' => new CustomerResource($user),
        ]);
    }
    public function signOut()
    {
        $customer =auth()->user();
        $customer->currentAccessToken()->delete();
        return response()->json([
            'success' => true,
        ]);
    }
}




