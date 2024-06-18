<?php

namespace App\Http\Controllers;

use App\Models\Livraison;
use Illuminate\Http\Request;

class LivraisonController extends Controller
{
    public function index()
    {
        $livraisons = Livraison::all();
        return response()->json($livraisons);
    }

    public function store(Request $request)
    {
        $livraison = Livraison::create($request->all());
        return response()->json($livraison, 201);
    }

    public function show($id)
    {
        $livraison = Livraison::find($id);
        if (!$livraison) {
            return response()->json(['message' => 'Livraison not found'], 404);
        }
        return response()->json($livraison);
    }

    public function update(Request $request, $id)
    {
        $livraison = Livraison::find($id);
        if (!$livraison) {
            return response()->json(['message' => 'Livraison not found'], 404);
        }
        $livraison->update($request->all());
        return response()->json($livraison);
    }

    public function destroy($id)
    {
        $livraison = Livraison::find($id);
        if (!$livraison) {
            return response()->json(['message' => 'Livraison not found'], 404);
        }
        $livraison->delete();
        return response()->json(['message' => 'Livraison deleted']);
    }
}

