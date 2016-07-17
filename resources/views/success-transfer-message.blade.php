<div class="transfer-result-msg">
    <h4>Funds sent.</h4>
    Getter: {{ $getter_user->name }}, id{{ $getter_user->id }} <br />
    Amount: ${{ price_format($transfer->amount) }} <br />
    Transaction number: {{ $transfer->id }} <br />
    Time: {{ $transfer->created_at->format('d.m.Y H:i') }}
</div>
