<?php

//    Routes
Route::get('/', array('as'=>'home', 'uses'=>'home@index'));

//    Users Controller - GET
Route::get('users/signup', array('as'=>'user_signup', 'uses'=>'users@signup'));
Route::get('users/signup_complete', array('as'=>'signup_complete', 'uses'=>'users@signup_complete'));
Route::get('users/login', array('as'=>'user_login', 'uses'=>'users@login'));
Route::get('users/dashboard', array('as'=>'user_dashboard', 'uses'=>'users@dashboard'));
Route::get('users/logout', array('as'=>'user_logout', 'uses'=>'users@logout'));
Route::get('users/generate_pin', array('as'=>'generate_pin', 'uses'=>'users@generate_pin'));

//    Users Controller - POST
Route::post('users/login', array('uses'=>'users@login'));
Route::post('users/signup', array('uses'=>'users@signup'));




//    Laravel Related
Event::listen('404', function()
{
	return Response::error('404');
});

Event::listen('500', function($exception)
{
	return Response::error('500');
});

Route::filter('before', function()
{
	// Do stuff before every request to your application...
});

Route::filter('after', function($response)
{
	// Do stuff after every request to your application...
});

Route::filter('csrf', function()
{
	if (Request::forged()) return Response::error('500');
});

Route::filter('auth', function()
{
	if (Auth::guest()) return Redirect::to_route('user_login');
});