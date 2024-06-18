<?php

namespace App\Http\Controllers;

use App\Models\Contrat;
use Illuminate\Http\Request;

class ContratController extends Controller
{
    public function index()
    {
        $contrats = Contrat::all();
        return response()->json($contrats);
    }

    public function store(Request $request)
    {
        $contrat = Contrat::create($request->all());
        return response()->json($contrat, 201);
    }

    public function show($id)
    {
        $contrat = Contrat::find($id);
        if (!$contrat) {
            return response()->json(['message' => 'Contrat not found'], 404);
        }
        return response()->json($contrat);
    }

    public function update(Request $request, $id)
    {
        $contrat = Contrat::find($id);
        if (!$contrat) {
            return response()->json(['message' => 'Contrat not found'], 404);
        }
        $contrat->update($request->all());
        return response()->json($contrat);
    }

    public function destroy($id)
    {
        $contrat = Contrat::find($id);
        if (!$contrat) {
            return response()->json(['message' => 'Contrat not found'], 404);
        }
        $contrat->delete();
        return response()->json(['message' => 'Contrat deleted']);
    }
}

