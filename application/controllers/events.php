<?php

class Events_Controller extends Base_Controller {

    public $restful = true;


	public function get_calendar()
	{
        $v_data['nav'] = 'calendar_nav';
        return View::make('events/calendar',$v_data);
	}

	public function get_notification()
	{

	}

	public function get_event_list()
	{
        $v_data['nav'] = 'calendar_nav';
        $v_data['events'] = Events::calendar_events(true);
        return View::make('events.event_list',$v_data);
	}

	public function get_new_event()
	{
        $v_data['nav'] = 'calendar_nav';
        return View::make('events.new_event',$v_data);
	}

	public function get_edit_event($event_id)
	{
        $v_data['nav'] = 'calendar_nav';
        $v_data['event'] = Events::show_event($event_id);
        return View::make('events.edit_event',$v_data);
	}

	public function get_delete_event($event_id)
	{
       $event = Events::delete_event($event_id);
       if( $event === false ){
           return Redirect::back()->with('message',Ais::message_format('An error occurred while deleting the event, please try again!','error'));
       } else {
           return Redirect::back()->with('message',Ais::message_format('Event deleted successfully!','success'));
       }
	}

	public function get_events_feed()
	{
        $events = Events::calendar_events();
        return Response::json($events);
	}

	public function post_new_event()
	{
        $validate = Events::new_event_validation(Input::all());
        if( $validate === true ){
           $event = Events::new_event(Input::all());
           if( $event === false ){
               return Redirect::back()->with('message',Ais::message_format('An error occurred while adding the event, please try again!','error'))->with_input();
           } else {
               return Redirect::to_route('calendars')->with('message',Ais::message_format('Event added successfully!','success'))->with_input();
           }
        } else {
           return Redirect::back()->with_errors($validate)->with_input();
        }
    }

	public function post_edit_event()
	{
        $validate = Events::new_event_validation(Input::all());
        if( $validate === true ){
           $event = Events::edit_event(Input::all());
           if( $event === false ){
               return Redirect::back()->with('message',Ais::message_format('An error occurred while updating the event, please try again!','error'))->with_input();
           } else {
               return Redirect::to_route('event_list')->with('message',Ais::message_format('Event updated successfully!','success'))->with_input();
           }
        } else {
           return Redirect::back()->with_errors($validate)->with_input();
        }
    }


}