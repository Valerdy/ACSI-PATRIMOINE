@extends('index')

@section('content')
<div class="col-md-8 offset-md-2">

    <h2 class="mb-4">Création de Patrimoine d'Acquisition</h2>
    <form action="{{route('update.bien', $bien->id)}}" method="POST">
        @csrf
        @method('put')
        <!-- Nom du patrimoine -->
        <div class="form-group">
            <label for="nom">Nom du patrimoine :</label>
            <input value={{ $bien->nom }} type="text" class="form-control" id="nom" name="nom" required>
        </div>

        <!-- Type de patrimoine -->
        <div class="form-group">
            <label for="type">Type de patrimoine :</label>
            <select class="form-control" id="type" name="categorie" required>
                <option value="">{{ $bien->categorie }}</option>
                <option value="immobilier">Immobilier</option>
                <option value="financier">Financier</option>
                <option value="artistique">Artistique</option>
                <option value="culturel">Culturel</option>
                <!-- Ajoutez d'autres options selon vos besoins -->
            </select>
        </div>

        <!-- Valeur du patrimoine -->
        <div class="form-group">
            <label for="valeur">Quantité :</label>
            <input type="number" class="form-control" id="valeur" name="quantite_stock">
        </div>

        <!-- Date d'acquisition -->
        <div class="form-group">
            <label for="date_acquisition">Date d'acquisition :</label>
            <input value={{ $bien->date_acquisition }} type="date" class="form-control" id="date_acquisition" name="date_acquisition" required>
        </div>

        <!-- Description -->
        <div class="form-group">
            <label for="description">Description :</label>
            <textarea class="form-control" id="description" name="description" rows="3">{{ $bien->description }}</textarea>
        </div>

        <!-- Bouton de soumission -->
        <button type="submit" class="btn btn-primary">Modifier</button>
        <form action="{{ route('delete.bien', $bien->id) }}" method="delete">
            <button type="submit" class="btn btn-danger">Supprimer</button>
        </form>

    </form>

</div>

@endsection
