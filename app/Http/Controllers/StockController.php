<?php

namespace App\Http\Controllers;

use App\Models\Stock;
use Illuminate\Http\Request;

class StockController extends Controller
{
    public function index()
    {
        $stocks = Stock::all();
        return response()->json($stocks);
    }

    public function store(Request $request)
    {
        $stock = Stock::create($request->all());
        return response()->json($stock, 201);
    }

    public function show($id)
    {
        $stock = Stock::find($id);
        if (!$stock) {
            return response()->json(['message' => 'Stock not found'], 404);
        }
        return response()->json($stock);
    }

    public function update(Request $request, $id)
    {
        $stock = Stock::find($id);
        if (!$stock) {
            return response()->json(['message' => 'Stock not found'], 404);
        }
        $stock->update($request->all());
        return response()->json($stock);
    }

    public function destroy($id)
    {
        $stock = Stock::find($id);
        if (!$stock) {
            return response()->json(['message' => 'Stock not found'], 404);
        }
        $stock->delete();
        return response()->json(['message' => 'Stock deleted']);
    }
}

