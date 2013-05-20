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


//  Validation
    public static function pin_payment_validation($input){
        return static::validation($input, static::$pin_payment_rules);
    }

//  DB Inserts
    public static function assign_subject($data){
        $teacher_array = array(
            'user_id' => $data['user_id'],
            'subject_id' => $data['subject_id'],
            'class_id' => $data['class_id']
        );
        $teacher_update_array = array(
            'subject_id' => $data['subject_id'],
            'class_id' => $data['class_id']
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

    public static function all_classes(){
        $classes = DB::table('classes')->get();
        if( $classes ){
            return $classes;
        } else {
            return null;
        }
    }



    public static function show_teacher($id){
        $teacher = DB::table('users')->where('id','=',$id)->first();
        if( $teacher ){
            return $teacher;
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
                    $subject_title .= ', ' .Expand::subject($subject->subject_id) . ' ( '.Expand::classes($subject->class_id).' )';
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
                    $class_title .= ', ' .Expand::classes($class->class_id);
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

}