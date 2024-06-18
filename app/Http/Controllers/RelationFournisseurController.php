<?php

namespace App\Http\Controllers;

use App\Models\RelationFournisseur;
use Illuminate\Http\Request;

class RelationFournisseurController extends Controller
{
    public function index()
    {
        $relations = RelationFournisseur::all();
        return response()->json($relations);
    }

    public function store(Request $request)
    {
        $relation = RelationFournisseur::create($request->all());
        return response()->json($relation, 201);
    }

    public function show($id)
    {
        $relation = RelationFournisseur::find($id);
        if (!$relation) {
            return response()->json(['message' => 'Relation not found'], 404);
        }
        return response()->json($relation);
    }

    public function update(Request $request, $id)
    {
        $relation = RelationFournisseur::find($id);
        if (!$relation) {
            return response()->json(['message' => 'Relation not found'], 404);
        }
        $relation->update($request->all());
        return response()->json($relation);
    }

    public function destroy($id)
    {
        $relation = RelationFournisseur::find($id);
        if (!$relation) {
            return response()->json(['message' => 'Relation not found'], 404);
        }
        $relation->delete();
        return response()->json(['message' => 'Relation deleted']);
    }
}

