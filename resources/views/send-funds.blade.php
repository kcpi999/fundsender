@extends('layouts.main')

@section('content')

    <div class="container">
        <form class="form-horizontal ajax_form sendfunds-form js-sendfunds-form" id="sendfunds-form" method="POST" action="" onsubmit="APP.sendFunds(this);return false;">
            {!! csrf_field() !!}
            <h2>Send funds</h2>
            <p class="gg text-muted">Send funds to another User. No other options here. Just pick up some nice one, choose amount of funds and submit.</p>
            <p class="gg text-muted">You can make it if you try... (c) Rolling Stones</p>
            <div class="form-group col-md-12">
                <p class="text-big">Your current Balance: <span class="text-large">$<span class="js-balance">{{ price_format(Auth::user()->balance) }}</span></span></p>
            </div>
            <div class="form-group">
                <label class="col-md-12">Select a User you desperately wish to send money:</label>
                <div class="col-xs-12 col-sm-6 col-md-5 col-lg-4">
                    <input type="text" class="form-control js-user-combobox" name="luckyUser" id="luckyUser" />
                    <span class="none alert-danger fade in js-luckyUser-error"></span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12">Select amount of money ($):</label>
                <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                    <input type="text" class="form-control js-sum-amount" name="sumAmount" id="sumAmount" data-max="{{ number_format(Auth::user()->balance, 2, '.', '') }}" value="10" />
                </div>
            </div>

            <div class="form-group col-xs-12">
                <button id="submit" class="btn btn-success top-buffer" type="button" onclick="APP.sendFunds(this);">Send funds</button>
            </div>
            <div class="form-group col-xs-12">
                <div class="js-submit-result-msg msg" class="none"></div>
            </div>
        </form>
    </div>

@endsection
