<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;

class AuthenticatedSessionController extends Controller
{
    /**
     * Handle an incoming authentication request.
     */
    public function store(LoginRequest $request): Response
    {
        $user = User::where('phone_number', $request['phone_number'])->first();
        if (!$user) {
            return response('user not found, please register', 404);
        }

        /* Authenticate user */
        $auth = Auth::attempt([
            'phone_number' => $user->phone_number,
            'password' => $request['password']
        ]);

        if (!$auth) {
            return response([
                'message' => 'password or phone number don\'t match'
            ], 403);
        }

        $request->session()->regenerate();
        $token = $user->createToken($user->phone_number)->plainTextToken;

        return response([
            'token' => $token
        ]);
    }

    /**
     * Destroy an authenticated session.
     */
    public function destroy(Request $request): Response
    {
        //delete all users tokens
        Auth::user()->tokens()->each(function ($token) {
            $token->delete();
        });

        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        $request->session()->flush();

        return response()->noContent();
    }
}
