<?php
/**
 * File Description here.
 * Author: Mfawa Alfred Onen
 * Date: 5/1/13
 * Version: v1.0
 * File: user.php
 */

class User extends Basemodel {

//  Validation Rules
    private static $login_rules = array(
        'email' => 'required|email',
        'password' => 'required',
    );

    private static $signup_rules = array(
        'firstname' => 'required|min:3',
        'surname' => 'required|min:3',
        'email' => 'required|email|unique:users',
        'gsm_no' => 'required|gsm_number',
        'password' => 'required|min:5|confirmed',
        'password_confirmation' => 'required',
        'pin_no' => 'required|pin',
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
        'email' => 'required|email',
        'password' => 'min:5',
        'phone_number' => 'numeric|min:10',
    );

   private static $forgot_password_rules = array(
        'email' => 'email|required',
    );

   private static $search_rules = array(
        'search' => 'required|min:3',
    );

   private static $student_bio_rules = array(
        'age' => 'numeric|required',
//        'house' => 'required',
    );

//  Validation
    public static function login_validation($input){
        return static::validation($input, static::$login_rules);
    }

   public static function signup_validation($input){
        return static::validation($input, static::$signup_rules);
    }

    public static function new_user_validation($input){
        return static::validation($input, static::$user_rules);
    }

    public static function edit_user_validation($input){
        return static::validation($input, static::$edit_user_rules);
    }

    public static function edit_profile_validation($input){
        return static::validation($input, static::$edit_user_rules);
    }

    public static function forgot_password_validation($input){
        return static::validation($input, static::$forgot_password_rules);
    }

    public static function search_validation($input){
        return static::validation($input, static::$search_rules);
    }

    public static function student_bio_validation($input){
        return static::validation($input, static::$student_bio_rules);
    }

//  Authentication
    public static function authenticate_user($data){
        $auth_data = array(
            'username' => Str::lower($data['email']),
            'password' => $data['password'],
        );
        $auth = Auth::attempt($auth_data);
        if( $auth ){
            $user = Auth::user();
            if(!empty($data['remember'])){
                // User chose to login indefinitely
                Auth::login($user->id,true);
            }
            // Set the auth sessions
            Session::put('user_id',$user->id);
            Session::put('email',$user->email);
            Session::put('firstname',$user->firstname);
            Session::put('surname',$user->surname);
            Session::put('role_id',$user->role_id);

            return $user;
        } else {
            return false;
        }
    }

//  DB Inserts
    public static function new_signup($data){
        $signup_data = array(
            'firstname' => Str::upper($data['firstname']),
            'surname' => Str::upper($data['surname']),
            'email' => Str::lower($data['email']),
            'password' => Hash::make($data['password']),
            'role_id' => 1,
        );
        $new_signup = DB::table('users')->insert($signup_data);
        if( $new_signup ) {
            // Notify Via Email and SMS
            $gsm_no = Ais::gsm_no_formatter($data['gsm_no']);
            $user_email = Str::lower($data['email']);
            $email_body = 'Thank you <strong>'.$signup_data['firstname'] .' '. $signup_data['surname'].'</strong> for choosing Ah-Rahman International School, Kindly use your credentials below to login:<br>email: <strong>'.$user_email.'</strong><br>password: <strong>'.$data['password'].'</strong><br><br> Ah-Rahman International School.';
            Ais::send_email('AIS Portal',$user_email,'AIS Portal Signup Credentials',$email_body);

            // Update PIN Usage
            //'pin_no' => ,
            static::update_pin($data['pin_no']);
            $signup_data['gsm_no'] = $gsm_no;
            return $signup_data;
        } else {
            return false;
        }

    }

    public static function user_profile(){
        $user_id = Session::get('user_id');
        $profile = DB::table('users')->where('id','=',$user_id)->first();
        if($profile){
            return $profile;
        } else {
            return null;
        }
    }

    public static function search_user($data){
        $search = Str::upper($data['search']);
        $admission_no = Ais::resolve_userid_from_admission_no($search);

        $db = DB::table('users')
                    ->where('role_id','=',1)
                    ->where('firstname','LIKE',"$search%")
                    ->or_where('surname','LIKE',"$search%")
                    ->or_where('email','LIKE',"$search%")
                    ->or_where('id','=',$admission_no)
                    ->get();
        if( $db ) {
            return $db;
        } else {
            return false;
        }

    }

    public static function new_user($data){
        $user_data = array(
            'firstname' => Str::upper($data['firstname']),
            'surname' => Str::upper($data['surname']),
            'email' => Str::lower($data['email']),
            'password' => Hash::make($data['password']),
            'role_id' => $data['role_id'],
        );
        $new_user = DB::table('users')->insert($user_data);
        if( $new_user ) {
            return $user_data;
        } else {
            return false;
        }

    }

    public static function student_bio($data){
        $id = $data['user_id'];
        $bio_data = array(
            'age' => $data['age'],
            'gender_id' => $data['gender_id'],
        );

        $student_bio = DB::table('biodata')->where('user_id','=',$id)->update($bio_data);
        if( $student_bio ) {
            return $student_bio;
        } else {
            return false;
        }

    }

