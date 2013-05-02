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

//    Controller Actions - GET
    public function get_index(){
        $v_data['users'] = User::all_users();
        return View::make('users.userlist',$v_data);
    }

    public function get_login(){
        return View::make('users.login');
    }

    public function get_signup(){
        return View::make('users.signup');
    }

    public function get_dashboard(){
        return View::make('users.dashboard');
    }

   public function get_signup_complete(){
        return View::make('users.signup_complete');
    }

    public function get_new_user(){
        return View::make('users.new_user');
    }

    public function get_edit_user($id){
        $v_data['user'] = User::show_user($id);
        return View::make('users.edit_user', $v_data);
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
                return Redirect::back()->with('message','Email/Password combination is invalid!')->with_input();
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














//    public function get_generate_pin(){
//        $pin = Ais::generate_pin(10, 12);
//
//        return Response::json($pin,200);
//    }

}