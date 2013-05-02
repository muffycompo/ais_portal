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
        'gsm_no' => 'required',
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
        'password' => 'min:5',
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

//  Authentication
    public static function authenticate_user($data){
        $auth_data = array(
            'username' => Str::lower($data['email']),
            'password' => $data['password'],
        );
        $auth = Auth::attempt($auth_data);
        if( $auth ){
            $user = Auth::user();

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
            'firstname' => Str::title($data['firstname']),
            'surname' => Str::title($data['surname']),
            'email' => Str::lower($data['email']),
            'password' => Hash::make($data['password']),
            'role_id' => 1,
        );
        $new_signup = DB::table('users')->insert($signup_data);
        if( $new_signup ) {
            // Notify Via Email and SMS
            //$gsm_no = $data['gsm_no'],
            //$email = Str::lower($data['email'])

            // Update PIN Usage
            //'pin_no' => ,
            static::update_pin($data['pin_no']);
            $signup_data['gsm_no'] = $data['gsm_no'];
            return $signup_data;
        } else {
            return false;
        }

    }

    public static function new_user($data){
        $user_data = array(
            'firstname' => Str::title($data['firstname']),
            'surname' => Str::title($data['surname']),
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

    public static function all_users(){
        $users = DB::table('users')->where('role_id','!=',1)->order_by('firstname','asc')->get();
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


}