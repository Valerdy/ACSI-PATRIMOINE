<?php

namespace App\Http\Controllers;

use App\Models\Bien;
use Illuminate\Http\Request;

class BienController extends Controller
{
    public function index()
    {
        // $biens = Bien::all();
        return view('bien.index');
    }

    public function create()
    {
        // $biens = Bien::all();
        return view('bien.create');
    }

    public function store(Request $request)
    {
        $bien = Bien::create($request->all());
        return response()->json($bien, 201);
    }

    public function show($id)
    {
        $bien = Bien::find($id);
        if (!$bien) {
            return response()->json(['message' => 'Bien not found'], 404);
        }
        return response()->json($bien);
    }

    public function update(Request $request, $id)
    {
        $bien = Bien::find($id);
        if (!$bien) {
            return response()->json(['message' => 'Bien not found'], 404);
        }
        $bien->update($request->all());
        return response()->json($bien);
    }

    public function destroy($id)
    {
        $bien = Bien::find($id);
        if (!$bien) {
            return response()->json(['message' => 'Bien not found'], 404);
        }
        $bien->delete();
        return response()->json(['message' => 'Bien deleted']);
    }
}

