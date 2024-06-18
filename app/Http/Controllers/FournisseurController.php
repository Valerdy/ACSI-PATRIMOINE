<?php

namespace App\Http\Controllers;

use App\Http\Requests\FournisseurFormRequest;
use App\Models\Fournisseur;
use Illuminate\Http\Request;

class FournisseurController extends Controller
{
    public function index()
    {
        $fournisseurs = Fournisseur::all();
        return view('founisseurs.create',[
            'fournisseurs' => $fournisseurs
        ]);
    }

    public function create(FournisseurFormRequest $request)
    {
        $fournisseur = Fournisseur::create($request->all());
        return redirect()->route('voir_fournisseurs')->with('success', 'Fournisseur ajouté');
    }

    public function show(){

        $fournisseurs = Fournisseur::all();
        return view('founisseurs.index',[
            'fournisseurs' => $fournisseurs
        ]);
    }

    public function edit($id){

        $fournisseur = Fournisseur::find($id);
        return view('founisseurs.show',[
            'fournisseur' => $fournisseur
        ]);
    }

    public function update(FournisseurFormRequest $request, $id){

        $fournisseur=Fournisseur::findOrfail($id);
        $fournisseur->update($request->all());
        return to_route('voir_fournisseurs')->with('success', 'Fournisseur modifié');
    }

    public function destroy($id){
        $fournisseur = Fournisseur::where('id', $id)->firstOrFail();
        $fournisseur->delete();
        return redirect()->back()->with('success', 'Fournisseur retiré');
    }
}

