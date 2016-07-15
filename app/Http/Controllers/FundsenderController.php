<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use Auth;

class FundsenderController extends Controller
{
    /**
     * main form for Funds sending
     */
    public function main()
    {
        if (!Auth::check()) {
            return redirect('/');
        }

        return view('send-funds', []);
    }

    public function frontpage()
    {
        if (Auth::check()) {
            return redirect('/sendfunds');
        }

        return view('frontpage', []);
    }
}

