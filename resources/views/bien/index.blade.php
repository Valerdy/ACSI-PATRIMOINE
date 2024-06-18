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
                <tr>
                    <th scope="row">1</th>
                    <td>Maison de campagne</td>
                    <td>Immobilier</td>
                    <td>500000</td>
                    <td>2023-01-15</td>
                    <td>Une belle maison située au bord d'un lac.</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Actions XYZ</td>
                    <td>Financier</td>
                    <td>10000</td>
                    <td>2022-05-20</td>
                    <td>Investissement dans des actions de la société XYZ.</td>
                </tr>
                <!-- Ajoutez plus de lignes selon vos données -->
            </tbody>
        </table>
    </div>
</div>

@endsection