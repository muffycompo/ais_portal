<?php

//    Routes
Route::get('/', array('as'=>'home', 'uses'=>'home@index'));

//    Users Controller - GET
Route::get('users', array('as'=>'users', 'uses'=>'users@index'));
Route::get('users/signup', array('as'=>'user_signup', 'uses'=>'users@signup'));
Route::get('users/signup_complete', array('as'=>'signup_complete', 'uses'=>'users@signup_complete'));
Route::get('users/login', array('as'=>'user_login', 'uses'=>'users@login'));
Route::get('users/dashboard', array('as'=>'user_dashboard', 'uses'=>'users@dashboard'));
Route::get('users/profile', array('as'=>'user_profile', 'uses'=>'users@profile'));
Route::get('users/logout', array('as'=>'user_logout', 'uses'=>'users@logout'));
Route::get('users/new_user', array('as'=>'new_user', 'uses'=>'users@new_user'));
Route::get('users/edit_user/(:num)', array('as'=>'edit_user', 'uses'=>'users@edit_user'));
Route::get('users/edit_profile/(:num)', array('as'=>'edit_profile', 'uses'=>'users@edit_profile'));
Route::get('users/delete_user/(:num)', array('as'=>'delete_user', 'uses'=>'users@delete_user'));
Route::get('users/forgot_password', array('as'=>'forgot_password', 'uses'=>'users@forgot_password'));
Route::get('users/password_confirmation', array('as'=>'password_confirmation', 'uses'=>'users@password_confirmation'));
//Route::get('users/generate_hash', array('as'=>'generate_hash', 'uses'=>'users@generate_hash'));


//    Users Controller - POST
Route::post('users/login', array('uses'=>'users@login'));
Route::post('users/signup', array('uses'=>'users@signup'));
Route::post('users/new_user', array('uses'=>'users@new_user'));
Route::post('users/edit_user', array('uses'=>'users@edit_user'));
Route::post('users/edit_profile', array('uses'=>'users@edit_profile'));
Route::post('users/forgot_password', array('uses'=>'users@forgot_password'));
Route::post('users/upload_photo', array('uses'=>'users@upload_photo'));


//    Payments Controller - GET
Route::get('payments', array('as'=>'admin_payments', 'uses'=>'payments@index'));
Route::get('payments/pins', array('as'=>'pin_payments', 'uses'=>'payments@pins'));
Route::get('payments/fees', array('as'=>'fee_payments', 'uses'=>'payments@fees'));
Route::get('payments/student_fees', array('as'=>'student_fee_payments', 'uses'=>'payments@student_fees'));
Route::get('payments/new_pin', array('as'=>'new_pin_payment', 'uses'=>'payments@new_pin'));
Route::get('payments/new_fee', array('as'=>'new_fee_payment', 'uses'=>'payments@new_fee'));
Route::get('payments/pin_receipt/(:num)', array('as'=>'pin_receipt', 'uses'=>'payments@pin_receipt'));
Route::get('payments/fee_receipt/(:num)', array('as'=>'fee_receipt', 'uses'=>'payments@fee_receipt'));
Route::get('payments/pin_slip/(:num)', array('as'=>'pin_slip', 'uses'=>'payments@pin_slip'));
Route::get('payments/edit_pin_payment/(:num)', array('as'=>'edit_pin_payment', 'uses'=>'payments@edit_pin_payment'));
Route::get('payments/edit_fee_payment/(:num)', array('as'=>'edit_fee_payment', 'uses'=>'payments@edit_fee_payment'));



//    Payments Controller - POST
Route::post('payments/new_pin', array('uses'=>'payments@new_pin'));
Route::post('payments/new_fee', array('uses'=>'payments@new_fee'));
Route::post('payments/edit_pin_payment', array('uses'=>'payments@edit_pin_payment'));
Route::post('payments/edit_fee_payment', array('uses'=>'payments@edit_fee_payment'));


