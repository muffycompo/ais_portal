<?php
/**
 * File Description here.
 * Author: Mfawa Alfred Onen
 * Date: 5/1/13
 * Version: v1.0
 * File: user.php
 */

class Payment extends Basemodel {

//  Validation Rules
    private static $pin_payment_rules = array(
        'firstname' => 'required|min:3',
        'surname' => 'required|min:3',
        'amount' => 'required|numeric',
    );

    private static $fee_payment_rules = array(
        'admission_no' => 'required|min:3',
        'paid_amount' => 'required|min:3',
        'teller_no' => 'required|numeric',
    );

   private static $add_fee_payment_rules = array(
        'paid_amount' => 'required|numeric',
    );

    private static $user_rules = array(
        'firstname' => 'required|min:3',
        'surname' => 'required|min:3',
        'email' => 'required|email|unique:users',
        'password' => 'required|min:5',
    );

   private static $edit_user_rules = array(
        'firstname' => 'required|min:3',
        'surname' => 'required|min:3',
        'password' => 'min:5',
    );

//  Validation
    public static function pin_payment_validation($input){
        return static::validation($input, static::$pin_payment_rules);
    }

    public static function fee_payment_validation($input){
        return static::validation($input, static::$fee_payment_rules);
    }

    public static function add_fee_validation($input){
        return static::validation($input, static::$add_fee_payment_rules);
    }

   public static function edit_fee_schedule_validation($input){
        return static::validation($input, static::$add_fee_payment_rules);
    }

   public static function edit_pin_payment_validation($input){
        return static::validation($input, static::$pin_payment_rules);
    }

  public static function edit_fee_payment_validation($input){
        return static::validation($input, static::$fee_payment_rules);
    }

    public static function new_user_validation($input){
        return static::validation($input, static::$user_rules);
    }

    public static function edit_user_validation($input){
        return static::validation($input, static::$edit_user_rules);
    }


//  DB Inserts
    public static function new_pin_payment($data){
        $user_id = Session::get('user_id');
        $new_pin_data = array(
            'applicant_firstname' => Str::title($data['firstname']),
            'applicant_surname' => Str::title($data['surname']),
            'amount' => $data['amount'],
            'receipt_no' => Ais::generate_receipt_no(1,8),
            'payment_date' => Ais::current_date(),
            'accountant' => Ais::resolve_name($user_id),
            'pin_id' => Ais::get_pin_id(),
        );
        $new_pin = DB::table('pin_payments')->insert($new_pin_data);
        if( $new_pin ) {
            static::update_pin_issuance($new_pin_data['pin_id']);
            return $new_pin;
        } else {
            return false;
        }

    }

    public static function new_fee_payment($data){
        $user_id = Session::get('user_id');
        $new_fee_data = array(
            'admission_no' => $data['admission_no'],
            'paid_amount' => $data['paid_amount'],
            'date_of_payment' => Ais::current_date(),
            'accountant_name' => Ais::resolve_name($user_id),
            'teller_no' => $data['teller_no'],
            'receipt_no' => Ais::generate_receipt_no(1,8),
            'class_id' => $data['class_id'],
            'term_id' => $data['term_id'],
            'academic_session_id' => $data['academic_session_id'],
            'payment_category_id' => $data['payment_category_id'],
        );
        $new_fee = DB::table('payments')->insert($new_fee_data);
        if( $new_fee ) {
            return $new_fee;
        } else {
            return false;
        }

    }

    public static function add_new_fee($data){
        $fee_data = array(
            'amount' => $data['paid_amount'],
            'payment_category_id' => $data['payment_category_id'],
            'class_id' => $data['class_id'],
            'term_id' => $data['term_id'],
            'recurring_payment' => $data['recurring_payment'],
        );
        if(isset($data['fee_schedule_id'])) {
            $fee = DB::table('schedule_of_fees')->where('id','=',$data['fee_schedule_id'])->update($fee_data);
        } else {
            $fee = DB::table('schedule_of_fees')->insert($fee_data);
        }

        if( $fee ) {
            return $fee;
        } else {
            return false;
        }

    }


//  DB Updates
    protected static function update_pin_issuance($pin_id){
        DB::table('pins')->where('id','=',$pin_id)->update(array('issuance_status' => 1));
    }
   public static function edit_pin_payment($data){
       $id = (int) $data['payment_id'];
       $edit_pin_data = array(
           'applicant_firstname' => Str::title($data['firstname']),
           'applicant_surname' => Str::title($data['surname']),
           'amount' => $data['amount'],
       );
       $edit_pin = DB::table('pin_payments')->where('id','=', $id)->update($edit_pin_data);
       if( $edit_pin ) {
           return true;
       } else {
           return false;
       }
    }
    public static function edit_fee_payment($data){
       $id = (int) $data['fee_id'];
       $edit_fee_data = array(
           'admission_no' => $data['admission_no'],
           'paid_amount' => $data['paid_amount'],
           'teller_no' => $data['teller_no'],
           'class_id' => $data['class_id'],
           'term_id' => $data['term_id'],
           'academic_session_id' => $data['academic_session_id'],
           'payment_category_id' => $data['payment_category_id'],
       );
       $edit_fee = DB::table('payments')->where('id','=', $id)->update($edit_fee_data);
       if( $edit_fee ) {
           return true;
       } else {
           return false;
       }
    }
//  DB Deletes
    public static function delete_user($user_id){
        $delete = DB::table('users')->where('id','=',$user_id)->delete();
        if( $delete ){ return true; } else { return false; }
    }

