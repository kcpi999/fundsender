<!DOCTYPE html>
<html lang="en" class="kc-html">
    <head>
        <title>Fundsender</title>
        <link rel="stylesheet" href="{{ asset('bootstrap/css/bootstrap.min.css') }}">
        <link rel="stylesheet" href="{{ asset('jquery-ui/jquery-ui.min.css') }}">
        <script src="{{ asset('js/jquery.min.js') }}"></script>
        <script src="{{ asset('bootstrap/js/bootstrap.min.js') }}"></script>
        <script src="{{ asset('js/jquery.validate.min.js') }}"></script>
        <script src="{{ asset('jquery-ui/jquery-ui.min.js') }}"></script>

        <link rel="stylesheet" href="{{ asset('css/style.css') }}?v={{ time() }}">
        <script src="{{ asset('js/main.js') }}?v={{ time() }}"></script>

    </head>

    <body>
        <header class="header">
            <div class="container">
                <nav class="navbar nav kc-navbar">
                    <a href="/" class="header-logo pull-left"></a>
                    <div class="nav-user pull-right">
                        @if (isset(Auth::user()->name))
                        <a class="logout" href="/logout"><span class="user-name">{{ Auth::user()->name }}</span>, logout</a>
                        @endif
                    </div>
                </nav>
            </div>
        </header>

        @yield('content')
    </body>
</html>
