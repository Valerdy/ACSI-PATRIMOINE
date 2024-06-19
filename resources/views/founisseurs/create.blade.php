
@extends('index')

@section('content')
<div class="col-md-8 offset-md-2">

    <h2 class="mb-4">Insertion des fournisseurs</h2>
    <form action="" method="POST">
        @csrf
        <div class="form-group">
            <div class="alert-container">
                @if(session('success'))
                    <div class="alert alert-primary mb-3">
                        {{ session('success') }}
                    </div>
                @endif
            </div>
        </div>
        <!-- Nom du fournisseur -->
        <div class="form-group">
            <label for="nom">Nom :</label>
            <input type="text" class="form-control" id="nom" name="nom" required>
        </div>

        <!-- Adresse du fournisseur -->
        <div class="form-group">
            <label for="adresse">Adresse</label>
            <input type="text" class="form-control" id="adresse" name="adresse" required>
        </div>

        <!-- Telephone du fournisseur -->
        <div class="form-group">
            <label for="telephone">Telephone :</label>
            <input maxlength="15" type="number" class="form-control" id="telephone" name="telephone" required>
        </div>

        <!-- Email du fournisseur -->
        <div class="form-group">
            <label for="email">Email :</label>
            <input  type="text" class="form-control" id="email" name="email" required>
        </div>

        <!-- Bouton de soumission -->
        <button type="submit" class="btn btn-primary">Enregistrer</button>
    </form>
</div>

@endsection
