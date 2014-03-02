<?php

class Reports_Controller extends Base_Controller {

    public $restful = true;

    public function __construct(){
        parent::__construct();
        $this->filter('before','auth');
    }

    public function get_session_broadsheet()
    {
        $v_data['sessions'] = Report::all_academic_sessions();
        $v_data['nav'] = 'report_nav';
        return View::make('reports/session_broadsheet', $v_data);
    }

    public function get_students_nos()
    {
        $v_data['students'] = Report::all_student_numbers();
        $v_data['nav'] = 'report_nav';
        return View::make('reports/students_nos', $v_data);
    }

    public function get_staff_nos()
    {
        $v_data['students'] = Report::all_staff_numbers();
        $v_data['nav'] = 'report_nav';
        return View::make('reports/staff_nos', $v_data);
    }

    public function get_students_gender()
    {
        $v_data['students'] = Report::all_students_gender();
        $v_data['nav'] = 'report_nav';
        return View::make('reports/students_gender', $v_data);
    }

    public function get_students_state()
    {
        $v_data['students'] = Report::all_students_state();
        $v_data['nav'] = 'report_nav';
        return View::make('reports/students_state', $v_data);
    }

    public function get_download_no_list($download_code)
    {
        $code = base64_decode($download_code);
        return Report::all_no_list($code);
    }

    public function get_download_gender_list($download_code)
    {
        $code = base64_decode($download_code);
        return Report::all_gender_list($code);
    }

    public function get_download_state_list($download_code)
    {
        $code = base64_decode($download_code);
        return Report::all_state_list($code);
    }

   public function get_broadsheets($session_id, $term_id)
    {
        $role_id = Session::get('role_id');
        $user_id = Session::get('user_id');

        $v_data['session_id'] = (int) $session_id;
        $v_data['term_id'] = (int) $term_id;
        $v_data['classes'] = ( $role_id == 2 )? Setting::assigned_teacher_class_report($user_id) : Setting::all_classes();
        $v_data['nav'] = 'report_nav';
        return View::make('reports/classes_broadsheet', $v_data);
    }

    public function get_broadsheet($session_id, $term_id,$class_id)
    {
        set_time_limit(0);
        $v_data['class_id'] = (int) $class_id;
        $v_data['session_id'] = (int) $session_id;
        $v_data['sn'] = 1;
        $v_data['term_id'] = (int)$term_id;
        $v_data['subjects_offered'] = Report::registered_subjects_per_class($class_id,$term_id,$session_id);
        $v_data['subjects_total'] = Report::report_subject_total($class_id,$term_id, $session_id);
        $v_data['students'] = Report::reports_student_biodata($class_id);
        $v_data['nav'] = 'report_nav';
        return View::make('reports/broadsheet', $v_data);
    }

}