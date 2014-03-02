<?php
/**
 * File Description here.
 * Author: Mfawa Alfred Onen
 * Date: 5/1/13
 * Version: v1.0
 * File: user.php
 */

class Report extends Basemodel {


//  DB Inserts


//  DB Updates

//  DB Deletes

//  Secondary DB Queries
  public static function report_subject_total($class_id, $term_id, $session_id){
        $subjects = static::registered_subjects_per_class($class_id, $term_id, $session_id);
        if(!empty($subjects) ){
        return $subjects;
        } else {
            return null;
        }
    }

    public static function average_promotion($average, $user_id, $class_id, $term_id, $session_id){
        $subjects = static::registered_subjects_per_class($class_id, $term_id, $session_id);
        if(!empty($subjects) ){

            $maths = Ais::resolve_subject_id('Mathematics');
            $english = Ais::resolve_subject_id('English');
            $physics = Ais::resolve_subject_id('Physics');
            $chemistry = Ais::resolve_subject_id('Chemistry');
            $biology = Ais::resolve_subject_id('Biology');
            $geography = Ais::resolve_subject_id('Geography');
            $government = Ais::resolve_subject_id('Government');
            $economics = Ais::resolve_subject_id('Economics');
            $literature = Ais::resolve_subject_id('Literature');

            if($average < 50){
                // Scored less than 50%
                $maths_total = static::subject_total_score($maths,$class_id, $term_id,$session_id,$user_id);
                $english_total = static::subject_total_score($english,$class_id, $term_id,$session_id,$user_id);
                if($maths_total <= 49 && $english_total <= 49){
                    return 'Repeat';
                } else {
                    return 'Promoted';
                }

            } elseif($average >= 50 && $average <= 60){
                // Scored 50% - 60%
                $maths_total = static::subject_total_score($maths,$class_id, $term_id,$session_id,$user_id);
                $english_total = static::subject_total_score($english,$class_id, $term_id,$session_id,$user_id);
                $physics_total = static::subject_total_score($physics,$class_id, $term_id,$session_id,$user_id);
                $chemistry_total = static::subject_total_score($chemistry,$class_id, $term_id,$session_id,$user_id);
                $biology_total = static::subject_total_score($biology,$class_id, $term_id,$session_id,$user_id);
                $geography_total = static::subject_total_score($geography,$class_id, $term_id,$session_id,$user_id);
                $government_total = static::subject_total_score($government,$class_id, $term_id,$session_id,$user_id);
                $economics_total = static::subject_total_score($economics,$class_id, $term_id,$session_id,$user_id);
                $literature_total = static::subject_total_score($literature,$class_id, $term_id,$session_id,$user_id);

                if($maths_total <= 49 && $english_total <= 49){
                    return 'Repeat';
                } elseif(($maths_total <= 49 || $english_total <= 49) && (($physics_total <= 49 && $chemistry_total <= 49) || ($physics_total <= 49 && $biology_total <= 49) || ($physics_total <= 49 && $geography_total <= 49) || ($government_total <= 49 && $economics_total <= 49) || ($government_total <= 49 && $literature_total <= 49) || ($government_total <= 49 && $geography_total <= 49))){
                    return 'Repeat';
                } else {
                    return 'Promoted Trial';
                }

            } else {
               // Scored above 50%
               $maths_total = static::subject_total_score($maths,$class_id, $term_id,$session_id,$user_id);
               $english_total = static::subject_total_score($english,$class_id, $term_id,$session_id,$user_id);
                if($maths_total <= 49 && $english_total <= 49){
                    return 'Repeat';
                } else {
                    return 'Promoted';
                }
            }

        } else {
            return null;
        }
    }

   public static function subject_total_score($subject_id,$class_id, $term_id,$session_id,$user_id)
   {
       return static::total_score_per_student($subject_id,$class_id, $term_id, $session_id, $user_id);
   }

    public static function registered_subjects_per_class($class_id, $term_id, $session_id){
        $academic_session_id = (!empty($session_id))? $session_id : Ais::active_academic_session();
        $registered_subjects = DB::table('results')
            ->where('class_id','=',$class_id)
            ->where('term_id','=',$term_id)
            ->where('academic_session_id','=',$academic_session_id)
            ->where('published','=',2)
            ->group_by('subject_id')
            ->get(array('subject_id'));
        if( $registered_subjects ){
            return $registered_subjects;
        } else {
            return null;
        }
    }

    public static function reports_student_biodata($class_id){
        $student = DB::table('users')
            ->left_join('biodata','users.id','=','biodata.user_id')
            ->where('biodata.current_class_id','=',$class_id)
            ->get(array('users.id','firstname','surname'));
        if( $student ){
            return $student;
        } else {
            return null;
        }
    }

