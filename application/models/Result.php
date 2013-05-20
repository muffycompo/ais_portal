<?php
/**
 * File Description here.
 * Author: Mfawa Alfred Onen
 * Date: 5/1/13
 * Version: v1.0
 * File: user.php
 */

class Result extends Basemodel {

//  Validation Rules
    private static $new_assessment_rules = array(
        'score' => 'required|numeric',
    );


//  Validation
    public static function new_assessment_validation($input){
        return static::validation($input, static::$new_assessment_rules);
    }

//  DB Inserts

    public static function new_assessment($data){
        $admission_no = Ais::resolve_admission_no_from_userid($data['user_id']);
        $assessment_array = array(
            'admission_no' => $admission_no,
            'subject_id' => $data['subject_id'],
            'class_id' => $data['class_id'],
            'academic_session_id' => Ais::active_academic_session(),
            'term_id' => Ais::active_term(),
            'assessment_type_id' => $data['assessment_type_id'],
            'score' => $data['score'],
        );
        $assessment_update_array = array('score' => $data['score']);
        if(static::check_assessment_exist_for_student($admission_no,$data['class_id'],$data['subject_id'],$data['assessment_type_id'])){
            $assessment = DB::table('results')->where('admission_no','=',$admission_no)
                ->where('assessment_type_id','=',$data['assessment_type_id'])
                ->update($assessment_update_array);
        } else {
            $assessment = DB::table('results')->insert($assessment_array);
        }
        if( $assessment ) {
            return $assessment;
        } else {
            return false;
        }

    }

    public static function student_assessments($id, $subject_id, $class_id, $formatted = false){
        $admission_no = Ais::resolve_admission_no_from_userid($id);
        $assessments = DB::table('results')
            ->where('admission_no','=',$admission_no)
            ->where('class_id','=',$class_id)
            ->where('subject_id','=',$subject_id)
            ->get();
        if( $assessments ){
            $assessment_title = '';
            if( $formatted ){
                foreach($assessments as $assessment){
                    $assessment_title .= ', ' .Expand::assessment_type($assessment->assessment_type_id) . ' - ( '.$assessment->score.' )';
                }
                return substr($assessment_title,1);
            } else {
                return $assessments;
            }
        } else {
            return null;
        }
    }

//  DB Updates

//  DB Deletes

//  Secondary DB Queries
    public static function teacher_subjects(){
        $user_id = Session::get('user_id');
        $subjects = DB::table('teachers_and_subjects')->where('user_id','=',$user_id)->get();
        if( $subjects ){
            return $subjects;
        } else {
            return null;
        }
    }

   public static function assessment($subject_id, $class_id){
        $subjects = '';
        if( $subjects ){
            return $subjects;
        } else {
            return null;
        }
    }

  public static function registered_students_in_class($class_id){
        $registered_students = DB::table('users')
            ->left_join('biodata','users.id','=','biodata.user_id')
            ->where('biodata.current_class_id','=',$class_id)
            ->get(array(
                'users.id','users.firstname','users.surname','biodata.age','biodata.gender_id'
            ));
        if( $registered_students ){
            return $registered_students;
        } else {
            return null;
        }
    }

  protected static function check_assessment_exist_for_student($admission_no, $class_id, $subject_id, $assessment_type){
        $count =  DB::table('results')->where('admission_no','=',$admission_no)
            ->where('class_id','=',$class_id)
            ->where('subject_id','=',$subject_id)
            ->where('assessment_type_id','=',$assessment_type)
            ->count();
        if( $count > 0 ){ return true; } else { return false; }
    }


}