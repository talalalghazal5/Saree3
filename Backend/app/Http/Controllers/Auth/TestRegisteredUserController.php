<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;

class TestRegisteredUserController extends Controller
{
    /**
     * Handle an incoming registration request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request): Response
    {
        $data = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'phone_number' => ['required', 'numeric', 'unique:' . User::class],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
        ]);

        User::create([
            'name' => $data['name'],
            'phone_number' => $data['phone_number'],
            'password' => Hash::make($data['password']),
        ]);

        return response([
            'message' => 'SMS message sent successfully',
            'phone_number' => $data['phone_number']
        ]);
    }

    /**
     * Handle an incoming verification request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function verify(Request $request)
    {
        $data = $request->validate([
            'phone_number' => ['required', 'string'],
            'verification_code' => ['required', 'numeric'],
        ]);

        if ($data['verification_code'] === 1234) {
            $user = tap(User::where('phone_number', $data['phone_number']))
                ->update(['phone_verified' => true]);
            /* Authenticate user */
            Auth::login($user->first());

            return response(['message' => 'Phone number verified']);
        }

        return response([
            'phone_number' => $data['phone_number'],
            'error' => 'Invalid verification code entered!'
        ], 409);
    }
}
