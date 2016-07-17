<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Transfer extends Model
{
    const MIN_AMOUNT = 10.0;

    protected $fillable = ['user_from_id', 'user_to_id', 'amount', 'token', 'comment', 'status', 'browser', 'ip'];

}
