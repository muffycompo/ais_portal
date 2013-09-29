<?php
/**
 * Utility Class for AIS Portal.
 * Author: Mfawa Alfred Onen
 * Date: 5/1/13
 * Version: v1.0
 * File: ais.php
 */

class Ais {

    public static function term_dropdown($name, $selected = null, $attributes = array()){
        $opts = DB::table('terms')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->term;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function state_dropdown($name, $selected = null, $attributes = array()){
        $opts = DB::table('states')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->state_name;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function role_dropdown($name, $selected = null, $attributes = array()){
        $opts = DB::table('roles')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->role_name;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function nationality_dropdown($name, $selected = 118, $attributes = array()){
        $opts = DB::table('nationality')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->nationality_name;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function gender_dropdown($name, $selected = null, $attributes = array()){
        $opts = DB::table('gender')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->gender_name;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function class_dropdown($name, $selected = null, $attributes = array(), $check_role = false){
       $options = array();
       if($check_role && (Session::get('role_id') == 2)){
          $user_id = Session::get('user_id');
//          $opt = DB::table('teachers_and_classes')->where('user_id','=',$user_id)->first(array('class_id'));
          $opt = DB::table('teachers_and_subjects')->where('user_id','=',$user_id)->first(array('class_id'));
          if(is_null($opt)){
              return Form::select($name, $options, $selected, $attributes);
          } else {
              $options[$opt->class_id] = Expand::classes($opt->class_id);
              return Form::select($name, $options, $selected, $attributes);
          }


       } else {
           $opts = DB::table('classes')->get();
           foreach($opts as $opt){
               $options[$opt->id] = $opt->class_name;
           }
           return Form::select($name, $options, $selected, $attributes);
       }

    }

   public static function application_type_dropdown($name, $selected = null, $attributes = array()){
        $opts = DB::table('application_type')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->type_name;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function admission_recommendation_dropdown($name, $selected = null, $attributes = array()){
        $opts = DB::table('admission_recommendation')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->admission_remark;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function academic_session_dropdown($name, $selected = null, $attributes = array()){
        $opts = DB::table('academic_sessions')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->academic_session;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function payment_category_dropdown($name, $selected = null, $attributes = array()){
        $opts = DB::table('payment_categories')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->payment_name;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function assessment_type_dropdown($name, $selected = null, $attributes = array()){
        $opts = DB::table('assessment_types')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->type_name;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function subject_dropdown($name, $selected = null, $attributes = array(), $check_role = false){
       $options = array();
      if($check_role && (Session::get('role_id') == 2)){
         $user_id = Session::get('user_id');
         $opts = DB::table('teachers_and_subjects')->where('user_id','=',$user_id)->get(array('subject_id'));
         if(is_null($opts)){
             return Form::select($name, $options, $selected, $attributes);
         } else {
             foreach($opts as $opt){
                 $options[$opt->subject_id] = Expand::subject($opt->subject_id);
             }
             return Form::select($name, $options, $selected, $attributes);
         }
      } else {
          $opts = DB::table('subjects')->get();
          foreach($opts as $opt){
              $options[$opt->id] = $opt->subject_name;
          }
          return Form::select($name, $options, $selected, $attributes);
      }

    }

   public static function religion_dropdown($name, $selected = null, $attributes = array()){
        $opts = DB::table('religions')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->religion_name;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function deduction_type_dropdown($name, $selected = null, $attributes = array()){
        $opts = DB::table('deduction_types')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->deduction_name;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function designations_dropdown($name, $selected = null, $attributes = array()){
        $opts = DB::table('designations')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->designation_name;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function incentive_type_dropdown($name, $selected = null, $attributes = array()){
        $opts = DB::table('incentive_types')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->incentive_type_name;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function bank_dropdown($name, $selected = null, $attributes = array()){
        $opts = DB::table('banks')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->bank_name;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function event_group_dropdown($name, $selected = null, $attributes = array()){
        $opts = DB::table('event_group')->get();
        $role_id = Session::get('role_id');
       if($role_id == 2){
           return Form::select($name, array('1'=>'Students'), $selected, $attributes);
       }
        foreach($opts as $opt){
            $options[$opt->id] = $opt->event_group_name;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function recurring_dropdown($name, $selected = null, $attributes = array()){
        $options = array(
            '1' => 'Termly',
            '2' => 'Annually'
        );
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function assignment_note_dropdown($name, $selected = null, $attributes = array()){
        $options = array(
            '1' => 'Note',
            '2' => 'Assignment'
        );
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function attendance_type_dropdown($name, $selected = null, $attributes = array()){
        $options = array(
            '1' => 'Present',
            '2' => 'Absent',
            '3' => 'Absent with Reason'
        );
        return Form::select($name, $options, $selected, $attributes);
    }

    public static function generate_pin($number_to_gen = '', $pin_length = ''){
        $num_to_gen = (! empty($number_to_gen))? $number_to_gen : 10;
        $length = (! empty($pin_length))? $pin_length : 6;

        for($i = 1; $i <= (int) $num_to_gen; $i++){
            $pin[] = substr((mt_rand().mt_rand().mt_rand()), 0, $length);
        }

        return $pin;
    }

    public static function resolve_name($id){
        $name = DB::table('users')->where('id','=', (int) $id)->first(array('firstname','surname'));
        return $name->firstname . ' ' . $name->surname;
    }

    public static function get_pin_id(){
        $pin = DB::table('pins')->where('issuance_status','=',0)->where('usage_status','=',0)->first(array('id'));
        return $pin->id;
    }

    public static function generate_receipt_no($number_to_gen = '', $receipt_no_length = '', $prefix = ''){
       $num_to_gen = (! empty($number_to_gen))? $number_to_gen : 1;
       $length = (! empty($receipt_no_length))? $receipt_no_length : 6;

       for($i = 1; $i <= (int) $num_to_gen; $i++){
           $receipt_no[] = substr((mt_rand().mt_rand().mt_rand()), 0, $length);
       }

       return $prefix . $receipt_no[0];
   }

   public static function generate_admission_no($number_to_gen = '', $receipt_no_length = '', $prefix = ''){
       $num_to_gen = (! empty($number_to_gen))? $number_to_gen : 10;
       $length = (! empty($receipt_no_length))? $receipt_no_length : 6;

       for($i = 1; $i <= (int) $num_to_gen; $i++){
           $receipt_no[] = substr((mt_rand().mt_rand().mt_rand()), 0, $length);
       }
       date_default_timezone_set('Africa/Lagos');
       return $prefix . '/' . date('y') . '/' . $receipt_no[0];
   }

    public static function current_date($format = 'db'){
        date_default_timezone_set('Africa/Lagos');
        if($format == 'db') { return date('Y-m-d'); }
    }

    public static function reverse_db_date($date){
        $d = explode('-',$date);

        return $d[2] .'/' . $d[1] . '/' . $d[0];
    }

    public static function reverse_db_datetime_to_date($datetime, $time = false){
        $d = strtotime($datetime);
        if($time){ return date('d/m/Y H:i:s', $d); }
        return date('d/m/Y', $d);
    }

    public static function reverse_slash_date($date){
        $d = explode('/',$date);
        return $d[2] .'-' . $d[1] . '-' . $d[0];
    }

    public static function resolve_age($date_of_birth){
        date_default_timezone_set('Africa/Lagos');
        list($Y,$m,$d) = explode("-",$date_of_birth);
        $age = (date("md") < $m.$d) ? (date("Y") - $Y - 1) : (date("Y") - $Y);
        return $age;
    }

    public static function registration_status($update_count = false, $increment = 0){
        $user_id = Session::get('user_id');
        $count = DB::table('biodata')->where('user_id','=',$user_id)->first(array('reg_status'));
        $old_count = $count ? $count->reg_status : 0;
        if($update_count){
            $new_count = $old_count + $increment + 1;
            DB::table('biodata')->where('user_id','=',$user_id)->update(array('reg_status' => $new_count));
        } else {
            return $old_count;
        }
    }

    public static function migration_status(){
        $user_id = Session::get('user_id');
        $role_id = Session::get('role_id');
        if($role_id == 1){
            $migration = DB::table('biodata')->where('user_id','=',$user_id)->first(array('migration'));
            return ($migration->migration == 1)? true : false;
        } else {
            return false;
        }

    }

    public static function passport_image($id = ''){
        $user_id = !empty($id)? (int)$id : Session::get('user_id');
        $role_id = !empty($id)? static::resolve_userrole_userid($user_id) : Session::get('role_id');
        $img_dir = 'uploads/' . $user_id .'/passport/';
        $abs_path = dirname(dirname(dirname(__FILE__))) . DS . 'public' . DS . 'uploads' . DS . $user_id . DS .'passport' . DS;
        $files = glob($abs_path . $user_id.'_passport.*');
        if($files){
            $pieces = explode(DS,$files[0]);
            $img = end($pieces);
            if($role_id == 1){
                $passport = DB::table('biodata')->where('user_id','=',$user_id)->first(array('passport_path'));
                if(empty($passport->passport_path) || is_null($passport->passport_path)){
                    return 'img/avatar_placeholder.png';
                } else {
                    return  $img_dir . $passport->passport_path;
                }
            } else {
                $img_path = $files[0];
                if(File::exists($img_path)){
                    return $img_dir . $img;
                } else {
                    return 'img/avatar_placeholder.png';
                }
            }
        } else {
            return 'img/avatar_placeholder.png';
        }
    }

    public static function active_academic_session(){
        $session = DB::table('academic_sessions')->where('active_session','=',1)->first(array('id'));
        return (!empty($session))? $session->id : 1;
    }

    public static function active_term(){
        $term = DB::table('terms')->where('active_term','=',1)->first(array('id'));
        return (!empty($term))? $term->id : 1;
    }

    public static function is_class_teacher($user_id, $class_id = ''){
       if(empty($class_id)){
            $count = DB::table('teachers_and_classes')->where('user_id','=',$user_id)->count();
        } else {
            $count = DB::table('teachers_and_classes')->where('user_id','=',$user_id)
                        ->where('class_id','=',$class_id)
                        ->count();
        }

        if($count == 1){ return true;} else { return false;}
    }

    public static function is_admin($user_id){
        $count = DB::table('users')->where('id','=',$user_id)->where('role_id','=',5)->count();
        if($count == 1){ return true;} else { return false;}
    }

    public static function has_submitted_assignment($assignment_id){
        $user_id = Session::get('user_id');
        $count = DB::table('assignment_submissions')->where('user_id','=',$user_id)->where('assignment_id','=',$assignment_id)->count();
        if($count == 1){ return true;} else { return false;}
    }

    public static function payment_balance(){
        if(Session::get('role_id') == 1){
            $user_id = Session::get('user_id');
            $class_id = static::resolve_classid_from_userid($user_id);
            $term_id = static::active_term();
            static::student_status($user_id); // ensure students are either flagged as current or new
            $status = static::check_student_status($user_id);
            $fee_schedule = static::fee_schedule_per_class($class_id, $term_id, $status);
            $payment = static::has_payment($user_id,$class_id, $term_id);
            $balance = $payment - $fee_schedule;

            $registration_status = static::registration_status();
            if($registration_status !== 9){ return false;}
            if($balance > 0){
                $message = '
                <div class="alert alert-warning">
                    <a class="close" data-dismiss="alert" href="#">×</a>
                    <h4 class="alert-heading">Over Payment!</h4>
                    You have overpaid you fees by <strong>N'. number_format(abs($balance)) .'</strong>
                </div>';
                return $message; // balance remaining
            } else {
                $message = '
                <div class="alert alert-error">
                    <a class="close" data-dismiss="alert" href="#">×</a>
                    <h4 class="alert-heading">Payment Balance!</h4>
                    You currently have an outstanding balance of <strong>N' . number_format(abs($balance)) .'</strong> to pay. You will only be allowed to sit for Exams when we receive your complete payment(s)!
                </div>';

                return $message; // overpayment
            }

        } else {
            return false;
        }
    }

    public static function student_status($user_id){
        $admission_no = static::resolve_admission_no_from_userid($user_id);
        $count = DB::table('results')->where('admission_no','=',$admission_no)
                ->where('published','=',2)
                ->count();
        if($count > 0){
            // set status to current student
            $status = DB::table('biodata')->where('user_id','=',$user_id)->update(array('student_status'=> 2));
        } else {
            // set status to new student
            $status = DB::table('biodata')->where('user_id','=',$user_id)->update(array('student_status'=> 1));
        }
        if($status){ return true; } else { return false; }
    }

    public static function check_student_status($user_id){
        $check = DB::table('biodata')->where('user_id','=',$user_id)->first(array('student_status'));
        if($check){ return $check->student_status ;} else { return ''; }
    }

    public static function fee_schedule_per_class($class_id, $term_id, $student_status = ''){
        $status = empty($student_status)? 2 : $student_status;
        $schedule_amount = DB::table('schedule_of_fees')->where('class_id','=',$class_id)
                ->where('term_id','=',$term_id)
                ->where('status','=',$status) // Fix this when student flag is created (1 - new student, 2 - current student)
                ->sum('amount');
        return $schedule_amount;
    }

    public static function has_payment($user_id, $class_id, $term_id){
        $admission_no = static::resolve_admission_no_from_userid($user_id);
        $payment = DB::table('payments')->where('admission_no','=',$admission_no)
                ->where('class_id','=',$class_id)
                ->where('term_id','=',$term_id)
                ->sum('paid_amount');
        if(is_null($payment)){ return 0; } else { return $payment; }
    }

    public static function resolve_userid_from_admission_no($admission_no){
        $user = DB::table('official_use')->where('admission_no','=',$admission_no)->first(array('user_id'));
        if($user) {return $user->user_id;} else { return '';}
    }

    public static function resolve_userrole_userid($user_id){
        $user = DB::table('users')->where('id','=',$user_id)->first(array('role_id'));
        if($user) {return $user->role_id;} else { return '';}
    }

    public static function resolve_admission_no_from_userid($user_id){
        $user = DB::table('official_use')->where('user_id','=',$user_id)->first(array('admission_no'));
        if($user) {return $user->admission_no;} else { return '';}

    }

    public static function resolve_classid_from_userid($user_id, $other = ''){
        if(!empty($other)){
            if($other == 'last'){
                $user = DB::table('biodata')->where('user_id','=',$user_id)->first(array('last_class_id'));
                if($user) {return $user->last_class_id;} else { return '';}
            }
        }
        $user = DB::table('biodata')->where('user_id','=',$user_id)->first(array('current_class_id'));
        if($user) {return $user->current_class_id;} else { return '';}

    }

    public static function resolve_classid_from_teacher_userid($user_id){
        $user = DB::table('teachers_and_classes')->where('user_id','=',$user_id)->first(array('class_id'));
        if($user) {return $user->class_id;} else { return '';}

    }

    public static function resolve_classid_from_teacher_userid_for_subjects($user_id){
        $user = DB::table('teachers_and_subjects')->where('user_id','=',$user_id)->first(array('class_id'));
        if($user) {return $user->class_id;} else { return '';}

    }

    public static function assigned_teacher_subjects($user_id){
        $subjects = Setting::assigned_teacher_subjects($user_id,true);
        return $subjects;
    }

    public static function assigned_teacher_class($user_id){
        $class = Setting::assigned_teacher_class($user_id,true);
        return $class;
    }

    public static function student_total_score($subject_id,$class_id,$term_id,$session_id , $user_id){
        return Report::subject_total_score($subject_id,$class_id,$term_id, $session_id, $user_id);
    }

    public static function total_score_per_class($class_id, $term_id, $session_id){
        return Report::student_position_per_class($class_id, $term_id, $session_id);
    }

    public static function class_promotion($average, $user_id, $class_id, $term_id, $session_id){
        return Report::average_promotion($average, $user_id, $class_id, $term_id, $session_id);
    }

    public static function resolve_subject_id($subject_name){
        $subject_name = Str::title($subject_name);
        $subject = DB::table('subjects')->where('subject_name','=',$subject_name)->first('id');
        if($subject) { return $subject->id; } else { return 1; }
    }

    public static function check_gsm_number($number){

        // Validate GSM numbers
        $pattern = '/^0[78][01]\d{8}$/';
        $validate = preg_match($pattern, static::gsm_no_formatter($number));
        if($validate){ return true;} else { return false;}
    }

    public static function export_to_csv($name, $column_headers, $data){
        $csv = new CSV();
        $csv->columns($column_headers);
        $csv->rows($data);
        $t = $csv->to_download($name);
        return $t;
    }

    public static function gsm_no_formatter($n){
        // Format number if it is greater than 11
        $n1 = str_replace('(','',$n);
        $n2 = str_replace(')','',$n1);
        $number = preg_replace('/\s+/', '', $n2);
        return $number;
    }


    public static function send_email($from, $to, $subject, $body, $html = true){
        $email = new Postmark();
        $email->from_name($from);
        $email->to($to);
        $email->subject($subject);
        if($html){
            $email->html_body($body);
        } else {
            $email->txt_body($body);
        }
        $email->send();
    }

    public static function amount_to_words($number){
        if (($number < 0) || ($number > 999999999)){
         throw new Exception("Number is out of range");
        }

        $Gn = floor($number / 1000000);  /* Millions (giga) */
        $number -= $Gn * 1000000;
        $kn = floor($number / 1000);     /* Thousands (kilo) */
        $number -= $kn * 1000;
        $Hn = floor($number / 100);      /* Hundreds (hecto) */
        $number -= $Hn * 100;
        $Dn = floor($number / 10);       /* Tens (deca) */
        $n = $number % 10;               /* Ones */

        $res = '';

        if ($Gn){
            $res .= static::amount_to_words($Gn) . " Million";
        }
        if ($kn){
            $res .= (empty($res) ? "" : " ") .
                static::amount_to_words($kn) . " Thousand";
        }
        if ($Hn){
            $res .= (empty($res) ? "" : " ") .
                static::amount_to_words($Hn) . " Hundred";
        }

        $ones = array("", "One", "Two", "Three", "Four", "Five", "Six",
            "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen",
            "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eightteen",
            "Nineteen");
        $tens = array("", "", "Twenty", "Thirty", "Fourty", "Fifty", "Sixty",
            "Seventy", "Eigthy", "Ninety");

        if ($Dn || $n){
            if (!empty($res)){
                $res .= " and ";
            }
            if ($Dn < 2){
                $res .= $ones[$Dn * 10 + $n];
            }
            else{
                $res .= $tens[$Dn];
                if ($n){
                    $res .= "-" . $ones[$n];
                }
            }
        }
        if (empty($res)){
            $res = "zero";
        }

        return $res;
    }

    public static function days_left($date, $tick = false){
        date_default_timezone_set('Africa/Lagos');
        $date1 = strtotime($date);
        $date2 = time();
        $date_diff = ($date1 - $date2);
        $days = ($date_diff / (60*60*24))%365; // Number of days
        $hours = ($date_diff/(60*60))%24; // Number of hours
        $minutes = ($date_diff/60)%60; // Number of minutes
        if($tick){
            if($days < 0 || $hours < 0 || $minutes < 0){
                return false;
            } else {
                return true;
            }
        } else {
            if($days < 0 || $hours < 0 || $minutes < 0){
                return abs($days) . ' days '.abs($hours).' hours '.abs($minutes).' minutes passed';
            } else {
                return $days . ' days '.$hours.' hours '.$minutes.' minutes left';
            }
        }

    }

    public static function format_to_currency($number, $kobo = 1) { // kobo: 0=never, 1=if needed, 2=always
          if (is_numeric($number)) { // a number
            if (!$number) { // zero
              $money = ($kobo == 2 ? '0.00' : '0'); // output zero
            } else { // value
              if (floor($number) == $number) { // whole number
                $money = number_format($number, ($kobo == 2 ? 2 : 0)); // format
              } else { // Kobo
                $money = number_format(round($number, 2), ($kobo == 0 ? 0 : 2)); // format
              } // integer or decimal
            } // value
            return $money;
          } // numeric
        } // format_to_currency

    public static function message_format($text, $css_class){
        return '<div class="alert alert-' . $css_class .'">
            <a class="close" data-dismiss="alert" href="#">×</a>
            ' . $text . '
            </div>';
    }

}