<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion du patrimoine de l'ACSI</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="{{ asset('images.png') }}" type="image/x-icon">
    <!-- Styles CSS personnalisés -->
    <style>
        /* Styles personnalisés pour le header */
        .header {
            background-color: #164507; /* Couleur de fond du header */
            color: #ffffff; /* Couleur du texte */
            padding: 10px 0; /* Espacement intérieur */
            text-align: center; /* Centrage du contenu */
        }

        .footer{
            background-color: #164507;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="container">
            <h1>GESTION DU PATRIMOINE ACSI</h1>
            <p>Soyez le bienvenue</p>
        </div>
    </header>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('index') }}">Gesion des biens</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('voir_fournisseurs') }}">Gesion des founisseurs</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('entres') }}">Gestion des approvisionnements</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('historiques') }}">Suivi et Sauvegarde</a>
                </li>
                @auth()
                <li class="nav-item">
                    <a class="nav-link" href="/inscription">Creation d'un compte</a>
                </li>
                <li class="mx-5 nav-item">
                <form method="POST" action="{{ route('logout') }}">
                    @csrf
                    <button style="background-color: darkred" class=" mx-3 btn btn-outline-dark text-white" type="submit">Deconnexion</button>
                </form>
                </li>
                    @else

                @endauth
            </ul>
        </div>
    </nav>

    <!-- Contenu principal -->
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                @yield('content')
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer mt-auto py-2 text-white text-center">
        <div class="container">
            <span>&copy; 2024 CSI. Tous droits réservés.</span>
        </div>
    </footer>
</body>
</html>