    protected static function total_score_per_student($subject_id, $class_id, $term_id, $session_id, $user_id = ''){
           $user_id = empty($user_id)? Session::get('user_id') : $user_id;
           $admission_no = Ais::resolve_admission_no_from_userid($user_id);
           $academic_session_id = (!empty($session_id))? $session_id : Ais::active_academic_session();
           $total = DB::table('results')->where('subject_id','=',$subject_id)
                       ->where('admission_no','=',$admission_no)
                       ->where('published','=',2)
                       ->where('class_id','=',$class_id)
                       ->where('term_id','=',$term_id)
                       ->where('academic_session_id','=',$academic_session_id)
                       ->group_by('subject_id')->sum('score');
           if($total){
               return round($total,2);
           } else {
               return 0;
           }
       }

  public static function student_position_per_class($class_id, $term_id, $session_id){
      $academic_session_id = (!empty($session_id)) ? $session_id : Ais::active_academic_session();
      $total = DB::query('SELECT SUM(score) AS total_score FROM results WHERE academic_session_id = ? AND published = ? AND class_id = ? AND term_id = ? GROUP BY admission_no;',array($academic_session_id, 2,$class_id, $term_id));
        if($total){
            $total_scores = array();
            foreach($total as $t){
                $total_scores[] = $t->total_score;
            }
            //$total_scores default
            natsort($total_scores);
            $total_scores = array_reverse($total_scores);
            return $total_scores;
        } else {
            return 0;
        }
    }


  public static function all_academic_sessions()
  {
      $sessions = DB::table('academic_sessions')->get();
      if($sessions){
          return $sessions;
      } else {
          return null;
      }
  }

  public static function all_student_numbers()
  {
      $students = DB::table('users')
        ->join('biodata','users.id','=','biodata.user_id')
        ->where('biodata.phone_number','!=','')
        ->or_where_not_null('biodata.phone_number')
        ->order_by('biodata.current_class_id','asc')
        ->get(array('users.id','firstname','surname','biodata.phone_number','biodata.current_class_id'));
      if($students){
          return $students;
      } else {
          return false;
      }
  }

  public static function all_students_gender()
  {
      $students = DB::table('users')
        ->join('biodata','users.id','=','biodata.user_id')
        ->order_by('biodata.current_class_id','asc')
        ->get(array('users.id','firstname','surname','biodata.current_class_id','biodata.gender_id'));
      if($students){
          return $students;
      } else {
          return false;
      }
  }

  public static function all_students_state()
  {
      $students = DB::table('users')
        ->join('biodata','users.id','=','biodata.user_id')
        ->order_by('biodata.current_class_id','asc')
        ->get(array('users.id','firstname','surname','biodata.current_class_id','biodata.state_id'));
      if($students){
          return $students;
      } else {
          return false;
      }
  }

  public static function all_staff_numbers()
  {
      $students = DB::table('users')
        ->join('staff_biodata','users.id','=','staff_biodata.user_id')
        ->order_by('users.id','asc')
        ->get(array('users.id','firstname','surname','staff_biodata.phone_number','email'));
      if($students){
          return $students;
      } else {
          return false;
      }
  }

    public static function all_no_list($code)
    {
        $csv = new MCSV();

        if($code == 'student'){
            $csv->columns(array('Surname','Firstname','Class','GSM Number'));
            $students = static::all_student_numbers();
            if($students !== false && count($students) > 0){
                foreach ($students as $student) {
                    $csv->row(array($student->surname,$student->firstname,Expand::classes($student->current_class_id),$student->phone_number));
                }
            } else {
                $csv->row(array('','','',''));
            }
            return $csv->to_download('students_phone_numbers.csv');
        } elseif($code == 'staff'){
            $csv->columns(array('Surname','Firstname','Email','GSM Number'));
            $students = static::all_staff_numbers();
            if(count($students) > 0){
                foreach ($students as $student) {
                    $csv->row(array($student->surname,$student->firstname,$student->email,$student->phone_number));
                }
            } else {
                $csv->row(array('','','',''));
            }
            return $csv->to_download('staff_phone_numbers.csv');
        } else{
            return Redirect::back();
        }


    }

    public static function all_gender_list($code)
    {
        $csv = new MCSV();

        if($code == 'student'){
            $csv->columns(array('Surname','Firstname','Class','Gender/Sex'));
            $students = static::all_student_numbers();
            if($students !== false && count($students) > 0){
                foreach ($students as $student) {
                    $csv->row(array($student->surname,$student->firstname,Expand::classes($student->current_class_id),Expand::gender($student->gender_id)));
                }
            } else {
                $csv->row(array('','','',''));
            }
            return $csv->to_download('students_by_gender.csv');
        } else{
            return Redirect::back();
        }

    }

    public static function all_state_list($code)
    {
        $csv = new MCSV();

        if($code == 'student'){
            $csv->columns(array('Surname','Firstname','Class','State of Origin'));
            $students = static::all_student_numbers();
            if($students !== false && count($students) > 0){
                foreach ($students as $student) {
                    $csv->row(array($student->surname,$student->firstname,Expand::classes($student->current_class_id),Expand::state($student->state_id)));
                }
            } else {
                $csv->row(array('','','',''));
            }
            return $csv->to_download('students_by_state.csv');
        } else{
            return Redirect::back();
        }

    }

}