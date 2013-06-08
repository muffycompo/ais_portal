<?php
/**
 * File Description here.
 * Author: Mfawa Alfred Onen
 * Date: 5/1/13
 * Version: v1.0
 * File: payments.php
 */

class Settings_Controller extends Base_Controller {
   public $restful = true;

    public function __construct(){
        parent::__construct();
        $this->filter('before','auth');
    }

//    Controller Actions - GET
    public function get_index(){
        return View::make('settings.setting_dashboard');
    }

    public function get_teachers(){
        $v_data['teachers'] = Setting::all_teachers();
        return View::make('settings.teachers',$v_data);
    }

    public function get_subjects(){
        $v_data['subjects'] = Setting::all_subjects();
        return View::make('settings.subjects',$v_data);
    }

    public function get_classes(){
        $v_data['classes'] = Setting::all_classes();
        return View::make('settings.classes',$v_data);
    }

    public function get_new_subject(){
        return View::make('settings.new_subject');
    }

    public function get_new_class(){
        return View::make('settings.new_class');
    }

    public function get_edit_class($class_id){
        $v_data['classes'] = Setting::show_class($class_id);
        return View::make('settings.edit_class',$v_data);
    }

    public function get_edit_subject($subject_id){
        $v_data['subject'] = Setting::show_subject($subject_id);
        return View::make('settings.edit_subject', $v_data);
    }

    public function get_assign_subject($id){
        $v_data['teacher'] = Setting::show_teacher((int) $id);
        $v_data['subjects'] = Setting::assigned_teacher_subjects((int) $id);
        return View::make('settings.assign_subject',$v_data);
    }

    public function get_unassign_subject($id, $subject_id, $class_id, $term_id){
        $unassign_subject = Setting::unassign_subject($id, $subject_id, $class_id, $term_id);
        if($unassign_subject === false){
            return Redirect::back()->with('message',Ais::message_format('An error occurred while un-assigning the subject, remove other references and try again!','error'));
        } else {
            return Redirect::back()->with('message',Ais::message_format('Subject un-assigned successfully!','success'));
        }
    }

    public function get_assign_class($id){
        $v_data['teacher'] = Setting::show_teacher((int) $id);
        $v_data['classes'] = Setting::assigned_teacher_class((int) $id, true);
        return View::make('settings.assign_class',$v_data);
    }

    public function post_assign_subject(){
        $teacher = Setting::assign_subject(Input::all());
        if( $teacher === false ){
         return Redirect::back()->with('message',Ais::message_format('An error occurred while assigning subject, please try again!','error'));
        } else {
         return Redirect::to_route('teachers')->with('message',Ais::message_format('Assigned Subject Successfully!','success'));
        }
     }

    public function post_assign_class(){
        $teacher = Setting::assign_class(Input::all());
        if( $teacher === false ){
         return Redirect::back()->with('message',Ais::message_format('An error occurred while assigning class, please try again!','error'));
        } else {
         return Redirect::to_route('teachers')->with('message',Ais::message_format('Assigned Class Successfully!','success'));
        }
     }

    public function post_new_class(){
        $validate = Setting::new_class_validation(Input::all());
        if( $validate === true ){
            $assessment = Setting::new_class(Input::all());
            if( $assessment === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while adding new class, please try again!','error'))->with_input();
            } else {
                return Redirect::to_route('ais_classes')->with('message',Ais::message_format('Class added successfully!','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

   public function post_new_subject(){
        $validate = Setting::new_subject_validation(Input::all());
        if( $validate === true ){
            $assessment = Setting::new_subject(Input::all());
            if( $assessment === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while adding new subject, please try again!','error'))->with_input();
            } else {
                return Redirect::to_route('ais_subjects')->with('message',Ais::message_format('Subject added successfully!','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

   public function post_edit_subject(){
        $validate = Setting::new_subject_validation(Input::all());
        if( $validate === true ){
            $assessment = Setting::edit_subject(Input::all());
            if( $assessment === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while updating subject, please try again!','error'))->with_input();
            } else {
                return Redirect::to_route('ais_subjects')->with('message',Ais::message_format('Subject Updated successfully!','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

   public function post_edit_class(){
        $validate = Setting::new_class_validation(Input::all());
        if( $validate === true ){
            $assessment = Setting::edit_class(Input::all());
            if( $assessment === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while updating class, please try again!','error'))->with_input();
            } else {
                return Redirect::to_route('ais_classes')->with('message',Ais::message_format('Class Updated successfully!','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function get_delete_subject($id){
        $delete_subject = Setting::delete_subject($id);
        if($delete_subject === false){
            return Redirect::back()->with('message',Ais::message_format('An error occurred while deleting the subject, remove other reference and try again!','error'));
        } else {
            return Redirect::back()->with('message',Ais::message_format('Subject successfully deleted!','success'));
        }
    }

    public function get_delete_class($id){
        $delete_class = Setting::delete_class($id);
        if($delete_class === false){
            return Redirect::back()->with('message',Ais::message_format('An error occurred while deleting the class, remove other reference and try again!','error'));
        } else {
            return Redirect::back()->with('message',Ais::message_format('Class successfully deleted!','success'));
        }
    }

}