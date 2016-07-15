<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', [
    'uses' => 'FundsenderController@frontpage',
    'as' => 'FundsenderController@frontpage'
]);

Route::get('/sendfunds', [
    'uses' => 'FundsenderController@main',
    'as' => 'FundsenderController@main',
]);

Route::auth();


//Route::get('/home', 'HomeController@index');
