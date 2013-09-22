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

    public function get_teachers(){
        $v_data['teachers'] = Setting::all_teachers();
        $v_data['nav'] = 'setting_nav';
        return View::make('settings.teachers',$v_data);
    }

    public function get_subjects(){
        $v_data['subjects'] = Setting::all_subjects();
        $v_data['nav'] = 'setting_nav';
        return View::make('settings.subjects',$v_data);
    }

    public function get_classes(){
        $v_data['classes'] = Setting::all_classes();
        $v_data['nav'] = 'setting_nav';
        return View::make('settings.classes',$v_data);
    }

    public function get_new_subject(){
        $v_data['nav'] = 'setting_nav';
        return View::make('settings.new_subject', $v_data);
    }

    public function get_new_class(){
        $v_data['nav'] = 'setting_nav';
        return View::make('settings.new_class', $v_data);
    }

    public function get_edit_class($class_id){
        $v_data['classes'] = Setting::show_class($class_id);
        $v_data['nav'] = 'setting_nav';
        return View::make('settings.edit_class',$v_data);
    }

    public function get_edit_subject($subject_id){
        $v_data['subject'] = Setting::show_subject($subject_id);
        $v_data['nav'] = 'setting_nav';
        return View::make('settings.edit_subject', $v_data);
    }

    public function get_assign_subject($id){
        $v_data['teacher'] = Setting::show_teacher((int) $id);
        $v_data['subjects'] = Setting::assigned_teacher_subjects((int) $id);
        $v_data['nav'] = 'setting_nav';
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
        $v_data['nav'] = 'setting_nav';
        return View::make('settings.assign_class',$v_data);
    }

    public function get_manage_banks(){
        $v_data['banks'] = Setting::all_banks();
        $v_data['nav'] = 'setting_nav';
        return View::make('settings.manage_banks',$v_data);
    }

    public function get_manage_app_type(){
        $v_data['app_types'] = Setting::all_application_types();
        $v_data['nav'] = 'setting_nav';
        return View::make('settings.manage_app_type',$v_data);
    }

    public function get_manage_app_pin(){
        $v_data['pins'] = Setting::all_pins();
        $v_data['nav'] = 'setting_nav';
        return View::make('settings.manage_app_pin',$v_data);
    }

    public function get_manage_aca_session(){
        $v_data['academic_sessions'] = Setting::all_academic_sessions();
        $v_data['nav'] = 'setting_nav';
        return View::make('settings.manage_aca_session',$v_data);
    }

    public function get_active_session($id){
        $delete = Setting::active_session($id);
        if($delete === false){
            return Redirect::back()->with('message',Ais::message_format('An error occurred while making the academic session active, please try again!','error'));
        } else {
            $session_name = Expand::academic_session($id);
            return Redirect::back()->with('message',Ais::message_format($session_name . ' Academic Session is now active!','success'));
        }
    }

    public function get_active_term($id){
        $delete = Setting::active_term($id);
        if($delete === false){
            return Redirect::back()->with('message',Ais::message_format('An error occurred while making the term active, please try again!','error'));
        } else {
            $term_name = Expand::term($id);
            return Redirect::back()->with('message',Ais::message_format($term_name . ' is now active!','success'));
        }
    }

    public function get_manage_aca_term(){
        $v_data['terms'] = Setting::all_academic_terms();
        $v_data['nav'] = 'setting_nav';
        return View::make('settings.manage_aca_term',$v_data);
    }

    public function get_manage_payment_categories(){
        $v_data['payment_categories'] = Setting::all_payment_categories();
        $v_data['nav'] = 'setting_nav';
        return View::make('settings.manage_payment_categories',$v_data);
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

    public function post_manage_banks(){
        $validate = Setting::banks_validation(Input::all());
        if( $validate === true ){
            $bank = Setting::new_bank(Input::all());
            if( $bank === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while adding the bank, please try again!','error'))->with_input();
            } else {
                return Redirect::back()->with('message',Ais::message_format('Bank Added successfully!','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_manage_app_type(){
        $validate = Setting::app_type_validation(Input::all());
        if( $validate === true ){
            $bank = Setting::new_app_type(Input::all());
            if( $bank === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while adding the application type, please try again!','error'))->with_input();
            } else {
                return Redirect::back()->with('message',Ais::message_format('Application Type Added successfully!','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_manage_app_pin(){
        $validate = Setting::app_pin_validation(Input::all());
        if( $validate === true ){
            $bank = Setting::new_app_pin(Input::all());
            if( $bank === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while generating the PIN, please try again!','error'))->with_input();
            } else {
                return Redirect::back()->with('message',Ais::message_format('PIN Number(s) generated successfully!','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_manage_aca_session(){
        $validate = Setting::aca_session_validation(Input::all());
        if( $validate === true ){
            $bank = Setting::new_aca_session(Input::all());
            if( $bank === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while adding the Academic Session, please try again!','error'))->with_input();
            } else {
                return Redirect::back()->with('message',Ais::message_format('Academic Session Added successfully!','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_manage_payment_categories(){
        $validate = Setting::payment_categories_validation(Input::all());
        if( $validate === true ){
            $bank = Setting::new_payment_category(Input::all());
            if( $bank === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while adding the Payment Category, please try again!','error'))->with_input();
            } else {
                return Redirect::back()->with('message',Ais::message_format('Payment Category Added successfully!','success'));
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


    public function get_delete_bank($id){
        $delete = Setting::delete_bank($id);
        if($delete === false){
            return Redirect::back()->with('message',Ais::message_format('An error occurred while deleting the bank, please try again!','error'));
        } else {
            return Redirect::back()->with('message',Ais::message_format('Bank successfully deleted!','success'));
        }
    }

    public function get_delete_app_type($id){
        $delete = Setting::delete_app_type($id);
        if($delete === false){
            return Redirect::back()->with('message',Ais::message_format('An error occurred while deleting the application type, please try again!','error'));
        } else {
            return Redirect::back()->with('message',Ais::message_format('Application Type successfully deleted!','success'));
        }
    }

    public function get_delete_aca_session($id){
        $delete = Setting::delete_aca_session($id);
        if($delete === false){
            return Redirect::back()->with('message',Ais::message_format('An error occurred while deleting the academic session, please try again!','error'));
        } else {
            return Redirect::back()->with('message',Ais::message_format('Academic Session successfully deleted!','success'));
        }
    }

    public function get_delete_payment_category($id){
        $delete = Setting::delete_payment_category($id);
        if($delete === false){
            return Redirect::back()->with('message',Ais::message_format('An error occurred while deleting the payment category, please try again!','error'));
        } else {
            return Redirect::back()->with('message',Ais::message_format('Payment Category successfully deleted!','success'));
        }
    }

    public function get_delete_app_pin($id){
        $delete = Setting::delete_app_pin($id);
        if($delete === false){
            return Redirect::back()->with('message',Ais::message_format('An error occurred while deleting the PIN Number, please try again!','error'));
        } else {
            return Redirect::back()->with('message',Ais::message_format('PIN Number successfully deleted!','success'));
        }
    }


}