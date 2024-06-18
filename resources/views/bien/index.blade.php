@extends('index')

@section('content')
<div class="row">
    <div class="col-md-12">
        <h2>Liste des Patrimoines d'Acquisition</h2>
        <form action="{{ route('creer.bien') }}" method="get">
            <button class="btn btn-outline-dark mb-2">Nouveau</button>    
        </form>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nom</th>
                    <th scope="col">Type</th>
                    <th scope="col">Valeur</th>
                    <th scope="col">Date d'acquisition</th>
                    <th scope="col">Description</th>
                </tr>
            </thead>
            <tbody>
            @foreach ($biens as $item)
            <tr>
                <td>
                    <form action="{{ route('show.bien',$item->id) }}" method="get">
                        <button>Voir</button>
                    </form>
                </td>
                <td>{{ $item->nom }}</td>
                <td>{{ $item->categorie }}</td>
                <td>{{ $item->prix }}</td>
                <td>{{ $item->created_at }}</td>
                <td>{{$item->description}}</td>
            </tr>
            @endforeach   
                <!-- Ajoutez plus de lignes selon vos données -->
            </tbody>
        </table>
    </div>
</div>

@endsection