<?php

class Staff_Controller extends Base_Controller {

    public $restful = true;

    public function __construct(){
        parent::__construct();
        $this->filter('before','auth');
    }

    public function get_index(){
        // List all staff
        $v_data['staff'] = Staff::staff_list();
        $v_data['nav'] = 'staff_nav';
        return View::make('staff.stafflist',$v_data);
    }

    public function get_new_staff(){
        // Show New staff form
        $v_data['nav'] = 'staff_nav';
        return View::make('staff.new_staff',$v_data);
    }

    public function get_edit_staff($id){
        // Show Edit Staff form
        $v_data['nav'] = 'staff_nav';
        $v_data['staff'] = Staff::staff_details($id);
        return View::make('staff.edit_staff',$v_data);
    }

    public function get_staff_salary($id){
        // Show staff salary setting form + Bonus
        $v_data['nav'] = 'staff_nav';
        $v_data['staff'] = Staff::staff_details($id);
        $v_data['salaries'] = Staff::staff_salary($id);
        return View::make('staff.staff_salary',$v_data);

    }

    public function get_staff_deduction($id){
        // Show staff deductions + Form
        $v_data['nav'] = 'staff_nav';
        $v_data['staff'] = Staff::staff_details($id);
        $v_data['deductions'] = Staff::staff_deduction($id);
        return View::make('staff.staff_deduction',$v_data);

    }

    public function get_delete_staff($id){
        // Delete Staff
       $delete = Staff::delete_staff($id);
       if( $delete === false ){
           return Redirect::back()->with('message',Ais::message_format('An error occurred while deleting the staff record, please try again!','error'));
       } else {
           return Redirect::back()->with('message',Ais::message_format('Staff record deleted successfully!','success'));
       }
    }

    public function get_staff_details($id){
        // Show staff details
        $v_data['nav'] = 'staff_nav';
        $v_data['details'] = Staff::staff_details($id);
        return View::make('staff.staff_details',$v_data);
    }

    public function get_salary_payslip($id, $staff_id, $date){
        // Show staff details
        $v_data['nav'] = 'staff_nav';
        $v_data['details'] = Staff::staff_details($staff_id);
        $v_data['salary_amount'] = Staff::monthly_salary($id, $date);
        return View::make('staff.staff_payslip',$v_data);
    }

    public function get_staff_attendance(){
        // Show staff attendance List
    }

    public function get_incentives(){
        // Show List of Incentives
        $v_data['nav'] = 'staff_nav';
        $v_data['incentives'] = Staff::all_staff_incentives();
        return View::make('staff.staff_incentives',$v_data);
    }

    public function get_delete_incentive($id){
        // Delete Staff Incentive
       $delete = Staff::delete_incentive($id);
       if( $delete === false ){
           return Redirect::back()->with('message',Ais::message_format('An error occurred while deleting the Incentive, please try again!','error'));
       } else {
           return Redirect::back()->with('message',Ais::message_format('Incentive deleted successfully!','success'));
       }
    }

    public function get_delete_salary($id){
        // Delete Staff Salary
       $delete = Staff::delete_salary($id);
       if( $delete === false ){
           return Redirect::back()->with('message',Ais::message_format('An error occurred while deleting the Salary, please try again!','error'));
       } else {
           return Redirect::back()->with('message',Ais::message_format('Salary deleted successfully!','success'));
       }
    }

    public function get_delete_deduction($id){
        // Delete Staff Deduction
       $delete = Staff::delete_deduction($id);
       if( $delete === false ){
           return Redirect::back()->with('message',Ais::message_format('An error occurred while deleting the Deduction, please try again!','error'));
       } else {
           return Redirect::back()->with('message',Ais::message_format('Deduction deleted successfully!','success'));
       }
    }

    public function post_edit_staff(){
        // Post Edited staff form values
        $validate = Staff::edit_user_validation(Input::all());
        if($validate === true){
            $new_user = Staff::edit_staff(Input::all());
           if( $new_user === false ){
               return Redirect::to_route('staff_details',array(Input::get('staff_id')))->with('message',Ais::message_format('An error occurred while updating the staff record, please try again!','error'));
           } else {
               return Redirect::to_route('staff_details',array(Input::get('staff_id')))->with('message',Ais::message_format('Staff record updated successfully!','success'));
           }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_new_staff(){
        // Post New staff form values
        $validate = Staff::new_user_validation(Input::all());
        if($validate === true){
            $new_user = Staff::new_staff(Input::all());
           if( $new_user === false ){
               return Redirect::to_route('payroll')->with('message',Ais::message_format('An error occurred while adding the staff record, please try again!','error'));
           } else {
               return Redirect::to_route('payroll')->with('message',Ais::message_format('Staff record added successfully!','success'));
           }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_edit_staff_passport(){
        // Post New staff form values
        $validate = Staff::staff_passport_validation(Input::all());
        if($validate === true){
            $new_user = Staff::staff_passport(Input::all());
           if( $new_user === false ){
               return Redirect::back()->with('message',Ais::message_format('An error occurred while updating the passport, please try again!','error'));
           } else {
               return Redirect::back()->with('message',Ais::message_format('Passport updated successfully!','success'));
           }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_new_staff_attendance(){
        // Post new staff attendance form values
    }

    public function post_incentives(){
        // Post new staff incentives form values
        $validate = Staff::incentive_validation(Input::all());
        if($validate === true){
            $incentive = Staff::staff_incentive(Input::all());
           if( $incentive === false ){
               return Redirect::back()->with('message',Ais::message_format('An error occurred while adding the Incentive, please try again!','error'));
           } else {
               return Redirect::back()->with('message',Ais::message_format('Incentive added successfully!','success'));
           }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_staff_salary(){
        // Post new staff incentives form values
        $validate = Staff::staff_salary_validation(Input::all());
        if($validate === true){
            $salary = Staff::salary(Input::all());
           if( $salary === false ){
               return Redirect::back()->with('message',Ais::message_format('An error occurred while adding the Salary, please try again!','error'));
           } else {
               return Redirect::back()->with('message',Ais::message_format('Salary added successfully!','success'));
           }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_staff_deduction(){
        // Post new staff incentives form values
        $validate = Staff::staff_deduction_validation(Input::all());
        if($validate === true){
            $salary = Staff::deduction(Input::all());
           if( $salary === false ){
               return Redirect::back()->with('message',Ais::message_format('An error occurred while adding the Deduction, please try again!','error'));
           } else {
               return Redirect::back()->with('message',Ais::message_format('Deduction added successfully!','success'));
           }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

}