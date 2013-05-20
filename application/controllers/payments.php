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

//    Controller Actions - GET
    public function get_index(){
        return View::make('payments.payment_dashboard');
    }

    public function get_pins(){
        $v_data['pin_payments'] = Payment::all_pin_payments();
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
        return View::make('payments.new_pin');
    }

    public function get_new_fee(){
        return View::make('payments.new_fee');
    }

    public function get_edit_pin_payment($id){
        $v_data['pin_payment'] = Payment::pin_payment($id);
        return View::make('payments.edit_pin_payment', $v_data);
    }

    public function get_edit_fee_payment($id){
        $v_data['fee_payment'] = Payment::fee_payment($id);
        return View::make('payments.edit_fee_payment', $v_data);
    }

    public function get_fees(){
        $v_data['fee_payments'] = Payment::all_fee_payments();
        return View::make('payments.fees', $v_data);
    }

    public function get_student_fees(){
        $v_data['fee_payments'] = Payment::student_fee_payments();
        return View::make('payments.student_fees', $v_data);
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


}