    public static function delete_fee_schecule($id){
        $delete = DB::table('schedule_of_fees')->where('id','=',$id)->delete();
        if( $delete ){ return true; } else { return false; }
    }

//  Secondary DB Queries
    public static function check_pin($pin){
        $pin_count = DB::table('pins')->where('pin_no','=',$pin)->where('usage_status','=',0)
                    ->where('issuance_status','=',1)->count();
        if($pin_count == 1){return true;} else { return false;}
    }

    public static function all_pin_payments(){
        $pin_payments = DB::table('pin_payments')->order_by('id','desc')->get();
        if( $pin_payments ){
            return $pin_payments;
        } else {
            return null;
        }
    }

    public static function all_fee_payments(){
        $fee_payments = DB::table('payments')->order_by('id','desc')->get();
        if( $fee_payments ){
            return $fee_payments;
        } else {
            return null;
        }
    }

    public static function student_fee_payments(){
        $user_id = Session::get('user_id');
        $admission_no = Ais::resolve_admission_no_from_userid($user_id);
        $fee_payments = DB::table('payments')->where('admission_no','=',$admission_no)->order_by('id','desc')->get();
        if( $fee_payments ){
            return $fee_payments;
        } else {
            return null;
        }
    }

   public static function pin_payment($pin_payment_id){
       $pin_payments = DB::table('pin_payments')->where('id','=',$pin_payment_id)->first();
        if( $pin_payments ){
            return $pin_payments;
        } else {
            return false;
        }
    }

   public static function fee_payment($fee_payment_id){
       $fee_payments = DB::table('payments')->where('id','=',$fee_payment_id)->first();
       $user_id = Ais::resolve_userid_from_admission_no($fee_payments->admission_no);
       $user = DB::table('users')->where('id','=', $user_id)->first();
        if( $fee_payments && $user ){
            $fee_payments = (array)$fee_payments;
            $user = (array)$user;
            return array_merge($fee_payments, $user);
        } else {
            return false;
        }
    }

   public static function edit_fee_schedule($fee_schedule_id){
       $fee_schedule = DB::table('schedule_of_fees')->where('id','=',$fee_schedule_id)->first();
        if( $fee_schedule ){
            return $fee_schedule;
        } else {
            return null;
        }
    }

    public static function fee_schedule($term_id, $class_id){
            $status = 2; // Default to 2 for current students
            $fees = static::get_fees($class_id, $term_id, $status);
            if($fees == false){
                return null;
            } else {
                return $fees;
            }
        }

    public static function fee_schedule_amount($term_id, $class_id){
            $status = 2; // Default to 2 for current students
            $fees_amount = static::get_fees_amount($class_id, $term_id, $status);
            if($fees_amount == false){
                return 0;
            } else {
                return $fees_amount;
            }
        }

    public static function show_pin($pin_id){
           $pin = DB::table('pins')->where('id','=',$pin_id)->first(array('pin_no'));
            if( $pin ){
                return $pin;
            } else {
                return false;
            }
        }

   public static function edit_user($data){
       $user_id = $data['user_id'];
       $edit_user = array(
           'firstname' => Str::title($data['firstname']),
           'surname' => Str::title($data['surname']),
           'role_id' => $data['role_id'],
       );
        if( ! empty($data['password']) ) { $edit_user['password'] = Hash::make($data['password']); }
        $users = DB::table('users')->where('id','=',$user_id)->update($edit_user);
        if( $users ){
            return $users;
        } else {
            return false;
        }
    }

//  Tertiary DB Queries - Schedule of Fees
    protected static function get_fees($class_id, $term_id, $student_status, $recurring = ''){
        if(!empty($recurring)){
            $schedule_of_fees = DB::table('schedule_of_fees')->where('class_id','=',$class_id)->where('term_id','=',$term_id)->where('recurring_payment','=',$recurring)->where('status','=',$student_status)->get();
        } else {
            $schedule_of_fees = DB::table('schedule_of_fees')->where('class_id','=',$class_id)->where('term_id','=',$term_id)->where('status','=',$student_status)->get();
        }
        if($schedule_of_fees) {
            return $schedule_of_fees;
        } else {
            return false;
        }
    }

    protected static function get_fees_amount($class_id, $term_id, $student_status = 2, $recurring = ''){
        if(!empty($recurring)){
            $fees_amount = DB::table('schedule_of_fees')->where('class_id','=',$class_id)->where('term_id','=',$term_id)->where('recurring_payment','=',$recurring)->where('status','=',$student_status)->sum('amount');
        } else {
            $fees_amount = DB::table('schedule_of_fees')->where('class_id','=',$class_id)->where('term_id','=',$term_id)->where('status','=',$student_status)->sum('amount');
        }
        if($fees_amount) {
            return $fees_amount;
        } else {
            return false;
        }
    }

}