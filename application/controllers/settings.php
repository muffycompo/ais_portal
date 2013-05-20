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

    public function get_assign_subject($id){
        $v_data['teacher'] = Setting::show_teacher((int) $id);
        $v_data['subjects'] = Setting::assigned_teacher_subjects((int) $id, true);
        return View::make('settings.assign_subject',$v_data);
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

}