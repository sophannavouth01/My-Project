<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User; 
use Illuminate\Support\Facades\Log;
class UserController extends Controller
{
    // get by All
    public function getAllUsers()
    {
       $users = User::all();
       return response()->json($users);
    }

    // get by ID 
    public function getUserById($id)
    {
       $user = User::find($id);
       if (!$user) {
         return response()->json(['error' => 'User not found'], 404);
        }
        return response()->json($user);
    }
    public function profile()
    {
        $user = auth()->user();
        
        // User-specific logic here
        return response()->json([
            'user' => $user,
            'message' => 'User Profile Information',
            // Add additional data as needed
        ]);
    }
    public function update(Request $request, $id)
    {

        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users,email,' . $id,
          
        ]);

        $user = User::findOrFail($id);
        $user->update($validatedData);
        return response()->json(['message' => 'User updated successfully', 'user' => $user]);
    }


}
