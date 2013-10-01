<?php
/**
 * File Description here.
 * Author: Mfawa Alfred Onen
 * Date: 5/1/13
 * Version: v1.0
 * File: user.php
 */

class Setting extends Basemodel {

//  Validation Rules
    private static $pin_payment_rules = array(
        'firstname' => 'required|min:3',
        'surname' => 'required|min:3',
        'amount' => 'numeric',
    );

    private static $new_subject_rules = array(
        'subject_name' => 'required|min:3',
    );

    private static $new_class_rules = array(
        'class_name' => 'required|min:3',
    );

    private static $banks_rules = array(
        'bank_name' => 'required|min:3',
    );

    private static $app_type_rules = array(
        'type_name' => 'required|min:3',
    );

    private static $aca_session_rules = array(
        'academic_session' => 'required|min:3',
    );

    private static $payment_categories_rules = array(
        'payment_name' => 'required|min:3',
    );

    private static $app_pin_rules = array(
        'number_to_generate' => 'required|numeric|min:1',
    );


//  Validation
    public static function pin_payment_validation($input){
        return static::validation($input, static::$pin_payment_rules);
    }

    public static function new_class_validation($input){
        return static::validation($input, static::$new_class_rules);
    }

    public static function new_subject_validation($input){
        return static::validation($input, static::$new_subject_rules);
    }

    public static function banks_validation($input){
        return static::validation($input, static::$banks_rules);
    }

    public static function app_type_validation($input){
        return static::validation($input, static::$app_type_rules);
    }

    public static function aca_session_validation($input){
        return static::validation($input, static::$aca_session_rules);
    }

    public static function payment_categories_validation($input){
        return static::validation($input, static::$payment_categories_rules);
    }

    public static function app_pin_validation($input){
        return static::validation($input, static::$app_pin_rules);
    }

//  DB Inserts
    public static function assign_subject($data){
        $teacher_array = array(
            'user_id' => $data['user_id'],
            'subject_id' => $data['subject_id'],
            'class_id' => $data['class_id'],
            'term_id' => $data['term_id']
        );
        $teacher_update_array = array(
            'subject_id' => $data['subject_id'],
            'class_id' => $data['class_id'],
            'term_id' => $data['term_id']
        );
        if(static::check_teacher_exist_for_subject($data['user_id'], $data['subject_id'], $data['class_id'])){
            $teacher = DB::table('teachers_and_subjects')->where('user_id','=',$data['user_id'])
                ->update($teacher_update_array);
        } else {
            $teacher = DB::table('teachers_and_subjects')->insert($teacher_array);
        }

        if( $teacher ) {
            return $teacher;
        } else {
            return false;
        }
    }

    public static function new_class($data){
        $class_array = array('class_name' => Str::upper($data['class_name']));
        $class = DB::table('classes')->insert($class_array);
        if($class){
            return $class;
        } else {
            return false;
        }
    }

    public static function new_subject($data){
        $subject_array = array('subject_name' => Str::title($data['subject_title']));
        $subject = DB::table('subjects')->insert($subject_array);
        if($subject){
            return $subject;
        } else {
            return false;
        }
    }

    public static function new_bank($data){
        $array = array('bank_name' => Str::title($data['bank_name']));
        $bank = DB::table('banks')->insert($array);
        if($bank){
            return $bank;
        } else {
            return false;
        }
    }

    public static function new_app_type($data){
        $array = array('type_name' => Str::title($data['type_name']));
        $app_type = DB::table('application_type')->insert($array);
        if($app_type){
            return $app_type;
        } else {
            return false;
        }
    }

    public static function new_aca_session($data){
        $array = array(
            'academic_session' => Str::upper($data['academic_session']),
            'active_session' => 1
        );
        DB::table('academic_sessions')->update(array('active_session' => 0));
        $app_type = DB::table('academic_sessions')->insert($array);
        if($app_type){
            return $app_type;
        } else {
            return false;
        }
    }

    public static function new_payment_category($data){
        $array = array(
            'payment_name' => Str::title($data['payment_name']),
        );
        $app_type = DB::table('payment_categories')->insert($array);
        if($app_type){
            return $app_type;
        } else {
            return false;
        }
    }

    public static function new_app_pin($data){
        $number_to_generate = $data['number_to_generate'];
        $array = array();
        $pins = AIS::generate_pin($number_to_generate,12);
        foreach ($pins as $pin) {
            $array[] = array(
                'pin_no' => $pin,
                'usage_status' => 0,
                'issuance_status' => 0,
            );
        }
        $pin_stat = DB::table('pins')->insert($array);
        if($pin_stat){
            return $pin_stat;
        } else {
            return false;
        }
    }

    public static function edit_subject($data){
        $subject_array = array('subject_name' => Str::title($data['subject_name']));
        $subject = DB::table('subjects')->where('id','=',$data['subject_id'])->update($subject_array);
        if($subject){
            return $subject;
        } else {
            return false;
        }
    }

    public static function edit_class($data){
        $class_array = array('class_name' => Str::title($data['class_name']));
        $class = DB::table('classes')->where('id','=',$data['class_id'])->update($class_array);
        if($class){
            return $class;
        } else {
            return false;
        }
    }

    public static function assign_class($data){
        $teacher_array = array(
            'user_id' => $data['user_id'],
            'class_id' => $data['class_id']
        );
        $teacher_update_array = array(
            'class_id' => $data['class_id']
        );
        if(static::check_teacher_exist_for_class($data['user_id'])){
            $teacher = DB::table('teachers_and_classes')->where('user_id','=',$data['user_id'])
                ->update($teacher_update_array);
        } else {
            $teacher = DB::table('teachers_and_classes')->insert($teacher_array);
        }

        if( $teacher ) {
            return $teacher;
        } else {
            return false;
        }

    }

//  DB Updates

//  DB Deletes

//  Secondary DB Queries
    public static function all_teachers(){
        $teachers = DB::table('users')->where('role_id','=',2)->get();
        if( $teachers ){
            return $teachers;
        } else {
            return null;
        }
    }

