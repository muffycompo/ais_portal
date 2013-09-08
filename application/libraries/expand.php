<?php
/**
 * Utility Class for AIS Portal.
 * Author: Mfawa Alfred Onen
 * Date: 5/1/13
 * Version: v1.0
 * File: ais.php
 */

class Expand {

    public static function term($term_id){
        $opts = DB::table('terms')->where('id','=',$term_id)->first(array('term'));
        return $opts->term;
    }

    public static function state($state_id){
        $opts = DB::table('states')->where('id','=',$state_id)->first(array('state_name'));
        return $opts->state_name;
    }

    public static function nationality($nationality_id){
        $opts = DB::table('nationality')->where('id','=',$nationality_id)->first(array('nationality_name'));
        return $opts->nationality_name;
    }

    public static function application_type($id){
        $opts = DB::table('application_type')->where('id','=',$id)->first(array('type_name'));
        return $opts->type_name;
    }

    public static function gender($id){
        $opts = DB::table('gender')->where('id','=',$id)->first(array('gender_name'));
        return $opts->gender_name;
    }

    public static function role($id){
        $opts = DB::table('roles')->where('id','=',$id)->first(array('role_name'));
        return $opts->role_name;
    }

    public static function classes($id){
        $opts = DB::table('classes')->where('id','=',$id)->first(array('class_name'));
        return $opts->class_name;
    }

    public static function admission_recommendation($id){
        $opts = DB::table('admission_recommendation')->where('id','=',$id)->first(array('admission_remark'));
        return $opts->admission_remark;
    }

    public static function academic_session($id){
        $opts = DB::table('academic_sessions')->where('id','=',$id)->first(array('academic_session'));
        return $opts->academic_session;
    }

    public static function payment_category($id){
        $opts = DB::table('payment_categories')->where('id','=',$id)->first(array('payment_name'));
        return $opts->payment_name;
    }

    public static function assessment_type($id){
        $opts = DB::table('assessment_types')->where('id','=',$id)->first(array('type_name'));
        return $opts->type_name;
    }

    public static function subject($id){
        $opts = DB::table('subjects')->where('id','=',$id)->first(array('subject_name'));
        return $opts->subject_name;
    }

    public static function religion($id){
        $opts = DB::table('religions')->where('id','=',$id)->first(array('religion_name'));
        return $opts->religion_name;
    }

    public static function event_group($id){
        $opts = DB::table('event_group')->where('id','=',$id)->first(array('event_group_name'));
        return $opts->event_group_name;
    }

    public static function designation($id){
        $opts = DB::table('designations')->where('id','=',$id)->first(array('designation_name'));
        return $opts->designation_name;
    }

    public static function bank($id){
        $opts = DB::table('banks')->where('id','=',$id)->first(array('bank_name'));
        return $opts->bank_name;
    }

    public static function incentive($id){
        $opts = DB::table('incentive_types')->where('id','=',$id)->first(array('incentive_type_name'));
        return $opts->incentive_type_name;
    }

    public static function term_name($term_id){
        switch ($term_id) {
            case 1:
                return 'First Term';
                break;
           case 2:
                return 'Second Term';
                break;
           case 3:
                return 'Third Term';
                break;
            default:
                return '';
                break;
        }
    }

    public static function recurring($recurring_id){
        switch ($recurring_id) {
            case 1:
                return 'Termly';
                break;
           case 2:
                return 'Annually';
                break;
            default:
                return '';
                break;
        }
    }

    public static function assignment_note($id){
        switch ($id) {
            case 1:
                return 'Note';
                break;
           case 2:
                return 'Assignment';
                break;
            default:
                return '';
                break;
        }
    }

    public static function attendance_type($id){
        switch ($id) {
            case 1:
                return 'Present';
                break;
           case 2:
                return 'Absent';
                break;
           case 3:
                return 'Absent with Reason';
                break;
            default:
                return '';
                break;
        }
    }

    public static function assignment_title($assignment_id){
        $title = DB::table('assignments_and_notes')->where('id','=',$assignment_id)->first(array('title'));
        if(!is_null($title)){ return $title->title; } else { return ''; }
    }

    public static function ca_exam_score($id, $subject_id, $class_id, $term_id, $type){
        $admission_no = Ais::resolve_admission_no_from_userid($id);
        $result = DB::table('results')->where('admission_no','=',$admission_no)
            ->where('subject_id','=',$subject_id)
            ->where('class_id','=',$class_id)
            ->where('term_id','=',$term_id)
            ->where('academic_session_id','=',Ais::active_academic_session())
            ->where('assessment_type_id','=',$type)
            ->first(array('score'));
        if($result){
            return $result->score;
        } else {
            return 0;
        }
    }

    public static function ca_exam_total($id, $subject_id, $class_id, $term_id){
            $total = 0;
            for($i=1; $i < 5; $i++){
               $total = $total + static::ca_exam_score($id, $subject_id, $class_id, $term_id, $i);
            }
            return $total;
    }

    public static function ca_exam_grade($score){
            $score = (int)$score;
            if($score >= 90 && $score <=100){
                return array(
                    'grade' => 'A',
                    'comment' => 'Distinction'
                );
            } elseif($score >= 80 && $score <=89){
                return array(
                    'grade' => 'B1',
                    'comment' => 'Very Good'
                );
            } elseif($score >= 70 && $score <=79){
                return array(
                    'grade' => 'B2',
                    'comment' => 'Good'
                );
            } elseif($score >= 60 && $score <=69){
                return array(
                    'grade' => 'C',
                    'comment' => 'Credit'
                );
            } elseif($score >= 50 && $score <=59){
                return array(
                    'grade' => 'P',
                    'comment' => 'Pass'
                );
            } elseif($score >= 0 && $score <= 49){
                return array(
                    'grade' => 'F',
                    'comment' => 'Fail'
                );
            } else {
                return array(
                    'grade' => '',
                    'comment' => ''
                );
            }
    }

}