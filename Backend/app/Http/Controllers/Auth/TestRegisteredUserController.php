<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
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
    public function store(Request $request): JsonResponse
    {
        $data = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'phone_number' => ['required', 'string', 'unique:' . User::class],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
        ]);

        User::create([
            'name' => $data['name'],
            'phone_number' => $data['phone_number'],
            'password' => Hash::make($data['password']),
        ]);

        return response()->json([
            'message' => 'SMS message sent successfully',
            'phone_number' => $data['phone_number']
        ], 201);
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

        if ($data['verification_code'] == 1234) {
            $user = tap(User::where('phone_number', $data['phone_number']))
                ->update(['phone_verified' => true])->first();

            if (!$user) {
                return response()->json(
                    [
                        'message' => 'verification failed, user not found, please check if the phone number is currect and if you are regiesterd'
                    ],
                    404
                );
            }
            return response()->json([
                'message' => 'Phone number verified',
            ], 200);
        }

        return response()->json([
            'phone_number' => $data['phone_number'],
            'error' => 'Invalid OTP',
            'message' => 'Invalid verification code entered!'
        ], 409);
    }
}
