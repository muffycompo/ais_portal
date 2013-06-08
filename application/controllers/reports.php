<?php

class Reports_Controller extends Base_Controller {

    public $restful = true;

    public function __construct(){
        parent::__construct();
        $this->filter('before','auth');
    }

	public function get_index()
	{
		return View::make('reports.report_dashboard');
	}

    public function get_session_broadsheet()
    {
        $v_data['sessions'] = Report::all_academic_sessions();
        return View::make('reports/session_broadsheet', $v_data);
    }

   public function get_broadsheets($session_id, $term_id)
    {
        $v_data['session_id'] = (int) $session_id;
        $v_data['term_id'] = (int) $term_id;
        $v_data['classes'] = Setting::all_classes();
        return View::make('reports/classes_broadsheet', $v_data);
    }

    public function get_broadsheet($session_id, $term_id,$class_id)
    {
        $v_data['class_id'] = (int) $class_id;
        $v_data['session_id'] = (int) $session_id;
        $v_data['sn'] = 1;
        $v_data['term_id'] = (int)$term_id;
        $v_data['subjects_offered'] = Report::registered_subjects_per_class($class_id,$term_id,$session_id);
        $v_data['subjects_total'] = Report::report_subject_total($class_id,$term_id, $session_id);
        $v_data['students'] = Report::reports_student_biodata($class_id);
        return View::make('reports/broadsheet', $v_data);
    }

}