    public static function reset_password($data){
        $email = Str::lower($data['email']);
        // verify that user has an account
        $random_pass = Ais::generate_pin(1,6);
        $password = $random_pass[0];
        if(static::check_email_exit($email)){
            DB::table('users')->where('email','=',$email)->update(array('password'=>Hash::make($password)));
            $email_body = '
                <p>
                Hello,<br>
                Your password has been reset successfully. Kindly use the credentials below to login to our portal:<br>
                Email: <strong>'.$email.'</strong><br>
                Password: <strong>'.$password.'</strong><br><br>
                Note: You are required to change this password IMMEDIATELY to something you can remember.<br><br>
                <strong>Ah-Rahman Internation School</strong>
                </p>
            ';
            Ais::send_email('AIS Portal',$email,'AIS Portal Password Reset',$email_body);
            return $password;
        } else {
            return 1;
        }
    }

//  DB Updates
    protected static function update_pin($pin){
        DB::table('pins')->where('pin_no','=',$pin)->update(array('usage_status' => 1));
    }
//  DB Deletes
    public static function delete_user($user_id){
        $delete = DB::table('users')->where('id','=',$user_id)->delete();
        if( $delete ){ return true; } else { return false; }
    }

//  Secondary DB Queries
    public static function check_pin($pin){
        $pin_count = DB::table('pins')->where('pin_no','=',$pin)->where('usage_status','=',0)
                    ->where('issuance_status','=',1)->count();
        if($pin_count == 1){return true;} else { return false;}
    }

   protected static function check_email_exit($email){
        $count = DB::table('users')->where('email','=',$email)->count();
        if($count == 1){return true;} else { return false;}
    }

    public static function all_admin_users(){
        $users = DB::table('users')->where('role_id','!=',1)->order_by('firstname','asc')->get();
        if( $users ){
            return $users;
        } else {
            return null;
        }
    }

    public static function all_students(){
        $users = DB::table('users')->where('role_id','=',1)->order_by('firstname','asc')->get();
        if( $users ){
            return $users;
        } else {
            return null;
        }
    }

   public static function show_user($user_id){
        $users = DB::table('users')->where('id','=',$user_id)->first();
        if( $users ){
            return $users;
        } else {
            return false;
        }
    }

   public static function show_biodata_meta($user_id){
       $role_id = Ais::resolve_userrole_userid($user_id);
       if($role_id == 1)
       {
           $users = DB::table('biodata')->where('user_id','=',$user_id)->first(array('phone_number'));
       }
       else
       {
           $users = DB::table('staff_biodata')->where('user_id','=',$user_id)->first(array('phone_number'));
       }
        if( $users ){
            return $users;
        } else {
            return false;
        }
    }

   public static function show_student_bio($user_id){
        $users = DB::table('biodata')->where('user_id','=',$user_id)->first(array('age','gender_id'));
        if( $users ){
            return $users;
        } else {
            return false;
        }
    }

   public static function edit_user($data){
       $user_id = $data['user_id'];
       $class = false;
       $edit_user = array(
           'firstname' => Str::upper($data['firstname']),
           'surname' => Str::upper($data['surname']),
           'email' => Str::lower($data['email']),
       );
       if( ! empty($data['password']) ) { $edit_user['password'] = Hash::make($data['password']); }

       if( isset($data['role_id']) )
       {
           $edit_user['role_id'] = $data['role_id'];
           if(Ais::has_biodata_meta($data['user_id'],$data['role_id'])){
               if(!empty($data['phone_number'])){
                   $biodata = DB::table('staff_biodata')->where('user_id','=',$data['user_id'])->update(array('phone_number' => $data['phone_number']));
               }
           } else {
               if(!empty($data['phone_number'])){
                   $biodata = DB::table('staff_biodata')->insert(array('phone_number' => $data['phone_number'], 'user_id' => $data['user_id']));
               }
           }

       } else {
           if(!empty($data['phone_number'])){
               $biodata = DB::table('biodata')->where('user_id','=',$data['user_id'])->update(array('phone_number' => $data['phone_number']));
           }
       }

       $users = DB::table('users')->where('id','=',$user_id)->update($edit_user);
       if(isset($data['class_id']) && ! empty($data['class_id'])) {
           $bdata_update = array(
               'current_class_id' => $data['class_id'],
               'gender_id' => $data['gender_id'],
               'state_id' => $data['state_id']
           );
           $class = DB::table('biodata')->where('user_id','=',$data['user_id'])->update($bdata_update);
       }

        if( $users){
            return $users;
        } else {
            if($class !== false){
                return $class;
            } elseif ($biodata !== false){
                return $biodata;
            }
            return false;
        }
    }

   public static function edit_profile($data){
       $user_id = $data['user_id'];
       $role_id = Session::get('role_id');
       $edit_user = array(
           'firstname' => Str::upper($data['firstname']),
           'surname' => Str::upper($data['surname']),
       );
        if( ! empty($data['password']) ) { $edit_user['password'] = Hash::make($data['password']); }
       if($role_id == 1 && isset($data['class_id'])){
           $migrate = array(
               'current_class_id' => $data['class_id'],
               'migration' => 0
           );
           DB::table('biodata')->where('user_id','=',$user_id)->update($migrate);
       }
       $users = DB::table('users')->where('id','=',$user_id)->update($edit_user);
        if( $users ){
            Session::put('firstname',$edit_user['firstname']);
            Session::put('surname',$edit_user['surname']);
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
        DB::table('biodata')->where('user_id','=',$user_id)->update(array('passport_path' => $filename));
        // Resize Passport to 105px X 115px
        Resizer::open($user_upload_dir . '/' . $filename)->resize(105, 115, 'exact' )->save($user_upload_dir . '/' . $filename, 95);
        return $upload;
    }




}