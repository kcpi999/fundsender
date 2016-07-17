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

Route::post('/sendfunds', [
    'uses' => 'FundsenderController@sendfunds',
    'as' => 'FundsenderController@sendfunds',
]);

Route::get('/ajax/users.get', [
    'uses' => 'FundsenderController@usersGet',
    'as' => 'FundsenderController@usersGet',
]);

Route::auth();

//Route::get('/home', 'HomeController@index');
