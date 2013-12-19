<?php

//    Routes
Route::get('/', array('as'=>'home', 'uses'=>'home@index'));
//Route::get('home/hash_pwd', array('uses'=>'home@hash_pwd'));

//    Users Controller - GET
Route::get('users', array('as'=>'users', 'uses'=>'users@index'));
Route::get('users/students', array('as'=>'students', 'uses'=>'users@students'));
Route::get('users/signup', array('as'=>'user_signup', 'uses'=>'users@signup'));
Route::get('users/signup_complete', array('as'=>'signup_complete', 'uses'=>'users@signup_complete'));
Route::get('users/login', array('as'=>'user_login', 'uses'=>'users@login'));
Route::get('users/dashboard', array('as'=>'user_dashboard', 'uses'=>'users@dashboard'));
Route::get('users/profile', array('as'=>'user_profile', 'uses'=>'users@profile'));
Route::get('users/logout', array('as'=>'user_logout', 'uses'=>'users@logout'));
Route::get('users/new_user', array('as'=>'new_user', 'uses'=>'users@new_user'));
Route::get('users/edit_user/(:num)/(:any?)', array('as'=>'edit_user', 'uses'=>'users@edit_user'));
Route::get('users/edit_profile/(:num)', array('as'=>'edit_profile', 'uses'=>'users@edit_profile'));
Route::get('users/delete_user/(:num)', array('as'=>'delete_user', 'uses'=>'users@delete_user'));
Route::get('users/forgot_password', array('as'=>'forgot_password', 'uses'=>'users@forgot_password'));
Route::get('users/password_confirmation', array('as'=>'password_confirmation', 'uses'=>'users@password_confirmation'));


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
Route::get('payments/add_new_fee', array('as'=>'add_new_fee', 'uses'=>'payments@add_new_fee'));
Route::get('payments/pin_receipt/(:num)', array('as'=>'pin_receipt', 'uses'=>'payments@pin_receipt'));
Route::get('payments/fee_receipt/(:num)', array('as'=>'fee_receipt', 'uses'=>'payments@fee_receipt'));
Route::get('payments/pin_slip/(:num)', array('as'=>'pin_slip', 'uses'=>'payments@pin_slip'));
Route::get('payments/edit_pin_payment/(:num)', array('as'=>'edit_pin_payment', 'uses'=>'payments@edit_pin_payment'));
Route::get('payments/edit_fee_payment/(:num)', array('as'=>'edit_fee_payment', 'uses'=>'payments@edit_fee_payment'));
Route::get('payments/fees_schedule', array('as'=>'fees_schedule', 'uses'=>'payments@fees_schedule'));
Route::get('payments/fees_schedule/(:num)', array('as'=>'fees_schedule_term', 'uses'=>'payments@fees_schedule_term'));
Route::get('payments/class_fee_schedule/(:num)/(:num)', array('as'=>'class_fee_schedule', 'uses'=>'payments@class_fee_schedule'));
Route::get('payments/edit_fee_schedule/(:num)', array('as'=>'edit_fee_schedule', 'uses'=>'payments@edit_fee_schedule'));
Route::get('payments/delete_fee_schedule/(:num)', array('as'=>'delete_fee_schedule', 'uses'=>'payments@delete_fee_schedule'));
Route::get('payments/delete_fee_payment/(:num)', array('as'=>'delete_fee_payment', 'uses'=>'payments@delete_fee_payment'));



