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
        <h2>Historiques des biens</h2>
        <table id="dataTable" class="table table-striped table-hover">
            <thead>
                <tr>
                    <th scope="col">Article</th>
                    <th scope="col">Description</th>
                    <th scope="col">Fournisseurs</th>
                    <th scope="col">Date de creation</th>
                    <th scope="col">Date de modification</th>
                    <th scope="col">En stock</th>
                    <th scope="col">Statut du bien</th>
                </tr>
            </thead>
            <tbody>
                @foreach($biens as $bien)
                    <tr>
                        <td>{{ $bien->nom }}</td>
                        <td>{{ $bien->description }}</td>
                        <td>{{ $bien->created_at }}</td>
                        <td>{{ $bien->updated_at }}</td>
                        <td>{{ $bien->quantite_stock }}</td>
                        <td>{{ $bien->etat }}</td>
                    </tr>
                @endforeach
            {{--  @foreach ($historiques as $item)
            <tr>
                <td>{{ $item->entre->bien->nom ?? 'Aucune donnée' }}</td>
                <td>{{ $item->action }}</td>
                <td>{{ $item->description}}</td>
                <td hidden>{{ $item->created_at}}</td>
            </tr>
            @endforeach  --}}
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
          "lengthMenu": [5, 10, 50],
          "pagingType": "simple",
          "order": [[3, 'desc']]
        });
      });
</script>
@endsection
