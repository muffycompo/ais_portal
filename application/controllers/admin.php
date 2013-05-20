<?php

class Admin_Controller extends Base_Controller {

    public $restful = true;

	public function get_admissions(){
		return View::make('admin.admissions_dashboard');
	}

	public function get_admissions_list(){
        $v_data['admissions'] = Admin::admissions_list();
		return View::make('admin.admissions_list',$v_data);
	}

	public function get_applicants_list(){
        $v_data['applicants'] = Admin::applicants_list();
		return View::make('admin.applicants_list',$v_data);
	}

	public function get_official_use($id){
        $v_data['user'] = User::show_user((int)$id);
		return View::make('admin.official_use',$v_data);
	}

	public function get_approve_admission($id){
        $approve = Admin::approve_notify((int)$id);
        if( $approve === false ){
            return Redirect::back()->with('message',Ais::message_format('An error occurred while approving the admission, please try again!','error'))->with_input();
        } else {
            return Redirect::back()->with('message',Ais::message_format('Admission approved and applicant notified successfully!','success'));
        }
	}


    public function post_official_use(){
        $validate = Admin::examination_validation(Input::all());
        if( $validate === true ){
            $official = Admin::official_use(Input::all());
            if( $official === false ){
                return Redirect::back()->with('message',Ais::message_format('An error occurred while processing the admission, please try again!','error'))->with_input();
            } else {
                return Redirect::to_route('applicants_list')->with('message',Ais::message_format('Admission processed successfully!','success'));
            }
        } else {
            return Redirect::back()->with_errors($validate)->with_input();
        }
    }


}