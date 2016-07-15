@extends('layouts.main')

@section('content')

    <div class="container">
        <form class="form-horizontal ajax_form sendfunds-form" id="sendfunds-form js-sendfunds-form" method="GET" action="" onsubmit="vkl.showLikes(this);return false;">
            <h2>Send funds</h2>
            <p class="gg text-muted">Send funds to another User. No other options here. Just pick up some nice one, choose amount of funds and submit.</p>
            <p class="gg text-muted">You can make it if you try... (c) Rolling Stones</p>
            <div class="form-group col-md-12">
                <p class="text-big">Your current Balance: <span class="text-large">$ <span class="js-balance">{{ number_format(Auth::user()->balance, 2, '.', ',') }}</span></span></p>
            </div>
            <div class="form-group">
                <label class="col-md-12">Select a User you desperately wish to send money:</label>
                <div class="col-xs-12 col-sm-6 col-md-5 col-lg-4">
                    <input type="text" class="form-control" name="lucky_user" id="lucky_user" />
                </div>
            </div>

            <div class="form-group col-md-12">
                <button class="btn btn-success top-buffer" type="submit" onclick="APP.sendFunds(this);return false;">Send funds</button>
            </div>
        </form>
    </div>

@endsection
