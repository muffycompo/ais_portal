<?php
/**
 * File Description here.
 * Author: Mfawa Alfred Onen
 * Date: 5/1/13
 * Version: v1.0
 * File: user.php
 */

class Registration extends Basemodel {

//  Validation Rules
    private static $biodata_rules = array(
        'firstname' => 'required|min:3',
        'surname' => 'required|min:3',
        'tribe' => 'required',
        'date_of_birth' => 'required',
    );

    private static $new_school_rules = array(
        'school_name' => 'required|min:3',
        'year_from_id' => 'required',
        'year_to_id' => 'required',
    );

   private static $parent_info_rules = array(
       'father_name' => 'required|min:3',
       'father_occupation' => 'required|min:3',
       'father_religion' => 'required',
       'residential_address' => 'required|min:3',
       'father_phone_no' => 'required|min:3|gsm_number',
       'mother_name' => 'required|min:3',
       'mother_occupation' => 'required|min:3',
       'mother_religion' => 'required|min:3',
    );

   private static $medical_record_rules = array(
       'hospital_name' => 'required|min:3',
       'hospital_address' => 'required|min:3',
       'doctor_name' => 'required|min:3',
       'blood_group' => 'required',
       'allergic_reaction' => 'required',
       'disability' => 'required',

    );

   private static $upload_photo_rules = array(
       'passport_photo' => 'required|image',
    );

   private static $upload_docs_rules = array(
       'supporting_docs' => 'required|mimes:jpg,gif,png,pdf,doc,docx',
    );

   private static $finalize_application_rules = array(
       'finalize_registration' => 'required',
    );

//  Validation
    public static function biodata_validation($input){
        return static::validation($input, static::$biodata_rules);
    }

   public static function new_school_validation($input){
        return static::validation($input, static::$new_school_rules);
    }

    public static function edit_new_school_validation($input){
        return static::validation($input, static::$new_school_rules);
    }

   public static function parent_info_validation($input){
        return static::validation($input, static::$parent_info_rules);
    }

   public static function medical_record_validation($input){
        return static::validation($input, static::$medical_record_rules);
    }

   public static function upload_photo_validation($input){
        return static::validation($input, static::$upload_photo_rules);
    }

   public static function upload_docs_validation($input){
        return static::validation($input, static::$upload_docs_rules);
    }

   public static function finalize_application_validation($input){
        return static::validation($input, static::$finalize_application_rules);
    }

//  DB Inserts
    public static function biodata($data){
        $user_id = Session::get('user_id');
        $dob = Ais::reverse_slash_date($data['date_of_birth']);
        $user_data = array(
            'firstname' => $data['firstname'],
            'surname' => $data['surname'],
        );
        $biodata_data = array(
            'age' => Ais::resolve_age($dob),
            'date_of_birth' => $dob,
            'tribe' => $data['tribe'],
            'form_no' => Ais::generate_receipt_no(1,8),
            'gender_id' => $data['gender_id'],
            'state_id' => $data['state_id'],
            'nationality_id' => $data['nationality_id'],
            'current_class_id' => 1,
            'last_class_id' => $data['last_class_id'],
            'csai_id' => $data['csai_id'],
            'application_type_id' => $data['application_type_id'],
        );
        $check_biodata_exist = DB::table('biodata')->where('user_id','=',$user_id)->count();
        if($check_biodata_exist == 1){
            // Update
            DB::table('users')->where('id','=',$user_id)->update($user_data);
            $biodata = DB::table('biodata')->where('user_id','=',$user_id)->update($biodata_data);
        } else {
            // Insert
            $biodata_data['user_id'] = $user_id;
            $biodata = DB::table('biodata')->insert($biodata_data);
            Ais::registration_status(true, 1);
        }

        if( $biodata ) {
            return $biodata;
        } else {
            return false;
        }

    }

    public static function parent_info($data){
        $user_id = Session::get('user_id');
        $parent_data = array(
           'father_name' => Str::title($data['father_name']),
           'father_occupation' => Str::words($data['father_occupation']),
           'father_religion' => Str::words($data['father_religion']),
           'residential_address' => Str::words($data['residential_address']),
           'father_phone_no' => $data['father_phone_no'],
           'mother_name' => Str::title($data['mother_name']),
           'mother_occupation' => Str::words($data['mother_occupation']),
           'mother_religion' => Str::words($data['mother_religion']),
           'mother_phone_no' => $data['father_phone_no'],
        );
        $check_parent_info_exist = DB::table('parental_information')->where('user_id','=',$user_id)->count();
        if($check_parent_info_exist == 1){
            // Update
            $parent = DB::table('parental_information')->where('user_id','=',$user_id)->update($parent_data);
        } else {
            // Insert
            $parent_data['user_id'] = $user_id;
            $parent = DB::table('parental_information')->insert($parent_data);
            Ais::registration_status(true);
        }

        if( $parent ) {
            return $parent;
        } else {
            return false;
        }

    }

    public static function medical_record($data){
        $user_id = Session::get('user_id');
        $medical_data = array(
            'hospital_name' => Str::title($data['hospital_name']),
            'hospital_address' => $data['hospital_address'],
            'doctor_name' => Str::title($data['doctor_name']),
            'doctor_phone_no' => $data['doctor_phone_no'],
            'child_file_no' => $data['child_file_no'],
            'blood_group' => $data['blood_group'],
            'genotype' => $data['genotype'],
            'allergic_reaction' => Str::title($data['allergic_reaction']),
            'allergic_details' => Str::title($data['allergic_details']),
            'disability' => Str::title($data['disability']),
            'disability_details' => Str::title($data['disability_details']),
            'user_id' => $user_id,
        );
        $check_medical_report_exist = DB::table('medical_records')->where('user_id','=',$user_id)->count();
        if($check_medical_report_exist == 1){
            // Update
            $medical = DB::table('medical_records')->where('user_id','=',$user_id)->update($medical_data);
        } else {
            // Insert
            $medical_data['user_id'] = $user_id;
            $medical = DB::table('medical_records')->insert($medical_data);
            Ais::registration_status(true);
        }

        if( $medical ) {
            return $medical;
        } else {
            return false;
        }

    }

