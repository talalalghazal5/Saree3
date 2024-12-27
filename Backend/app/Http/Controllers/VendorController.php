<?php

namespace App\Http\Controllers;

use App\Models\Vendor;
use Illuminate\Http\Request;

class VendorController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $vendors = Vendor::all();
        return response()->json($vendors);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'vendor_name' => 'required|string|max:255',
            'vendor_description' => 'nullable|string',
            'rating' => 'required|integer|min:1|max:5',
            'contact' => 'nullable|string|max:255',
            'address' => 'nullable|string|max:255',
            'email' => 'nullable|string|email|max:255',
        ]);

        $vendor = Vendor::create($request->all());
        return response()->json($vendor, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {
        $vendor = Vendor::find($id);
        if (!$vendor) {
            return response()->json(['message' => 'Vendor not found'], 404);
        }
        return response()->json($vendor);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, int $id)
    {
        $vendor = Vendor::find($id);
        if (!$vendor) {
            return response()->json(['message' => 'Vendor not found'], 404);
        }
        $request->validate([
            'vendor_name' => 'sometimes|required|string|max:255',
            'vendor_description' => 'nullable|string',
            'rating' => 'sometimes|required|integer|min:1|max:5',
            'contact' => 'nullable|string|max:255',
            'address' => 'nullable|string|max:255',
            'email' => 'nullable|string|email|max:255',
        ]);

        $vendor->update($request->all());
        return response()->json($vendor);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(int $id)
    {
        $vendor = Vendor::find($id);
        if (!$vendor) {
            return response()->json(['message' => 'Vendor not found'], 404);
        }

        $vendor->delete();
        return response()->json(['message' => 'Vendor deleted successfully'], 200);
    }
}