//    Payments Controller - POST
Route::post('payments/new_pin', array('uses'=>'payments@new_pin'));
Route::post('payments/new_fee', array('uses'=>'payments@new_fee'));
Route::post('payments/add_new_fee', array('uses'=>'payments@add_new_fee'));
Route::post('payments/edit_pin_payment', array('uses'=>'payments@edit_pin_payment'));
Route::post('payments/edit_fee_payment', array('uses'=>'payments@edit_fee_payment'));
Route::post('payments/edit_fee_schedule', array('uses'=>'payments@edit_fee_schedule'));


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
Route::get('registrations/print_application/(:num?)', array('as'=>'print_application', 'uses'=>'registrations@print_application'));


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
Route::get('results/term_result/(:num)', array('as'=>'term_result', 'uses'=>'results@term_result'));
Route::get('results/assessment/(:num)/(:num)/(:num)', array('as'=>'assessment', 'uses'=>'results@assessment'));
Route::get('results/new_assessment/(:num)/(:num)/(:num)/(:num)', array('as'=>'new_assessment', 'uses'=>'results@new_assessment'));
Route::get('results/unpublish_result/(:num)/(:num)/(:num)/(:num)', array('as'=>'unpublish_result', 'uses'=>'results@unpublish_result'));
Route::get('results/publish_result/(:num)/(:num)/(:num)/(:num)', array('as'=>'publish_result', 'uses'=>'results@publish_result'));
Route::get('results/questions', array('as'=>'questions', 'uses'=>'results@questions'));
Route::get('results/assignments', array('as'=>'assignments', 'uses'=>'results@assignments'));
Route::get('results/assignment_submissions', array('as'=>'assignment_submissions', 'uses'=>'results@assignment_submissions'));
Route::get('results/new_question', array('as'=>'new_question', 'uses'=>'results@new_question'));
Route::get('results/new_assignment', array('as'=>'new_assignment', 'uses'=>'results@new_assignment'));
Route::get('results/assignment_score/(:num)/(:num)/(:num)', array('as'=>'assignment_score', 'uses'=>'results@assignment_score'));
Route::get('results/new_assignment_submission/(:num)', array('as'=>'new_assignment_submission', 'uses'=>'results@new_assignment_submission'));
Route::get('results/delete_question/(:num)/(:any)', array('as'=>'delete_question', 'uses'=>'results@delete_question'));
Route::get('results/delete_assignment/(:num)/(:any)', array('as'=>'delete_assignment', 'uses'=>'results@delete_assignment'));
Route::get('results/attendance/(:num)/(:num)/(:num)/(:num)', array('as'=>'attendance', 'uses'=>'results@attendance'));
Route::get('results/attendance_list/(:num)/(:num)/(:num)', array('as'=>'attendance_list', 'uses'=>'results@attendance_list'));

//    Results Controller - POST
Route::post('results', array('as'=>'results', 'uses'=>'results@index'));
Route::post('results/new_assessment', array('as'=>'new_assessment', 'uses'=>'results@new_assessment'));
Route::post('results/new_question', array('uses'=>'results@new_question'));
Route::post('results/new_assignment', array('uses'=>'results@new_assignment'));
Route::post('results/new_assignment_submission', array('uses'=>'results@new_assignment_submission'));
Route::post('results/assignment_score', array('uses'=>'results@assignment_score'));
Route::post('results/assessment_score', array('uses'=>'results@assessment_score'));
Route::post('results/attendance', array('uses'=>'results@attendance'));

//    Settings Controller - GET
Route::get('settings', array('as'=>'settings', 'uses'=>'settings@index'));
Route::get('settings/teachers', array('as'=>'teachers', 'uses'=>'settings@teachers'));
Route::get('settings/teacher/(:num)/assign_subject', array('as'=>'assign_subject', 'uses'=>'settings@assign_subject'));
Route::get('settings/subjects', array('as'=>'ais_subjects', 'uses'=>'settings@subjects'));
Route::get('settings/new_subject', array('as'=>'new_subject', 'uses'=>'settings@new_subject'));
Route::get('settings/edit_subject/(:num)', array('as'=>'edit_subject', 'uses'=>'settings@edit_subject'));
Route::get('settings/classes', array('as'=>'ais_classes', 'uses'=>'settings@classes'));
Route::get('settings/new_class', array('as'=>'new_class', 'uses'=>'settings@new_class'));
Route::get('settings/edit_class/(:num)', array('as'=>'edit_class', 'uses'=>'settings@edit_class'));
Route::get('settings/edit_subject/(:num)', array('as'=>'edit_subject', 'uses'=>'settings@edit_subject'));
Route::get('settings/delete_class/(:num)', array('as'=>'delete_class', 'uses'=>'settings@delete_class'));
Route::get('settings/delete_subject/(:num)', array('as'=>'delete_subject', 'uses'=>'settings@delete_subject'));
Route::get('settings/teacher/(:num)/assign_class', array('as'=>'assign_class', 'uses'=>'settings@assign_class'));
Route::get('settings/unassign_subject/(:num)/(:num)/(:num)/(:num)', array('as'=>'unassign_subject', 'uses'=>'settings@unassign_subject'));

