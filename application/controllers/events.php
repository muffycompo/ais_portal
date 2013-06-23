<?php

class Events_Controller extends Base_Controller {

    public $restful = true;


	public function get_calendar()
	{
        $v_data['nav'] = 'calendar_nav';
        return View::make('events/calendar',$v_data);
	}

	public function get_reminder()
	{

	}

	public function get_new_event()
	{
        $v_data['nav'] = 'calendar_nav';
        return View::make('events/new_event',$v_data);
	}

}