    public static function new_school($data){
        $user_id = Session::get('user_id');
        $school_data = array(
            'school_name' => Str::title($data['school_name']),
            'class_from_id' => $data['class_from_id'],
            'class_to_id' => $data['class_to_id'],
            'year_from' => $data['year_from_id'],
            'year_to' => $data['year_to_id'],
            'user_id' => $user_id,
        );
        $school = DB::table('schools_attended')->insert($school_data);
        if( $school ) {
            Ais::registration_status(true);
            return $school;
        } else {
            return false;
        }

    }

    public static function edit_new_school($data){
        $school_data = array(
            'school_name' => Str::title($data['school_name']),
            'class_from_id' => $data['class_from_id'],
            'class_to_id' => $data['class_to_id'],
            'year_from' => $data['year_from_id'],
            'year_to' => $data['year_to_id'],
        );
        $school = DB::table('schools_attended')->where('id','=', $data['school_id'])->update($school_data);
        if( $school ) {
            return $school;
        } else {
            return false;
        }

    }


//  DB Updates
    public static function finalize_application(){
        $user_id = Session::get('user_id');
        $final = DB::table('biodata')->where('user_id','=',$user_id)->update(array('reg_status' => 7));
        if($final) {
            return true;
        } else {
            return false;
        }
    }
   protected static function edit_pin_payment($data){
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
//  DB Deletes
    public static function delete_school($school_id){
        $delete = DB::table('schools_attended')->where('id','=',$school_id)->delete();
        if( $delete ){ return true; } else { return false; }
    }

//  Secondary DB Queries
    public static function user_biodata(){
        $user_id = Session::get('user_id');
        $biodata = DB::table('biodata')->where('user_id','=',$user_id)->first();
        if($biodata){return $biodata;} else { return false;}
    }

   public static function user_meta(){
        $user_id = Session::get('user_id');
        $usermeta = DB::table('users')->where('id','=',$user_id)->first(array('firstname','surname'));
        if($usermeta){return $usermeta;} else { return false;}
    }

    public static function schools_attended(){
        $user_id = Session::get('user_id');
        $schools = DB::table('schools_attended')->where('user_id','=',$user_id)->get();
        if( $schools ){
            return $schools;
        } else {
            return null;
        }
    }

   public static function show_parent_info(){
       $user_id = Session::get('user_id');
       $parents = DB::table('parental_information')->where('user_id','=',$user_id)->first();
        if( $parents ){
            return $parents;
        } else {
            return false;
        }
    }

    public static function show_school($school_id){
       $school = DB::table('schools_attended')->where('id','=',$school_id)->first();
        if( $school ){
            return $school;
        } else {
            return false;
        }
    }

    public static function show_medical_record(){
        $user_id = Session::get('user_id');
        $medical_record = DB::table('medical_records')->where('user_id','=',$user_id)->first();
        if( $medical_record ){
            return $medical_record;
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

// File Operations
    public static function upload_photo($data){
        $user_id = Session::get('user_id');
        $user_upload_dir = path('public') . DS .'/uploads/' . $user_id . '/passport';
        $ext = explode('.', File::extension($data['passport_photo']['name']));
        $filename = $user_id .'_passport.' .$ext[0]; //php fileinfo dependent
        // Check if folder for user does not exist and create it
        if(!file_exists($user_upload_dir)){
            mkdir($user_upload_dir,0777,true);
        }
        // Upload file to folder
        $upload = Input::upload('passport_photo', $user_upload_dir, $filename);
        DB::table('biodata')->where('user_id','=',$user_id)->update(array('passport_path' => $filename, 'reg_status' => 6));
        // Resize Passport to 105px X 115px
        Resizer::open($user_upload_dir . '/' . $filename)->resize(105, 115, 'exact' )->save($user_upload_dir . '/' . $filename, 95);
        return $upload;
    }

    public static function upload_docs($data){
        $user_id = Session::get('user_id');
        $user_upload_dir = path('public') . DS .'/uploads/' . $user_id . '/documents';
        $filename = strtolower(str_replace(' ', '_', $data['supporting_docs']['name']));
        if(!file_exists($user_upload_dir)){
            mkdir($user_upload_dir,0777,true);
        }
        // Upload file to folder
        $upload = Input::upload('supporting_docs', $user_upload_dir, $filename);
        // Check if folder for user does not exist and create it
        return $upload;
    }

    public static function supporting_documents(){
        $user_id = Session::get('user_id');
        $dir = path('public') . DS .'/uploads/' . $user_id . '/documents/';
        if(file_exists($dir)){
            // Remove the . and .. generated by scandir() using array_diff()
            $files = array_diff(scandir($dir), array('.','..'));
        } else {
            $files = array();
        }
        return $files;
    }

    public static function delete_docs($document){
        $user_id = Session::get('user_id');
        $dir = path('public') . DS . '/uploads/' . $user_id . '/documents/';
        $status = File::delete($dir . $document);
        if($status == null){ return false; } else { return true;}
    }



}