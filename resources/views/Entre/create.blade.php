@extends('index')

@section('content')
<div class="col-md-8 offset-md-2">

    <h2 class="mb-4">Création de la procédure d'acquisition</h2>
    <form action="{{route('store.entre')}}" method="POST">
        @csrf
        <!-- Nom du patrimoine -->
        <div class="form-group">
            <label for="nom">Selection du patrimoine :</label>
            <select name="bien_id" id="" class="form-control">
                @foreach ($biens as $item )
                    <option value="{{$item->id}}">{{$item->nom}}</option>
                @endforeach
            </select>
        </div>

        <div class="form-group">
            <label for="valeur">Quantité du patrimoine :</label>
            <input type="number" class="form-control" id="valeur" name="quantite" required>
        </div>

        <!-- Valeur du patrimoine -->
        <div class="form-group">
            <label for="valeur">Valeur du patrimoine :</label>
            <input type="number" class="form-control" id="valeur" name="prix_total" required>
        </div>

        <!-- Date d'acquisition -->
        <div class="form-group">
            <label for="date_acquisition">Date d'acquisition :</label>
            <input type="date" class="form-control" id="date_acquisition" name="date_acquisition" required>
        </div>

        <div class="form-group">
            <label for="nom">Selection du fournisseur :</label>
            <select name="fournisseur_id" id="" class="form-control">
                @foreach ($fournisseurs as $item )
                    <option value="{{$item->id}}">{{$item->nom}}</option>
                @endforeach
            </select>
        </div>

        <!-- Bouton de soumission -->
        <button type="submit" class="btn btn-primary">Enregistrer</button>
    </form>
</div>

@endsection