Route::get('settings/manage_banks', array('as' => 'manage_banks', 'uses'=>'settings@manage_banks'));
Route::get('settings/manage_app_type', array('as' => 'manage_app_type', 'uses'=>'settings@manage_app_type'));
Route::get('settings/manage_app_pin', array('as' => 'manage_app_pin', 'uses'=>'settings@manage_app_pin'));
Route::get('settings/manage_aca_session', array('as' => 'manage_aca_session', 'uses'=>'settings@manage_aca_session'));
Route::get('settings/manage_aca_term', array('as' => 'manage_aca_term', 'uses'=>'settings@manage_aca_term'));
Route::get('settings/manage_payment_categories', array('as' => 'manage_payment_categories', 'uses'=>'settings@manage_payment_categories'));
Route::get('settings/active_session/(:num)', array('as' => 'active_session', 'uses'=>'settings@active_session'));
Route::get('settings/active_term/(:num)', array('as' => 'active_term', 'uses'=>'settings@active_term'));

Route::get('settings/delete_bank/(:num)', array('as' => 'delete_bank', 'uses'=>'settings@delete_bank'));
Route::get('settings/delete_app_type/(:num)', array('as' => 'delete_app_type', 'uses'=>'settings@delete_app_type'));
Route::get('settings/delete_aca_session/(:num)', array('as' => 'delete_aca_session', 'uses'=>'settings@delete_aca_session'));
Route::get('settings/delete_app_pin/(:num)', array('as' => 'delete_app_pin', 'uses'=>'settings@delete_app_pin'));
Route::get('settings/delete_payment_category/(:num)', array('as' => 'delete_payment_category', 'uses'=>'settings@delete_payment_category'));


//    Settings Controller - POST
Route::post('settings', array('uses'=>'settings@index'));
Route::post('settings/assign_subject', array('uses'=>'settings@assign_subject'));
Route::post('settings/new_subject', array('uses'=>'settings@new_subject'));
Route::post('settings/edit_subject', array('uses'=>'settings@edit_subject'));
Route::post('settings/assign_class', array('uses'=>'settings@assign_class'));
Route::post('settings/new_class', array('uses'=>'settings@new_class'));
Route::post('settings/edit_class', array('uses'=>'settings@edit_class'));
    
Route::post('settings/manage_banks', array('uses'=>'settings@manage_banks'));
Route::post('settings/manage_app_type', array('uses'=>'settings@manage_app_type'));
Route::post('settings/manage_app_pin', array('uses'=>'settings@manage_app_pin'));
Route::post('settings/manage_aca_session', array('uses'=>'settings@manage_aca_session'));
Route::post('settings/manage_aca_term', array('uses'=>'settings@manage_aca_term'));
Route::post('settings/manage_payment_categories', array('uses'=>'settings@manage_payment_categories'));


//    Reports Controller - GET
Route::get('reports', array('as'=>'reports', 'uses'=>'reports@index'));
Route::get('reports/broadsheets', array('as'=>'session_broadsheet', 'uses'=>'reports@session_broadsheet'));
Route::get('reports/broadsheet/(:num)/(:num)', array('as'=>'class_broadsheets', 'uses'=>'reports@broadsheets'));
Route::get('reports/broadsheet/(:num)/(:num)/(:num)', array('as'=>'broadsheets', 'uses'=>'reports@broadsheet'));

//    Settings Controller - POST
Route::post('reports', array('uses'=>'reports@index'));


//    Admin Controller - GET
Route::get('admin/admissions', array('as' => 'admissions', 'uses'=>'admin@admissions'));
Route::get('admin/admissions_list', array('as' => 'admissions_list', 'uses'=>'admin@admissions_list'));
Route::get('admin/export_csv_list/(:num)', array('as' => 'export_csv_list', 'uses'=>'admin@export_csv_list'));
Route::get('admin/applicants_list', array('as' => 'applicants_list', 'uses'=>'admin@applicants_list'));
Route::get('admin/official_use/(:num)', array('as' => 'official_use', 'uses'=>'admin@official_use'));
Route::get('admin/approve_admission/(:num)', array('as' => 'approve_admission', 'uses'=>'admin@approve_admission'));


