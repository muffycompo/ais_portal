<?php

class Staff extends Basemodel {

    private static $new_staff_rules = array(
        'staff_no' => 'required|unique:staff_records',
        'name' => 'required|min:3|max:64',
        'date_of_birth' => 'required|date_format:Y-m-d',
        'address' => 'required',
        'contact_phone' => 'required',
        'qualification' => 'required',
        'employment_date' => 'required|date_format:Y-m-d',
        'years_of_experience' => 'required|numeric',
        'account_number' => 'required|numeric',
        'passport' => 'required|image',
    );

    private static $edit_staff_rules = array(
        'name' => 'required|min:3|max:64',
        'date_of_birth' => 'required|date_format:Y-m-d',
        'address' => 'required',
        'contact_phone' => 'required',
        'qualification' => 'required',
        'employment_date' => 'required|date_format:Y-m-d',
        'years_of_experience' => 'required|numeric',
        'account_number' => 'required|numeric',
    );

    private static $staff_passport_rules = array(
        'passport' => 'required|image'
    );

    private static $incentive_rules = array(
        'incentive_name' => 'required|min:3',
        'incentive_percentage' => 'required|numeric',
    );

    private static $staff_salary_rules = array(
        'basic_monthly_salary' => 'required|numeric',
        'payment_date' => 'required|date_format:Y-m-d',
    );

    public static function new_user_validation($input){
        return static::validation($input, static::$new_staff_rules);
    }

    public static function edit_user_validation($input){
        return static::validation($input, static::$edit_staff_rules);
    }

    public static function staff_passport_validation($input){
        return static::validation($input, static::$staff_passport_rules);
    }

    public static function incentive_validation($input){
        return static::validation($input, static::$incentive_rules);
    }

    public static function staff_salary_validation($input){
        return static::validation($input, static::$staff_salary_rules);
    }

    public static function staff_list()
    {
        $staff = DB::table('staff_records')->get();
        return !$staff ? false : $staff;
    }

    public static function staff_details($staff_id)
    {
        $staff = DB::table('staff_records')->where('id','=',$staff_id)->first();
        return !$staff ? false : $staff;
    }

    public static function all_staff_incentives()
    {
        $incentives = DB::table('incentives')->get();
        return !$incentives ? false : $incentives;
    }

    public static function staff_salary($id = '')
    {
        $salaries = empty($id)?
            DB::table('salaries')->get() : DB::table('salaries')->where('staff_id','=', $id)->get();
        return !$salaries ? false : $salaries;
    }

    public static function new_staff($data)
    {
        $new_user = array(
            'staff_no' => Str::upper($data['staff_no']),
            'name' => Str::title($data['name']),
            'address' => $data['address'],
            'contact_phone' => $data['contact_phone'],
            'email_address' => Str::lower($data['email']),
            'qualification' => Str::title($data['qualification']),
            'date_of_birth' => $data['date_of_birth'],
            'department' => $data['department'],
            'years_of_experience' => $data['years_of_experience'],
            'employment_date' => $data['employment_date'],
            'passport' => static::upload_staff_photo($data['passport']),
            'gender_id' => $data['gender_id'],
            'state_of_origin' => $data['state_of_origin'],
            'nationality_id' => $data['nationality_id'],
            'designation_id' => $data['designation_id'],
            'bank_id' => $data['bank_id'],
            'bank_account_number' => $data['account_number'],
        );
        $user = DB::table('staff_records')->insert($new_user);
        return $user ? $user : false;
    }

    public static function edit_staff($data)
    {
        $staff_id = $data['staff_id'];
        $edit_user = array(
            'name' => Str::title($data['name']),
            'address' => $data['address'],
            'contact_phone' => $data['contact_phone'],
            'email_address' => Str::lower($data['email']),
            'qualification' => Str::title($data['qualification']),
            'date_of_birth' => $data['date_of_birth'],
            'department' => $data['department'],
            'years_of_experience' => $data['years_of_experience'],
            'employment_date' => $data['employment_date'],
            'gender_id' => $data['gender_id'],
            'state_of_origin' => $data['state_of_origin'],
            'nationality_id' => $data['nationality_id'],
            'designation_id' => $data['designation_id'],
            'bank_id' => $data['bank_id'],
            'bank_account_number' => $data['account_number'],
        );
        $user = DB::table('staff_records')->where('id','=',$staff_id)->update($edit_user);
        return $user ? $user : false;
    }

    public static function staff_incentive($data)
    {
        $new_incentive = array(
            'incentive_name' => Str::title($data['incentive_name']),
            'incentive_percentage' => $data['incentive_percentage'],
            'incentive_type_id' => $data['incentive_type'],
        );
        $incentive = DB::table('incentives')->insert($new_incentive);
        return $incentive ? $incentive : false;
    }

    public static function salary($data)
    {
        $staff_id = $data['staff_id'];
        $staff_salary = array(
            'basic_monthly_salary' => $data['basic_monthly_salary'],
            'bonus' => $data['bonus'],
            'staff_id' => $staff_id,
            'payment_date' => $data['payment_date'],
        );
        $count = DB::table('salaries')->where('staff_id','=',$staff_id)->where('payment_date','=',$data['payment_date'])->count();
        if($count > 0){
            unset($staff_salary['staff_id']);
            $salary = DB::table('salaries')->where('staff_id','=',$staff_id)->update($staff_salary);
        } else {
            $salary = DB::table('salaries')->insert($staff_salary);
        }
        return $salary ? $salary : false;
    }

    public static function staff_passport($data)
    {
        $staff_id = $data['staff_id'];
        // Delete existing Image
        $filename = path('public') . DS .'/uploads/staff/' . $data['photo_name'];
        if(file_exists($filename)){
            @unlink($filename);
        }
        $passport = array(
            'passport' => static::upload_staff_photo($data['passport']),
        );
        $photo = DB::table('staff_records')->where('id','=',$staff_id)->update($passport);
        return $photo? $photo : false;
    }

    public static function upload_staff_photo($input){
        $user_upload_dir = path('public') . DS .'/uploads/staff';
        $ext = explode('.', File::extension($input['name']));
        $filename = time() .'_passport.' .$ext[0]; //php fileinfo dependent
        // Check if folder for user does not exist and create it
        if(!file_exists($user_upload_dir)){
            mkdir($user_upload_dir,0777,true);
        }
        // Upload file to folder
        Input::upload('passport', $user_upload_dir, $filename);
        // Resize Passport to 105px X 115px
        Resizer::open($user_upload_dir . '/' . $filename)->resize(105, 115, 'exact' )->save($user_upload_dir . '/' . $filename, 95);
        return $filename;
    }

    public static function delete_staff($id)
    {
        $delete = DB::table('staff_records')->delete($id);
        return $delete? $delete : false;
    }

    public static function delete_incentive($id)
    {
        $delete = DB::table('incentives')->delete($id);
        return $delete? $delete : false;
    }

    public static function delete_salary($id)
    {
        $delete = DB::table('salaries')->delete($id);
        return $delete? $delete : false;
    }

}