    public static function all_subjects(){
        $subjects = DB::table('subjects')->get();
        if( $subjects ){
            return $subjects;
        } else {
            return null;
        }
    }

    public static function all_classes($paginate = false, $per_page = 10){
        if($paginate){
            $classes = DB::table('classes')->paginate($per_page);
        } else {
            $classes = DB::table('classes')->get();
        }
        if( $classes ){
            return $classes;
        } else {
            return null;
        }
    }

    public static function all_banks(){
        return DB::table('banks')->get();
    }

    public static function all_application_types(){
        return DB::table('application_type')->get();
    }

    public static function all_academic_sessions(){
        return DB::table('academic_sessions')->get();
    }

    public static function all_academic_terms(){
        return DB::table('terms')->get();
    }

    public static function all_payment_categories(){
        return DB::table('payment_categories')->get();
    }

    public static function all_pins(){
        return DB::table('pins')->where('usage_status','!=',1)->where('issuance_status','!=',1)->get();
    }

    public static function show_teacher($id){
        $teacher = DB::table('users')->where('id','=',$id)->first();
        if( $teacher ){
            return $teacher;
        } else {
            return null;
        }
    }

    public static function show_class($id){
        $class = DB::table('classes')->where('id','=',$id)->first();
        if( $class ){
            return $class;
        } else {
            return null;
        }
    }

    public static function show_subject($id){
        $subject = DB::table('subjects')->where('id','=',$id)->first();
        if( $subject ){
            return $subject;
        } else {
            return null;
        }
    }

    public static function assigned_teacher_subjects($id, $formatted = false){
        $teacher_subjects = DB::table('teachers_and_subjects')->where('user_id','=',$id)->get();
        if( $teacher_subjects ){
            $subject_title = '';
            if( $formatted ){
                foreach($teacher_subjects as $subject){
                    $subject_title .= ',&nbsp;' .Expand::subject($subject->subject_id) . '('.Expand::classes($subject->class_id).')';
                }
                return substr($subject_title,1);
            } else {
                return $teacher_subjects;
            }

        } else {
            return null;
        }
    }

    public static function assigned_teacher_class($id, $formatted = false){
        $teacher_classes = DB::table('teachers_and_classes')->where('user_id','=',$id)->get();
        if( $teacher_classes ){
            $class_title = '';
            if( $formatted ){
                foreach($teacher_classes as $class){
                    $class_title .= ',&nbsp;' .Expand::classes($class->class_id);
                }
                return substr($class_title,1);
            } else {
                return $teacher_classes;
            }

        } else {
            return null;
        }
    }

    protected static function check_teacher_exist_for_subject($user_id, $subject_id, $class_id){
        $teacher =  DB::table('teachers_and_subjects')->where('user_id','=',$user_id)
            ->where('subject_id','=',$subject_id)
            ->where('class_id','=',$class_id)
            ->count();
        if( $teacher > 0 ){ return true; } else { return false; }
    }

    protected static function check_teacher_exist_for_class($user_id){
        $teacher =  DB::table('teachers_and_classes')->where('user_id','=',$user_id)->count();
        if( $teacher > 0 ){ return true; } else { return false; }
    }

    public static function delete_class($id){
        try{
            DB::table('classes')->delete((int)$id);
        } catch (Exception $e){
            return false;
        }
    }

    public static function delete_subject($id){
        try{
            DB::table('subjects')->delete((int)$id);
        } catch (Exception $e){
            return false;
        }
    }

    public static function delete_bank($id){
        try{
            DB::table('banks')->delete((int)$id);
        } catch (Exception $e){
            return false;
        }
    }

    public static function delete_app_type($id){
        try{
            DB::table('application_type')->delete((int)$id);
        } catch (Exception $e){
            return false;
        }
    }

    public static function delete_payment_category($id){
        try{
            DB::table('payment_categories')->delete((int)$id);
        } catch (Exception $e){
            return false;
        }
    }

    public static function delete_app_pin($id){
        try{
            DB::table('pins')->delete((int)$id);
        } catch (Exception $e){
            return false;
        }
    }

    public static function active_session($id){
        try{
            DB::table('academic_sessions')->update(array('active_session' => 0));
            DB::table('academic_sessions')->where('id','=',$id)->update(array('active_session' => 1));
        } catch (Exception $e){
            return false;
        }
    }

    public static function active_term($id){
        try{
            DB::table('terms')->update(array('active_term' => 0));
            DB::table('terms')->where('id','=',$id)->update(array('active_term' => 1));
        } catch (Exception $e){
            return false;
        }
    }

    public static function delete_aca_session($id){
        try{
            DB::table('academic_sessions')->delete((int)$id);
            $new_active = DB::table('academic_sessions')->order_by('id','desc')->take(1)->first(array('id'));
            DB::table('academic_sessions')->where('id','=',$new_active->id)->update(array('active_session'=> 1));
        } catch (Exception $e){
            return false;
        }
    }

    public static function unassign_subject($id, $subject_id, $class_id, $term_id){
        try{
            $subject = DB::table('teachers_and_subjects')->where('user_id','=',$id)
                ->where('subject_id','=',$subject_id)
                ->where('class_id','=',$class_id)
                ->where('term_id','=',$term_id)
                ->delete();
            if($subject){
                return true;
            } else {
                return false;
            }
        } catch (Exception $e){
            return false;
        }
    }

}