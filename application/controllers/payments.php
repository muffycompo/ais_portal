<?php
/**
 * File Description here.
 * Author: Mfawa Alfred Onen
 * Date: 5/1/13
 * Version: v1.0
 * File: payments.php
 */

class Payments_Controller extends Base_Controller {

   public $restful = true;

    public function __construct(){
        parent::__construct();
        $this->filter('before','auth');
    }

//    Controller Actions - GET

    public function get_pins(){
        $v_data['pin_payments'] = Payment::all_pin_payments();
        $v_data['nav'] = 'payment_nav';
        return View::make('payments.pins', $v_data);
    }

    public function get_pin_receipt($payment_id){
        $v_data['payment'] = Payment::pin_payment((int)$payment_id);
        return View::make('payments.pin_payment_receipt',$v_data);
    }

    public function get_fee_receipt($payment_id){
        $v_data['payment'] = (Object) Payment::fee_payment((int)$payment_id);
        return View::make('payments.fee_payment_receipt',$v_data);
    }

    public function get_pin_slip($pin_id){
        $v_data['pin'] = Payment::show_pin((int)$pin_id);
        return View::make('payments.pin_slip', $v_data);
    }

    public function get_new_pin(){
        $v_data['nav'] = 'payment_nav';
        return View::make('payments.new_pin', $v_data);
    }

    public function get_new_fee(){
        $v_data['nav'] = '';
        return View::make('payments.new_fee', $v_data);
    }

    public function get_add_new_fee(){
        $v_data['nav'] = 'payment_nav';
        return View::make('payments.add_new_fee', $v_data);
    }

    public function get_edit_pin_payment($id){
        $v_data['pin_payment'] = Payment::pin_payment($id);
        $v_data['nav'] = 'payment_nav';
        return View::make('payments.edit_pin_payment', $v_data);
    }

    public function get_edit_fee_payment($id){
        $v_data['fee_payment'] = Payment::fee_payment($id);
        $v_data['nav'] = 'payment_nav';
        return View::make('payments.edit_fee_payment', $v_data);
    }

    public function get_edit_fee_schedule($id){
        $v_data['fee_schedule'] = Payment::edit_fee_schedule($id);
        $v_data['nav'] = 'payment_nav';
        return View::make('payments.edit_fee_schedule', $v_data);
    }

    public function get_fees(){
        $v_data['fee_payments'] = Payment::all_fee_payments();
        $v_data['nav'] = 'payment_nav';
        return View::make('payments.fees', $v_data);
    }

    public function get_student_fees(){
        $v_data['fee_payments'] = Payment::student_fee_payments();
        $v_data['nav'] = 'payment_nav';
        return View::make('payments.student_fees', $v_data);
    }

    public function get_fees_schedule(){
        $v_data['nav'] = 'payment_nav';
        return View::make('payments.fees_schedule', $v_data);
    }

    public function get_fees_schedule_term($term_id){
        $v_data['classes'] = Setting::all_classes();
        $v_data['term_id'] = (int)$term_id;
        $v_data['nav'] = 'payment_nav';
        return View::make('payments.fees_schedule_term', $v_data);
    }

    public function get_class_fee_schedule($term_id, $class_id){
        $v_data['fees'] = Payment::fee_schedule($term_id, $class_id);
        $v_data['term_id'] = $term_id;
        $v_data['class_id'] = $class_id;
        $v_data['total_amount'] = Payment::fee_schedule_amount($term_id, $class_id);
        $v_data['nav'] = 'payment_nav';
        return View::make('payments.fees_schedule_class', $v_data);
    }

    public function get_delete_fee_schedule($id){
         $delete_schedule = Payment::delete_fee_schecule($id);
        if($delete_schedule){
            return Redirect::back()->with('message',Ais::message_format('Fee schedule deleted successfully!','success'))->with_input();
        } else {
            return Redirect::back()->with('message',Ais::message_format('An error occurred while deleting the fee schedule, please try again!','error'))->with_input();
        }
     }

    public function get_delete_fee_payment($id){
         $delete_schedule = Payment::delete_fee_payment($id);
        if($delete_schedule){
            return Redirect::back()->with('message',Ais::message_format('Fee Payment deleted successfully!','success'))->with_input();
        } else {
            return Redirect::back()->with('message',Ais::message_format('An error occurred while deleting the fee payment, please try again!','error'))->with_input();
        }
     }




//    Controller Actions - POST

    public function post_new_pin(){
        $validate = Payment::pin_payment_validation(Input::all());
        if( $validate === true ){
            $pin_payment = Payment::new_pin_payment(Input::all());
            if( $pin_payment === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while adding the payment, please try again!','error'))->with_input();
            } else {
                return Redirect::to_route('pin_payments');
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

   public function post_new_fee(){
        $validate = Payment::fee_payment_validation(Input::all());
        if( $validate === true ){
            $pin_payment = Payment::new_fee_payment(Input::all());
            if( $pin_payment === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while adding the payment, please try again!','error'))->with_input();
            } else {
                return Redirect::to_route('fee_payments');
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

   public function post_add_new_fee(){
        $validate = Payment::add_fee_validation(Input::all());
        if( $validate === true ){
            $new_fee = Payment::add_new_fee(Input::all());
            if( $new_fee === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while adding the payment, please try again!','error'))->with_input();
            } else {
                return Redirect::back()->with('message',Ais::message_format('New fee added for '.Expand::payment_category(Input::get('payment_category_id')).' successfully!','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_edit_pin_payment(){
        $validate = Payment::edit_pin_payment_validation(Input::all());
        if( $validate === true ){
            $pin_payment = Payment::edit_pin_payment(Input::all());
            if( $pin_payment === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while updating the payment, please try again!','error'));
            } else {
                return Redirect::to_route('pin_payments');
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

   public function post_edit_fee_payment(){
        $validate = Payment::edit_fee_payment_validation(Input::all());
        if( $validate === true ){
            $pin_payment = Payment::edit_fee_payment(Input::all());
            if( $pin_payment === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while updating the payment, please try again!','error'));
            } else {
                return Redirect::to_route('fee_payments');
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

   public function post_edit_fee_schedule(){
        $validate = Payment::edit_fee_schedule_validation(Input::all());
        if( $validate === true ){
            $pin_payment = Payment::add_new_fee(Input::all());
            if( $pin_payment === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while updating the fee schedule, please try again!','error'));
            } else {
                return Redirect::to('payments/class_fee_schedule/' . Input::get('term_id') . '/' . Input::get('class_id'))->with('message',Ais::message_format('Fee schedule updated successfully!','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }


}