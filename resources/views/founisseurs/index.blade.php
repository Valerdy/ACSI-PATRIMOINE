@extends('index')

@section('content')
<div class="row">
    <div class="col-md-12">
        <div class="col-4">
            <div class="alert-container">
                @if(session('success'))
                    <div class="alert alert-dark mb-3">
                        {{ session('success') }}
                    </div>
                @endif
            </div>
        </div>
        <h2>Liste des Fournisseurs</h2>
        <form action="{{ route('index_fournisseurs') }}" method="get">
            <button class="btn btn-outline-dark mb-2">Nouveau</button>
        </form>
        <table class="table table-striped">
            <thead>
                <tr>

                    <th scope="col">Nom</th>
                    <th scope="col">Adresse</th>
                    <th scope="col">Telephone</th>
                    <th scope="col">Email</th>
                    <th>Fonctions</th>
                </tr>
            </thead>
            <tbody>
            @foreach ($fournisseurs as $fournisseur)
            <tr>

                <td>{{ $fournisseur->nom }}</td>
                <td>{{ $fournisseur->adresse }}</td>
                <td>{{ $fournisseur->telephone }}</td>
                <td>{{ $fournisseur->email }}</td>
                <td>
                    <form action="{{ route('delete_fournisseur',$fournisseur->id) }}" method="post">
                        @csrf
                        @method('delete')
                        <button onclick="return confirm('Voulez-vous confirmer l'action)" class="btn btn-outline-danger mb-2">Supprimer</button>
                    </form>
                </td>
                <td>
                    <a href="{{ route('update_fournisseurs', $fournisseur->id) }}"><button class=" btn btn-outline-info">Modifier</button></a>
                </td>
            </tr>
            @endforeach
                <!-- Ajoutez plus de lignes selon vos données -->
            </tbody>
        </table>
    </div>
</div>

@endsection
