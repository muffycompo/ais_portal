<?php
/**
 * File Description here.
 * Author: Mfawa Alfred Onen
 * Date: 5/1/13
 * Version: v1.0
 * File: users.php
 */

class Users_Controller extends Base_Controller {

   public $restful = true;

    public function __construct(){
        parent::__construct();
        $this->filter('before','auth')->except(array('login','signup','signup_complete','forgot_password','password_confirmation','logout'));
        $this->filter('before','auth')->except(array('login','signup','forgot_password'))->on('post');
    }

//    Controller Actions - GET
    public function get_index(){
        $v_data['users'] = User::all_admin_users();
        $v_data['nav'] = 'user_nav';
        return View::make('users.userlist',$v_data);
    }

    public function get_students(){
        $v_data['users'] = User::all_students();
        $v_data['nav'] = 'user_nav';
        return View::make('users.studentlist',$v_data);
    }

    public function get_login(){
        return View::make('users.login');
    }

    public function get_signup(){
        return View::make('users.signup');
    }

    public function get_dashboard(){
        $v_data['nav'] = 'dashboard';
        return View::make('users.dashboard', $v_data);
    }

    public function get_profile(){
        $v_data['user'] = User::user_profile();
        $v_data['nav'] = 'user_nav';
        return View::make('users.profile', $v_data);
    }

   public function get_signup_complete(){
        return View::make('users.signup_complete');
    }

    public function get_new_user(){
        $v_data['nav'] = '';
        return View::make('users.new_user', $v_data);
    }

    public function get_edit_user($id){
        $v_data['user'] = User::show_user($id);
        $v_data['nav'] = 'user_nav';
        return View::make('users.edit_user', $v_data);
    }

    public function get_edit_profile($id){
        $v_data['user'] = User::show_user($id);
        $v_data['nav'] = 'user_nav';
        return View::make('users.edit_profile', $v_data);
    }

    public function get_forgot_password(){
        return View::make('users.forgot_password');
    }

    public function get_password_confirmation(){
        return View::make('users.password_confirmation');
    }

    public function get_delete_user($id){
        $delete = User::delete_user($id);
        if( $delete === false ){
            return Redirect::back()->with('message',Ais::message_format('An error occurred while deleting the user!','error'));
        } else {
            return Redirect::back()->with('message',Ais::message_format('User deleted successfully!','success'));
        }
    }

   public function get_logout(){
       Session::flush();
       Auth::logout();
       return Redirect::to_route('home');
    }


//    Controller Actions - POST

    public function post_login(){
        $validate = User::login_validation(Input::all());
        if( $validate === true ){
            $login = User::authenticate_user(Input::all());
            if( $login === false ){
                return Redirect::back()->with('message',Ais::message_format('Email/Password combination is invalid!','error'))->with_input();
            } else {
                return Redirect::to_route('user_dashboard');
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_signup(){
        $validate = User::signup_validation(Input::all());
        if( $validate === true ){
            $signup = User::new_signup(Input::all());
            if( $signup === false ){
                return Redirect::back()->with('message','An error occurred while creating your account, please try again later!');
            } else {
                return Redirect::to_route('signup_complete')->with('email',$signup['email'])->with('gsm',$signup['gsm_no']);
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_new_user(){
        $validate = User::new_user_validation(Input::all());
        if( $validate === true ){
            $signup = User::new_user(Input::all());
            if( $signup === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while adding the new user, please try again later!','error'))->with_input();
            } else {
                return Redirect::to_route('users')->with('message',Ais::message_format('Added new user successfully','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_edit_user(){
        $validate = User::edit_user_validation(Input::all());
        if( $validate === true ){
            $signup = User::edit_user(Input::all());
            if( $signup === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while updating the user, please try again later!','error'))->with_input();
            } else {
                return Redirect::to_route('users')->with('message',Ais::message_format('User updated successfully','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_edit_profile(){
        $validate = User::edit_profile_validation(Input::all());
        if( $validate === true ){
            $signup = User::edit_profile(Input::all());
            if( $signup === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while updating your profile, please try again later!','error'))->with_input();
            } else {
                return Redirect::to_route('user_profile')->with('message',Ais::message_format('Profile updated successfully','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }

    public function post_upload_photo(){
        $validate = Registration::upload_photo_validation(Input::all());
        if( $validate === true ){
            $parent = User::upload_photo(Input::all());
            if( $parent === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while uploading your Profile Photo, please try again!','error'))->with_input();
            } else {
                return Redirect::back()->with('message',Ais::message_format('Profile Photo Uploaded successfully','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }


    public function post_forgot_password(){
        $validate = User::forgot_password_validation(Input::all());
        if( $validate === true ){
            $reset = User::reset_password(Input::all());
            if( $reset === 1 ){
                return Redirect::back()->with('message',Ais::message_format('We do not have that email address in our database!','error'))->with_input();
            } else {
                return Redirect::to_route('password_confirmation')->with('email',Input::get('email'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }



}