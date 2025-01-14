<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Http\Resources\UserResource;
use Illuminate\Support\Facades\Storage;

class UserProfileController extends Controller
{
    /**
     * Show the user profile.
     */
    public function show(Request $request)
    {
        $user = $request->user();

        return new UserResource($user);
    }

    /**
     * Update the user profile.
     */
    public function update(Request $request)
    {
        $user = $request->user();

        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'location' => 'required|string|max:255',
            'profilePicture' => 'image|max:2048',
        ]);

        if ($request->hasFile('profilePicture')) {
            if ($user->profile_picture) {
                Storage::disk('public')->delete($user->profile_picture);
            }
            $imagePath = $request->file('profilePicture')->store('profilePictures', 'public');
            $validated['profile_picture'] = $imagePath;
        }

        $user->update($validated);

        return new UserResource($user);
    }
}
