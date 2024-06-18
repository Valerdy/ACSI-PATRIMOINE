<?php

namespace App\Http\Controllers;

use App\Models\EtatLocalisationBien;
use Illuminate\Http\Request;

class EtatLocalisationBienController extends Controller
{
    public function index()
    {
        $etats = EtatLocalisationBien::all();
        return response()->json($etats);
    }

    public function store(Request $request)
    {
        $etat = EtatLocalisationBien::create($request->all());
        return response()->json($etat, 201);
    }

    public function show($id)
    {
        $etat = EtatLocalisationBien::find($id);
        if (!$etat) {
            return response()->json(['message' => 'Etat not found'], 404);
        }
        return response()->json($etat);
    }

    public function update(Request $request, $id)
    {
        $etat = EtatLocalisationBien::find($id);
        if (!$etat) {
            return response()->json(['message' => 'Etat not found'], 404);
        }
        $etat->update($request->all());
        return response()->json($etat);
    }

    public function destroy($id)
    {
        $etat = EtatLocalisationBien::find($id);
        if (!$etat) {
            return response()->json(['message' => 'Etat not found'], 404);
        }
        $etat->delete();
        return response()->json(['message' => 'Etat deleted']);
    }
}
