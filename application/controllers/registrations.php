<?php
/**
 * File Description here.
 * Author: Mfawa Alfred Onen
 * Date: 5/1/13
 * Version: v1.0
 * File: payments.php
 */

class Registrations_Controller extends Base_Controller {

    public $restful = true;

    public function __construct(){
        parent::__construct();
        $this->filter('before','auth');
    }

//    Controller Actions - GET
    public function get_biodata(){
        $v_data['user_meta'] = Registration::user_meta();
        $v_data['biodata'] = Registration::user_biodata();
        return View::make('registrations.biodata', $v_data);
    }

    public function get_schools_attended(){
        $v_data['schools'] = Registration::schools_attended();
        return View::make('registrations.schools_attended', $v_data);
    }

    public function get_new_school(){
        return View::make('registrations.new_school');
    }

   public function get_edit_school($id){
       $v_data['school'] = Registration::show_school($id);
       return View::make('registrations.edit_new_school', $v_data);
    }

    public function get_delete_school($id){
        $delete = Registration::delete_school($id);
        if( $delete === false ){
            return Redirect::back()->with('message',Ais::message_format('An error occurred while deleting your School!','error'));
        } else {
            return Redirect::back()->with('message',Ais::message_format('School deleted successfully!','success'));
        }
    }

    public function get_parent_info(){
        $v_data['parent'] = Registration::show_parent_info();
        return View::make('registrations.parent_info', $v_data);
    }

    public function get_medical_record(){
        $v_data['medical'] = Registration::show_medical_record();
        return View::make('registrations.medical_record', $v_data);
    }

   public function get_uploads(){
       $v_data['docs'] = Registration::supporting_documents();
        return View::make('registrations.uploads', $v_data);
    }

   public function get_attestation(){
        return View::make('registrations.attestation');
    }

   public function get_print_application($id = ''){
       $user_id = !empty($id)? (int)$id : Session::get('user_id');
       $v_data['user'] = User::show_user($user_id);
       $v_data['schools'] = Registration::schools_attended($user_id);
       $v_data['biodata'] = Registration::user_biodata($user_id);
       $v_data['parent_info'] = Registration::show_parent_info($user_id);
       $v_data['medical'] = Registration::show_medical_record($user_id);
        return View::make('registrations.print_application', $v_data);
    }

    public function get_delete_docs($doc_name){
         $delete = Registration::delete_docs($doc_name);
         if( $delete === false ){
             return Redirect::back()->with('message',Ais::message_format('An error occurred while deleting Document!','error'));
         } else {
             return Redirect::back()->with('message',Ais::message_format('Document deleted successfully!','success'));
         }
     }

//    Controller Actions - POST

    public function post_biodata(){
        $validate = Registration::biodata_validation(Input::all());
        if( $validate === true ){
            $biodata = Registration::biodata(Input::all());
            if( $biodata === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while saving your Bio-Data, please try again!','error'))->with_input();
            } else {
                return Redirect::back()->with('message',Ais::message_format('Your Bio-Data has been saved successfully','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_new_school(){
        $validate = Registration::new_school_validation(Input::all());
        if( $validate === true ){
            $school = Registration::new_school(Input::all());
            if( $school === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while adding your school, please try again!','error'))->with_input();
            } else {
                return Redirect::to_route('schools_attended')->with('message',Ais::message_format('School has been added successfully','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_edit_new_school(){
        $validate = Registration::edit_new_school_validation(Input::all());
        if( $validate === true ){
            $school = Registration::edit_new_school(Input::all());
            if( $school === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while updating your school, please try again!','error'))->with_input();
            } else {
                return Redirect::to_route('schools_attended')->with('message',Ais::message_format('School has been updated successfully','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_parent_info(){
        $validate = Registration::parent_info_validation(Input::all());
        if( $validate === true ){
            $parent = Registration::parent_info(Input::all());
            if( $parent === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while saving your Parental Information, please try again!','error'))->with_input();
            } else {
                return Redirect::back()->with('message',Ais::message_format('Your Parental Information has been saved successfully','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_medical_record(){
        $validate = Registration::medical_record_validation(Input::all());
        if( $validate === true ){
            $parent = Registration::medical_record(Input::all());
            if( $parent === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while saving your Medical Record, please try again!','error'))->with_input();
            } else {
                return Redirect::back()->with('message',Ais::message_format('Your Medical Record has been saved successfully','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_upload_photo(){
        $validate = Registration::upload_photo_validation(Input::all());
        if( $validate === true ){
            $parent = Registration::upload_photo(Input::all());
            if( $parent === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while uploading Passport Photo, please try again!','error'))->with_input();
            } else {
                return Redirect::back()->with('message',Ais::message_format('Passport Photo Uploaded successfully','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_upload_docs(){
        $validate = Registration::upload_docs_validation(Input::all());
        if( $validate === true ){
            $parent = Registration::upload_docs(Input::all());
            if( $parent === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while uploading Document, please try again!','error'))->with_input();
            } else {
                return Redirect::back()->with('message',Ais::message_format('Document Uploaded successfully','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_finalize_application(){
        $validate = Registration::finalize_application_validation(Input::all());
        if( $validate === true ){
            $parent = Registration::finalize_application(Input::all());
            if( $parent === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while finalizing your Application, please try again!','error'))->with_input();
            } else {
                return Redirect::to_route('user_dashboard');
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

}