<?php

class Home_Controller extends Base_Controller {

    public $restful = true;


	public function get_index()
	{
		return Redirect::to_route('user_login');
	}

//    public function get_hash_pwd(){
//        $pwd = '123456';
//        return Hash::make($pwd);
//    }
}