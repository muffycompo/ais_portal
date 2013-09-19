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

    public function get_assessments(){
        $v_data['subjects'] = Result::teacher_subjects();
        $v_data['nav'] = 'result_nav';
        return View::make('results.assessments', $v_data);
    }

   public function get_assessment($subject_id, $class_id, $term_id){
        $v_data['subject_id'] = (int)$subject_id;
        $v_data['class_id'] = (int)$class_id;
        $v_data['term_id'] = (int)$term_id;
        $v_data['students'] = Result::result_report($v_data['subject_id'],$v_data['class_id'],$v_data['term_id']);
       $v_data['nav'] = 'result_nav';
        return View::make('results.assessment', $v_data);
    }

   public function get_term_result($term_id){
       $v_data['subject_results'] = Result::term_result_report((int)$term_id);
       $v_data['class_id'] = Ais::resolve_classid_from_userid(Session::get('user_id'));
       $v_data['term_id'] = $term_id;
       $v_data['biodata'] = Result::student_result_biodata();
       $v_data['subjects_offered'] = Result::subjects_offered('',$term_id);
       $v_data['total_score'] = Result::student_subjects_total_score('',$term_id);
       $v_data['final_average'] = Result::student_final_average('',$term_id);
       $v_data['final_position'] = Result::position_per_class('',$term_id);
       $v_data['final_grade'] = Result::final_grade('',$term_id);
       $v_data['number_in_class'] = Result::registered_students_in_class($v_data['class_id'],true);
       $v_data['class_average'] = Result::result_class_average('',$term_id);
       $v_data['nav'] = 'result_nav';
       return View::make('results.term_result', $v_data);
   }

   public function get_new_assessment($user_id, $subject_id, $class_id, $term_id){
        $v_data['subject_id'] = (int)$subject_id;
        $v_data['class_id'] = (int)$class_id;
        $v_data['term_id'] = (int)$term_id;
        $v_data['user'] = User::show_user((int)$user_id);
        $v_data['assessments'] = Result::student_assessments((int)$user_id,(int)$subject_id,(int)$class_id,$term_id,true);
       $v_data['nav'] = 'result_nav';
        return View::make('results.new_assessment', $v_data);
    }

   public function get_publish_result($user_id, $subject_id, $class_id, $term_id){
        $publish = Result::publish_result($user_id, $subject_id, $class_id, $term_id);
       if( $publish === false ){
           return Redirect::back()->with('message',Ais::message_format('An error occurred while publishing the result, please try again!','error'));
       } else {
           return Redirect::back()->with('message',Ais::message_format('Result published successfully!','success'));
       }
    }

    public function get_unpublish_result($user_id, $subject_id, $class_id, $term_id){
        $publish = Result::unpublish_result($user_id, $subject_id, $class_id, $term_id);
       if( $publish === false ){
           return Redirect::back()->with('message',Ais::message_format('An error occurred while unpublishing the result, please try again!','error'));
       } else {
           return Redirect::back()->with('message',Ais::message_format('Result unpublished successfully!','success'));
       }
    }

    public function get_questions(){
        $v_data['nav'] = 'result_nav';
        $v_data['questions'] = Result::all_questions();
        return View::make('results.questions', $v_data);
    }

    public function get_new_question(){
        $v_data['nav'] = 'result_nav';
        return View::make('results.new_question', $v_data);
    }

    public function get_delete_question($id, $file_name){
        $delete = Result::delete_question($id, $file_name);
        if( $delete === false ){
            return Redirect::back()->with('message',Ais::message_format('An error occurred while deleting the question, please try again!','error'));
        } else {
            return Redirect::back()->with('message',Ais::message_format('Question deleted successfully','success'));
        }
    }

    public function get_assignments(){
        $v_data['nav'] = (Session::get('role_id') == 2)? 'result_nav' : 'assignment_nav';
        $v_data['assignments'] = Result::all_assignments();
        return View::make('results.assignments', $v_data);
    }

    public function get_assignment_submissions(){
        $v_data['nav'] = (Session::get('role_id') == 2)? 'result_nav' : 'assignment_nav';
        $v_data['submissions'] = Result::all_assignment_submissions();
        return View::make('results.assignment_submissions', $v_data);
    }

    public function get_assignment_score($user_id, $assignment_id, $submission_id){
        $v_data['user_id'] = (int)$user_id;
        $v_data['assignment_id'] = (int)$assignment_id;
        $v_data['submission_id'] = (int)$submission_id;
        $v_data['nav'] = (Session::get('role_id') == 2)? 'result_nav' : 'assignment_nav';
        return View::make('results.assignment_score', $v_data);
    }

    public function get_new_assignment(){
        $v_data['nav'] = 'result_nav';
        return View::make('results.new_assignment', $v_data);
    }

    public function get_new_assignment_submission($id){
        $v_data['nav'] = 'assignment_nav';
        $v_data['assignment_id'] = (int)$id;
        return View::make('results.new_assignment_submission', $v_data);
    }

    public function get_attendance($user_id, $subject_id, $class_id, $term_id){
        $v_data['user_id'] = $user_id;
        $v_data['subject_id'] = $subject_id;
        $v_data['class_id'] = $class_id;
        $v_data['term_id'] = $term_id;
        $v_data['user'] = User::show_user($user_id);
        $v_data['nav'] = 'result_nav';
        return View::make('results.attendance', $v_data);
    }

    public function get_attendance_list($subject_id, $class_id, $term_id){
        $v_data['subject_id'] = $subject_id;
        $v_data['class_id'] = $class_id;
        $v_data['term_id'] = $term_id;
        $v_data['attendance'] = Result::attendance_list($subject_id, $class_id, $term_id);
        $v_data['nav'] = (Session::get('role_id') == 2)? 'result_nav' : 'assignment_nav';
        return View::make('results.attendance_list', $v_data);
    }

    public function get_delete_assignment($id, $file_name){
        $delete = Result::delete_assignment($id, $file_name);
        if( $delete === false ){
            return Redirect::back()->with('message',Ais::message_format('An error occurred while deleting the assignment/note, please try again!','error'));
        } else {
            return Redirect::back()->with('message',Ais::message_format('Assignment/Note deleted successfully','success'));
        }
    }




