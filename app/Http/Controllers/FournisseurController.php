<?php

namespace App\Http\Controllers;

use App\Models\Fournisseur;
use Illuminate\Http\Request;

class FournisseurController extends Controller
{
    public function index()
    {
        $fournisseurs = Fournisseur::all();
        return response()->json($fournisseurs);
    }

    public function store(Request $request)
    {
        $fournisseur = Fournisseur::create($request->all());
        return response()->json($fournisseur, 201);
    }

    public function show($id)
    {
        $fournisseur = Fournisseur::find($id);
        if (!$fournisseur) {
            return response()->json(['message' => 'Fournisseur not found'], 404);
        }
        return response()->json($fournisseur);
    }

    public function update(Request $request, $id)
    {
        $fournisseur = Fournisseur::find($id);
        if (!$fournisseur) {
            return response()->json(['message' => 'Fournisseur not found'], 404);
        }
        $fournisseur->update($request->all());
        return response()->json($fournisseur);
    }

    public function destroy($id)
    {
        $fournisseur = Fournisseur::find($id);
        if (!$fournisseur) {
            return response()->json(['message' => 'Fournisseur not found'], 404);
        }
        $fournisseur->delete();
        return response()->json(['message' => 'Fournisseur deleted']);
    }
}

