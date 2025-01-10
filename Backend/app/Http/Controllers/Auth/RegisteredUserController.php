<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Twilio\Rest\Client;

class RegisteredUserController extends Controller
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
            'phone_number' => ['required', 'numeric', 'unique:' . User::class],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
        ]);

        /* Get twilio credentials from .env */
        $twilio_auth_token = getenv('TWILIO_AUTH_TOKEN');
        $twilio_sid = getenv('TWILIO_SID');
        $twilio_verify_sid = getenv('TWILIO_VERIFY_SID');

        $twilio = new Client($twilio_sid, $twilio_auth_token);
        $twilio->verify->v2->services($twilio_verify_sid)
            ->verifications
            ->create($data['phone_number'], 'sms');

        User::create([
            'name' => $data['name'],
            'phone_number' => $data['phone_number'],
            'password' => Hash::make($data['password']),
        ]);

        return response()->json([
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

        /* Get credentials from .env */
        $twilio_auth_token = getenv("TWILIO_AUTH_TOKEN");
        $twilio_sid = getenv("TWILIO_SID");
        $twilio_verify_sid = getenv("TWILIO_VERIFY_SID");
        $twilio = new Client($twilio_sid, $twilio_auth_token);
        $verification = $twilio->verify->v2->services($twilio_verify_sid)
            ->verificationChecks
            ->create([
                'Code' => $data['verification_code'],
                'To' => $data['phone_number']
            ]);

        if ($verification->valid) {
            $user = tap(User::where('phone_number', $data['phone_number']))
                ->update(['phone_verified' => true]);

            if (!$user) {
                return response()->json(
                    [
                        'message' => 'verification failed, user not found, please check if the phone number is currect and if you are regiesterd'
                    ],
                    404
                );
            }

            return response()->json([
                'message' => 'Phone number verified'
            ], 200);
        }

        return response()->json([
            'phone_number' => $data['phone_number'],
            'error' => 'Invalid verification code entered!'
        ], 409);
    }
}