//    Controller Actions - POST

    public function post_new_assessment(){
        $assessment_type_id = Input::get('assessment_type_id');
        if($assessment_type_id == 1){
            $validate = Result::new_fa_assessment_validation(Input::all());
        } elseif($assessment_type_id == 2 || $assessment_type_id == 3){
            $validate = Result::new_sta_assessment_validation(Input::all());
        } else {
            $validate = Result::new_exam_assessment_validation(Input::all());
        }
        if( $validate === true ){
            $assessment = Result::new_assessment(Input::all());
            if( $assessment === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while adding result, please try again!','error'))->with_input();
            } else {
                return Redirect::to('results/assessment/' . Input::get('subject_id') . '/' . Input::get('class_id') .'/' . Input::get('term_id'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_new_question(){
        $validate = Result::new_question_validation(Input::all());
        if( $validate === true ){
            $parent = Result::new_question(Input::all());
            if( $parent === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while uploading the question, please try again!','error'))->with_input();
            } else {
                return Redirect::to_route('questions')->with('message',Ais::message_format('Question Uploaded successfully','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_new_assignment(){
        $validate = Result::new_assignment_validation(Input::all());
        if( $validate === true ){
            $parent = Result::new_assignment(Input::all());
            if( $parent === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while uploading the assignment/note, please try again!','error'))->with_input();
            } else {
                return Redirect::to_route('assignments')->with('message',Ais::message_format('Assignment/Note Uploaded successfully','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_new_assignment_submission(){
        $validate = Result::new_assignment_submission_validation(Input::all());
        if( $validate === true ){
            $parent = Result::new_assignment_submission(Input::all());
            if( $parent === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while uploading the assignment, please try again!','error'))->with_input();
            } else {
                return Redirect::to_route('assignments')->with('message',Ais::message_format('Assignment Uploaded successfully','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_assignment_score(){
        $validate = Result::assignment_score_validation(Input::all());
        if( $validate === true ){
            $parent = Result::assignment_score(Input::all());
            if( $parent === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while scoring the assignment, please try again!','error'))->with_input();
            } else {
                return Redirect::to_route('assignment_submissions')->with('message',Ais::message_format('Assignment Scored successfully','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_attendance(){
        $validate = Result::attendance_validation(Input::all());
        if( $validate === true ){
            $parent = Result::attendance(Input::all());
            $name = Ais::resolve_name(Input::get('user_id'));
            if( $parent === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while saving the attendance for '.$name.', please try again!','error'))->with_input();
            } else {
                return Redirect::to_route('assessment', array(Input::get('subject_id'), Input::get('class_id'), Input::get('term_id')))->with('message',Ais::message_format('Attendance for '.$name.' saved successfully','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }

    }

}