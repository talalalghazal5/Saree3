<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthenticatedSessionController extends Controller
{
    /**
     * Handle an incoming authentication request.
     */
    public function store(LoginRequest $request): JsonResponse
    {
        $user = User::where('phone_number', $request['phone_number'])->first();
        if (!$user) {
            return response()->json([
                'error' => 'User not registered',
                'message' => 'user not found, please register'
            ], 404);
        }

        /* Authenticate user */
        $auth = Auth::attempt([
            'phone_number' => $user->phone_number,
            'password' => $request['password']
        ]);

        if (!$auth) {
            return response()->json([
                'error'=>'Authentication failed',
                'message' => 'password or phone number don\'t match'
            ], 401);
        }

        $request->session()->regenerate();
        $token = $user->createToken($user->phone_number)->plainTextToken;

        return response()->json([
            'message' => 'Successfully logged in',
            'token' => $token
        ], 200);
    }

    /**
     * Destroy an authenticated session.
     */
    public function destroy(Request $request): JsonResponse
    {
        //delete all users tokens
        Auth::user()->tokens()->each(function ($token) {
            $token->delete();
        });

        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        $request->session()->flush();

        return response()->json([], 204);
    }
}
