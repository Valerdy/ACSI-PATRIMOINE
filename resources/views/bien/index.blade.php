@extends('index')

@section('content')
<div class="row">
    <div class="col-md-12">
        <h2>Liste des Patrimoines d'Acquisition</h2>
        <form action="{{ route('creer.bien') }}" method="get">
            <button class="btn btn-outline-dark mb-2">Nouveau</button>
        </form>
        <table id="dataTable" class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">Nom</th>
                    <th scope="col">Type</th>
                    <th scope="col">Quantité</th>
                    <th scope="col">Date d'acquisition</th>
                    <th scope="col">Description</th>
                    <th scope="col">Suppression</th>
                    <th scope="col">Modification</th>
                </tr>
            </thead>
            <tbody>
            @foreach ($biens as $item)
            <tr>
                <td>{{ $item->nom }}</td>
                <td>{{ $item->categorie }}</td>
                <td>{{ $item->quantite_stock }}</td>
                <td>{{ $item->date_acquisition }}</td>
                <td>{{$item->description}}</td>
                <td>
                    <form action="{{ route('delete.bien',$item->id) }}" method="post">
                        @csrf
                        @method('delete')
                        <button onclick="return confirm('Voulez-vous confirmer l'action)" class="btn btn-outline-danger mb-2">Supprimer</button>
                    </form>
                </td>
                <td>
                    <a href="{{ route('show.bien', $item->id) }}"><button class=" btn btn-outline-info">Modifier</button></a>
                </td>
            </tr>
            @endforeach
                <!-- Ajoutez plus de lignes selon vos données -->
            </tbody>
        </table>
    </div>
</div>

<!-- Charger jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- Charger DataTables -->
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<!-- Charger les autres scripts nécessaires -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Activer le tri avec DataTables (nécessite jQuery)
        $('#dataTable').DataTable({
          "language": {
            "sEmptyTable":     "Aucune donnée disponible dans le tableau",
            "sInfo":           "Affichage de l'élément _START_ à _END_ sur _TOTAL_ éléments",
            "sInfoEmpty":      "Affichage de l'élément 0 à 0 sur 0 élément",
            "sInfoFiltered":   "(filtré à partir de _MAX_ éléments au total)",
            "sInfoPostFix":    "",
            "sInfoThousands":  ",",
            "sLengthMenu":     "Afficher _MENU_ éléments",
            "sLoadingRecords": "Chargement...",
            "sProcessing":     "Traitement...",
            "sSearch":         "Rechercher ",
            "sZeroRecords":    "Aucun élément correspondant trouvé",
            "oPaginate": {
              "sFirst":      "Premier",
              "sLast":       "Dernier",
              "sNext":       "Suivant",
              "sPrevious":   "Précédent  "
            },
            "oAria": {
              "sSortAscending":  ": activer pour trier la colonne par ordre croissant",
              "sSortDescending": ": activer pour trier la colonne par ordre décroissant"
            }
          },
          "lengthMenu": [5, 10, 20, 50],
          "pagingType": "simple",
          "order": [[0, 'desc']]
        });
      });
</script>
@endsection
