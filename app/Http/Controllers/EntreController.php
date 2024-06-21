<?php

namespace App\Http\Controllers;

use App\Models\Bien;
use App\Models\Entre;
use App\Models\Fournisseur;
use App\Models\HistoriqueBien;
use Illuminate\Http\Request;

class EntreController extends Controller
{
    public function index()
    {
        $entres = Entre::with(['fournisseur','bien'])->get();
        return view('Entre.index', compact('entres'));
    }

    public function create()
    {
        $biens = Bien::all();
        $fournisseurs = Fournisseur::all();
        return view('Entre.create', compact('biens','fournisseurs'));
    }

    public function store(Request $request)
    {
        $bien = new Entre ([
            'bien_id'=> $request->bien_id,
            'fournisseur_id'=> $request->fournisseur_id,
            'quantite'=> $request->quantite,
            'prix_total'=> $request->prix_total * $request->quantite,
            'date_acquisition'=> $request->date_acquisition,
        ]);
        $bien->save();

        $stock_bien = Bien::where('id',$request->bien_id)->firstOrFail();
        $qte=($stock_bien->quantite_stock + $request->quantite);
        //dd($qte);
        $stock_bien->quantite_stock = $qte;
        $stock_bien->save();

        $get_fournisseur = Entre::where('id',$bien->id)->with(['fournisseur'])->firstOrFail();
        //Enregistrer dans l'historique
        $historique = new HistoriqueBien ([
            'entre_id'=> $request->bien_id,
            'description'=> "Fournisseur : ".$get_fournisseur->fournisseur->nom.", Date de livraison : ".$get_fournisseur->date_acquisition,
        ]);
        $historique->save();
        return redirect(route('entres'));
    }

    public function show($id)
    {
        $entre = Entre::find($id);
        if (!$entre) {
            return response()->json(['message' => 'Entré not found'], 404);
        }
        return view('Entre.show', compact('entre'));
    }

    public function update(Request $request, $id)
    {
        $entre = Entre::find($id);
        if (!$entre) {
            return response()->json(['message' => 'Entré not found'], 404);
        }
        $entre->update($request->all());
        return redirect(route('entres'));
    }

    public function delete($id)
    {
        $entre = Entre::find($id);

        if (!$entre) {
            return response()->json(['message' => 'Entré not found'], 404);
        }
        $entre->delete();
        return redirect(route('entres'));
    }
}
