<?php
/**
 * File Description here.
 * Author: Mfawa Alfred Onen
 * Date: 5/1/13
 * Version: v1.0
 * File: payments.php
 */

class Results_Controller extends Base_Controller {

   public $restful = true;

    public function __construct(){
        parent::__construct();
        $this->filter('before','auth');
    }

//    Controller Actions - GET
    public function get_index(){
        return View::make('results.result_dashboard');
    }

    public function get_assessments(){
        $v_data['subjects'] = Result::teacher_subjects();
        return View::make('results.assessments', $v_data);
    }

   public function get_assessment($subject_id, $class_id){
        $v_data['subject_id'] = (int)$subject_id;
        $v_data['class_id'] = (int)$class_id;
//        $v_data['students'] = Result::registered_students_in_class($v_data['class_id']);
        $v_data['students'] = Result::result_report($v_data['subject_id'],$v_data['class_id']);
        return View::make('results.assessment', $v_data);
    }

   public function get_new_assessment($user_id, $subject_id, $class_id){
        $v_data['subject_id'] = (int)$subject_id;
        $v_data['class_id'] = (int)$class_id;
        $v_data['user'] = User::show_user((int)$user_id);
        $v_data['assessments'] = Result::student_assessments((int)$user_id,(int)$subject_id,(int)$class_id,true);
        return View::make('results.new_assessment', $v_data);
    }

   public function get_publish_result($user_id, $subject_id, $class_id){
        $publish = Result::publish_result($user_id, $subject_id, $class_id);
       if( $publish === false ){
           return Redirect::back()->with('message',Ais::message_format('An error occurred while publishing the result, please try again!','error'));
       } else {
           return Redirect::back()->with('message',Ais::message_format('Result published successfully!','error'));
       }
    }

   public function get_unpublish_result($user_id, $subject_id, $class_id){
        $publish = Result::unpublish_result($user_id, $subject_id, $class_id);
       if( $publish === false ){
           return Redirect::back()->with('message',Ais::message_format('An error occurred while unpublishing the result, please try again!','error'));
       } else {
           return Redirect::back()->with('message',Ais::message_format('Result unpublished successfully!','error'));
       }
    }

//    Controller Actions - POST

    public function post_new_assessment(){
        $validate = Result::new_assessment_validation(Input::all());
        if( $validate === true ){
            $assessment = Result::new_assessment(Input::all());
            if( $assessment === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while adding result, please try again!','error'))->with_input();
            } else {
                return Redirect::to('results/assessment/' . Input::get('subject_id') . '/' . Input::get('class_id'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

}