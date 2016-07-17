<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\User;
use App\Transfer;
use Auth;
use View;
use DB;

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

    /**
     * Get users list by string matching the name.
     *
     * @ajax
     * @return json
     */
    public function usersGet(Request $request)
    {
        $current_user = Auth::user();
        $term = $request->input('term', false);
        if (!Auth::check()) {
            return response()->json([]);
        }

        $query = User::where('id', '!=', $current_user->id);
        if ($term) {
            $query = $query->where('name', 'LIKE', '%'.$term.'%');
        }
        $users = $query->orderBy('name', 'asc')
            ->limit(20)
            ->get();

        $users_arr = [];
        foreach ($users as $user) {
            $obj = new \stdClass;
            $obj->id = $user->id;
            $obj->label = $user->name . ', id'. $user->id;
            $obj->value = $user->name;
            $users_arr[] = $obj;
        }
        return response()->json($users_arr);
    }

    /**
     * Send funds to another user.
     *
     * @ajax
     * @return json
     */
    public function sendfunds(Request $request)
    {
        $response = new \stdClass;
        try {
            DB::beginTransaction();
                $error = false;
                $current_user = User::where('id', Auth::user()->id)->lockForUpdate()->first();
                $user_id = $request->input('user_id', false);
                $amount = (double) $request->input('amount', 0.0);
                $timestamp = $request->input('timestamp', false);
                $name = $request->name;
                $getter_user = User::where('id', $user_id)->lockForUpdate()->first();
                if (!$getter_user) {
                    $response->success = false;
                    $response->error = 'User id'. $user_id . ', '. $name .' not found.';
                    return response()->json($response);
                }
                $transfer = Transfer::where([
                        'token' => $timestamp,
                        'user_from_id' => $current_user->id,
                        'user_to_id' => $getter_user->id
                    ])->first();
                if ($transfer) { // http bug may be
                    $response->success = false;
                    $response->error = 'This transfer has been processed already. TransferID: '. $transfer->id;
                    return response()->json($response);
                }
                if ($amount > $current_user->balance) {
                    $response->success = false;
                    $response->error = 'Not enough funds on account.';
                    return response()->json($response);
                }
                if ($amount < Transfer::MIN_AMOUNT){
                    $response->success = false;
                    $response->error = 'Minimal transfer amount is $' . price_format(Transfer::MIN_AMOUNT) .'.';
                    return response()->json($response);
                }
                $transfer = Transfer::create([
                    'user_from_id' => $current_user->id,
                    'user_to_id' => $getter_user->id,
                    'amount'    => $amount,
                    'token'     => $timestamp,
                    'status'    => 1,
                    'browser'   => $_SERVER['HTTP_USER_AGENT'],
                    'ip'        => $_SERVER['REMOTE_ADDR'],
                ]);
                $current_user->balance -= $amount;
                $current_user->save();
                $getter_user->balance += $amount;
                $getter_user->save();
            DB::commit();
        } catch (\Exception $e) {
            DB::rollback();
            $response->success = false;
            $response->error = 'DB transaction failure. ' . $e->getMessage();
            return response()->json($response);
        }

        $response->success = true;
        $response->response = [
            'balance' => $current_user->balance,
            'balanceStr' => price_format($current_user->balance),
            'transfer_id' => $transfer->id,
            'message' => View::make('success-transfer-message', [
                'getter_user' => $getter_user,
                'transfer' => $transfer,
            ])->render(),
        ];
        return response()->json($response);
    }
}

