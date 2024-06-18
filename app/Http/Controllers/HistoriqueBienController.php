<?php

namespace App\Http\Controllers;

use App\Models\Entre;
use App\Models\HistoriqueBien;
use Illuminate\Http\Request;

class HistoriqueBienController extends Controller
{
    public function index()
    {
        $historiques = HistoriqueBien::with(['entre.bien.nom'])->get();
        return response()->json($historiques);
        return view('historique.index', compact('historiques'));
    }

    public function store(Request $request)
    {
        $historique = HistoriqueBien::create($request->all());
        return response()->json($historique, 201);
    }

    public function show($id)
    {
        $historique = HistoriqueBien::find($id);
        if (!$historique) {
            return response()->json(['message' => 'Historique not found'], 404);
        }
        return response()->json($historique);
    }

    public function update(Request $request, $id)
    {
        $historique = HistoriqueBien::find($id);
        if (!$historique) {
            return response()->json(['message' => 'Historique not found'], 404);
        }
        $historique->update($request->all());
        return response()->json($historique);
    }

    public function destroy($id)
    {
        $historique = HistoriqueBien::find($id);
        if (!$historique) {
            return response()->json(['message' => 'Historique not found'], 404);
        }
        $historique->delete();
        return response()->json(['message' => 'Historique deleted']);
    }
}
