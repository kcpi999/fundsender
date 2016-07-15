@extends('layouts.main')

@section('content')

    <div class="container">

    </div>

@include('auth-modal')
    <script>
        if (typeof APP === 'undefined') {
            APP = {};
        }
        APP.userLogged = {{{ (Auth::check()) ? 'true' : 'false' }}};
    </script>
@endsection