//    Registrations Controller - GET
Route::get('registrations/biodata', array('as'=>'biodata', 'uses'=>'registrations@biodata'));
Route::get('registrations/schools_attended', array('as'=>'schools_attended', 'uses'=>'registrations@schools_attended'));
Route::get('registrations/new_school', array('as'=>'new_school', 'uses'=>'registrations@new_school'));
Route::get('registrations/edit_school/(:num)', array('as'=>'edit_school', 'uses'=>'registrations@edit_school'));
Route::get('registrations/delete_school/(:num)', array('as'=>'delete_school', 'uses'=>'registrations@delete_school'));
Route::get('registrations/parent_info', array('as'=>'parent_info', 'uses'=>'registrations@parent_info'));
Route::get('registrations/medical_record', array('as'=>'medical_record', 'uses'=>'registrations@medical_record'));
Route::get('registrations/uploads', array('as'=>'uploads', 'uses'=>'registrations@uploads'));
Route::get('registrations/delete_docs/(:any)', array('as'=>'delete_docs', 'uses'=>'registrations@delete_docs'));
Route::get('registrations/attestation', array('as'=>'attestation', 'uses'=>'registrations@attestation'));
Route::get('registrations/print_application', array('as'=>'print_application', 'uses'=>'registrations@print_application'));


//    Registrations Controller - POST
Route::post('registrations/biodata', array('uses'=>'registrations@biodata'));
Route::post('registrations/new_school', array('uses'=>'registrations@new_school'));
Route::post('registrations/edit_new_school', array('uses'=>'registrations@edit_new_school'));
Route::post('registrations/parent_info', array('uses'=>'registrations@parent_info'));
Route::post('registrations/medical_record', array('uses'=>'registrations@medical_record'));
Route::post('registrations/upload_photo', array('uses'=>'registrations@upload_photo'));
Route::post('registrations/upload_docs', array('uses'=>'registrations@upload_docs'));
Route::post('registrations/finalize_application', array('uses'=>'registrations@finalize_application'));

//    Results Controller - GET
Route::get('results', array('as'=>'results', 'uses'=>'results@index'));
Route::get('results/assessments', array('as'=>'assessments', 'uses'=>'results@assessments'));
Route::get('results/assessment/(:num)/(:num)', array('as'=>'assessment', 'uses'=>'results@assessment'));
Route::get('results/new_assessment/(:num)/(:num)/(:num)', array('as'=>'new_assessment', 'uses'=>'results@new_assessment'));

//    Results Controller - POST
Route::post('results', array('as'=>'results', 'uses'=>'results@index'));
Route::post('results/new_assessment', array('as'=>'new_assessment', 'uses'=>'results@new_assessment'));

//    Settings Controller - GET
Route::get('settings', array('as'=>'settings', 'uses'=>'settings@index'));
Route::get('settings/teachers', array('as'=>'teachers', 'uses'=>'settings@teachers'));
Route::get('settings/teacher/(:num)/assign_subject', array('as'=>'assign_subject', 'uses'=>'settings@assign_subject'));
Route::get('settings/subjects', array('as'=>'ais_subjects', 'uses'=>'settings@subjects'));
Route::get('settings/classes', array('as'=>'ais_classes', 'uses'=>'settings@classes'));
Route::get('settings/teacher/(:num)/assign_class', array('as'=>'assign_class', 'uses'=>'settings@assign_class'));

//    Settings Controller - POST
Route::post('settings', array('uses'=>'settings@index'));
Route::post('settings/assign_subject', array('uses'=>'settings@assign_subject'));
Route::post('settings/assign_class', array('uses'=>'settings@assign_class'));




//    Admin Controller - GET
Route::get('admin/admissions', array('as' => 'admissions', 'uses'=>'admin@admissions'));
Route::get('admin/admissions_list', array('as' => 'admissions_list', 'uses'=>'admin@admissions_list'));
Route::get('admin/applicants_list', array('as' => 'applicants_list', 'uses'=>'admin@applicants_list'));
Route::get('admin/official_use/(:num)', array('as' => 'official_use', 'uses'=>'admin@official_use'));
Route::get('admin/approve_admission/(:num)', array('as' => 'approve_admission', 'uses'=>'admin@approve_admission'));


//    Admin Controller - POST
Route::post('admin/official_use', array('uses'=>'admin@official_use'));




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