//    Admin Controller - POST
Route::post('admin/official_use', array('uses'=>'admin@official_use'));

//    Events Controller - GET
Route::get('events/calendar', array('as' => 'calendars', 'uses'=>'events@calendar'));
Route::get('events/notification', array('as' => 'notifications', 'uses'=>'events@notification'));
Route::get('events/new_event', array('as' => 'new_event', 'uses'=>'events@new_event'));
Route::get('events/edit_event/(:num)', array('as' => 'edit_event', 'uses'=>'events@edit_event'));
Route::get('events/delete_event/(:num)', array('as' => 'delete_event', 'uses'=>'events@delete_event'));
Route::get('events/events_feed', array('as' => 'events_feed', 'uses'=>'events@events_feed'));
Route::get('events/event_list', array('as' => 'event_list', 'uses'=>'events@event_list'));


//    Events Controller - POST
Route::post('events/new_event', array('uses'=>'events@new_event'));
Route::post('events/edit_event', array('uses'=>'events@edit_event'));

// Staff Controller - GET
Route::get('staff/payroll', array('as' => 'payroll', 'uses'=>'staff@index'));
Route::get('staff/new_staff', array('as' => 'new_staff', 'uses'=>'staff@new_staff'));
Route::get('staff/edit_staff/(:num)', array('as' => 'edit_staff', 'uses'=>'staff@edit_staff'));
Route::get('staff/staff_salary/(:num?)', array('as' => 'staff_salary', 'uses'=>'staff@staff_salary'));
Route::get('staff/staff_deduction/(:num?)', array('as' => 'staff_deduction', 'uses'=>'staff@staff_deduction'));
Route::get('staff/delete_staff/(:num)', array('as' => 'delete_staff', 'uses'=>'staff@delete_staff'));
Route::get('staff/staff_details/(:num)', array('as' => 'staff_details', 'uses'=>'staff@staff_details'));
Route::get('staff/staff_attendance', array('as' => 'staff_attendance', 'uses'=>'staff@staff_attendance'));
Route::get('staff/new_staff_attendance', array('as' => 'new_staff_attendance', 'uses'=>'staff@new_staff_attendance'));
Route::get('staff/incentives', array('as' => 'incentives', 'uses'=>'staff@incentives'));
Route::get('staff/salary_payslip/(:num)/(:num?)/(:any?)', array('as' => 'salary_payslip', 'uses'=>'staff@salary_payslip'));
Route::get('staff/delete_incentive/(:num)', array('as' => 'delete_incentive', 'uses'=>'staff@delete_incentive'));
Route::get('staff/delete_salary/(:num)', array('as' => 'delete_salary', 'uses'=>'staff@delete_salary'));
Route::get('staff/delete_deduction/(:num)', array('as' => 'delete_deduction', 'uses'=>'staff@delete_deduction'));

// Staff Controller - POST
Route::post('staff/edit_staff', array('uses'=>'staff@edit_staff'));
Route::post('staff/edit_staff_passport', array('uses'=>'staff@edit_staff_passport'));
Route::post('staff/new_staff', array('uses'=>'staff@new_staff'));
Route::post('staff/staff_attendance', array('uses'=>'staff@staff_attendance'));
Route::post('staff/staff_deduction', array('uses'=>'staff@staff_deduction'));
Route::post('staff/incentives', array('uses'=>'staff@incentives'));
Route::post('staff/staff_salary', array('uses'=>'staff@staff_salary'));




// Cron Controller - GET
Route::get('cron/event_cleaner',array('uses'=>'cron@event_cleaner'));








//    Laravel Related
Event::listen('laravel.log', function($type, $message)
{
    $message = date('Y-m-d H:i:s').' '.mb_strtoupper($type).' - '.$message;
    File::append(path('storage').'logs/'.date('Y-m-d').'.log', $message);
});

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
	if (Auth::guest()) return Redirect::to_route('user_login')->with('message',Ais::message_format('You must login to access that area!','error'));
});