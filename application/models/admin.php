<?php
/**
 * File Description here.
 * Author: Mfawa Alfred Onen
 * Date: 5/1/13
 * Version: v1.0
 * File: user.php
 */

class Admin extends Basemodel {

//  Validation Rules
    private static $examination_rules = array(
        'mathematics' => 'required|numeric',
        'english' => 'required|numeric',
        'science' => 'required|numeric',
        'social_science' => 'required|numeric',
        'quran' => 'required|numeric',
        'arabic' => 'required|numeric',
    );


//  Validation
    public static function examination_validation($input){
        return static::validation($input, static::$examination_rules);
    }


//  DB Inserts
    public static function official_use($data){
        $examination_data = array(
            'mathematics' => $data['mathematics'],
            'english' => $data['english'],
            'science' => $data['science'],
            'social_science' => $data['social_science'],
            'quran' => $data['quran'],
            'arabic' => $data['arabic'],
            'user_id' => $data['user_id'],
        );
        $official_use_data = array(
            'last_class_id' => $data['last_class'],
            'present_class_id' => $data['present_class'],
            'admission_recommendation_id' => $data['admission_recommendation_id'],
            'aic_id' => $data['class_admitted_into'],
            'admission_no' => Ais::generate_admission_no(1,6,'AR'),
            'user_id' => $data['user_id'],
        );

        // Insert
        $examination = DB::table('entrance_examination')->insert($examination_data);
        $official_use = DB::table('official_use')->insert($official_use_data);

        if( $examination && $official_use ) {
            $reg_status = array('reg_status' => 8);
            static::update_reg_status($data['user_id'],$reg_status);
            return true;
        } else {
            return false;
        }
    }

    public static function approve_notify($id){
      // Send Email
      // Send SMS
      // Update Registration Status
      $approve_data = array('reg_status' => 9);
      static::update_current_class($id);
      return static::update_reg_status($id, $approve_data);
    }

//  DB Updates
    protected static function update_reg_status($user_id, $data){
        $reg_status = DB::table('biodata')->where('user_id','=', $user_id)->update($data);
        if($reg_status) {
            return true;
        } else {
            return false;
        }
    }

    protected static function update_current_class($user_id){
        $present_class = DB::table('official_use')->where('user_id','=',$user_id)->first(array('aic_id'));
        $reg_status = DB::table('biodata')->where('user_id','=', $user_id)->update(array('current_class_id'=>$present_class->aic_id));
        if($reg_status) {
            return true;
        } else {
            return false;
        }
    }

//  DB Deletes
    public static function delete_school($school_id){
        $delete = DB::table('schools_attended')->where('id','=',$school_id)->delete();
        if( $delete ){ return true; } else { return false; }
    }

//  Secondary DB Queries
    public static function applicants_list(){
        $applicants = DB::table('biodata')->left_join('users','biodata.user_id','=','users.id')
            ->where('biodata.reg_status','=',7)
            ->get(array('users.id','users.firstname','users.surname','users.email','biodata.age','biodata.form_no','biodata.application_type_id'));
        if($applicants){return $applicants;} else { return false;}
    }

    public static function admissions_list(){
        $applicants = DB::table('official_use')->left_join('biodata','official_use.user_id','=','biodata.user_id')
            ->left_join('users','official_use.user_id','=','users.id')
            ->where('biodata.reg_status','=',8)
            ->get(array('users.id','users.firstname','users.surname','official_use.admission_no','official_use.aic_id','official_use.admission_recommendation_id'));
        if($applicants){return $applicants;} else { return false;}
    }


}