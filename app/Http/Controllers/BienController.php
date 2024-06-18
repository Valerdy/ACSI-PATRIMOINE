<?php

namespace App\Http\Controllers;

use App\Models\Bien;
use Illuminate\Http\Request;

class BienController extends Controller
{
    public function index()
    {
        $biens = Bien::all();
        return view('bien.index', compact('biens'));
    }

    public function create()
    {
        // $biens = Bien::all();
        return view('bien.create');
    }

    public function store(Request $request)
    {
        $bien = Bien::create($request->all());
        return redirect(route('index'));
    }

    public function show($id)
    {
        $bien = Bien::find($id);
        if (!$bien) {
            return response()->json(['message' => 'Bien not found'], 404);
        }
        return view('bien.show', compact('bien'));
    }

    public function update(Request $request, $id)
    {
        $bien = Bien::find($id);
        if (!$bien) {
            return response()->json(['message' => 'Bien not found'], 404);
        }
        $bien->update($request->all());
        return redirect(route('index'));
    }

    public function delete($id)
    {
        $bien = Bien::find($id);
        
        if (!$bien) {
            return response()->json(['message' => 'Bien not found'], 404);
        }
        $bien->delete();
        return redirect(route('index'));
    }
}

