<?php

class Home_Controller extends Base_Controller {

    public $restful = true;


	public function get_index()
	{
		return Redirect::to_route('user_login');
	}

}