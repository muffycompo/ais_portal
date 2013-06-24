<?php
/**
 * File Description here.
 * Author: Mfawa Alfred Onen
 * Date: 5/1/13
 * Version: v1.0
 * File: user.php
 */

class Events extends Basemodel {

//  Validation Rules
    private static $new_event_rules = array(
        'event_title' => 'required|min:3|max:160',
        'event_url' => 'url',
        'start_date' => 'required|date_format:Y-m-d H\\:i\\:s',
        'event_for_group_id' => 'required',
    );

    //  Validation
    public static function new_event_validation($input){
        $validation_rules = static::$new_event_rules;
        // If Event is All Day
        if(!isset($input['all_day'])){
            $validation_rules['end_date'] = 'required|date_format:Y-m-d H\\:i\\:s';
        }
        // If Event is for students
        if($input['event_for_group_id'] == 1){
            $validation_rules['student_class_id'] = 'required';
        }
        return static::validation($input, $validation_rules);
    }

    public static function new_event($data){
        $event_data = array(
            'event_title' => Str::title($data['event_title']),
            'event_url' => Str::lower($data['event_url']),
            'start_date' => $data['start_date'],
            'event_for_group_id' => $data['event_for_group_id'],
        );
        if($data['event_for_group_id'] == 1){$event_data['student_class_id'] = $data['student_class_id'];}
        if(!isset($data['all_day'])){
            $event_data['end_date'] = $data['end_date'];
        } else {
            $event_data['all_day'] = $data['all_day'];
        }
        $event = DB::table('events')->insert($event_data);
        if($event){
            return $event;
        } else {
            return FALSE;
        }
    }

    public static function calendar_events(){
        $all_events = static::all_calendar_events();
        $student_events = static::students_calendar_events();
        if(!is_null($all_events) && !is_null($student_events)){
            $events = array_merge($all_events,$student_events);
            return static::format_for_calendar($events);
        } elseif(!is_null($all_events)){
            return static::format_for_calendar($all_events);
        } elseif(!is_null($student_events)){
            return static::format_for_calendar($student_events);
        } else {
            return array();
        }
    }

    protected static function all_calendar_events(){
        $events = DB::table('events')->where('event_for_group_id','!=',1)->get();
        if($events){
            return $events;
        } else {
            return null;
        }
    }

    protected static function students_calendar_events(){
        $user_id = Session::get('user_id');
        $class_id = (Ais::resolve_classid_from_userid($user_id) == '')? Ais::resolve_classid_from_teacher_userid($user_id) : Ais::resolve_classid_from_userid($user_id);
        $events = DB::table('events')->where('event_for_group_id','=',1)->where('student_class_id','=',$class_id)->get();
        if($events){
            return $events;
        } else {
            return null;
        }
    }

    protected static function format_for_calendar($events){
        if(is_array($events)){
            $event = array();
                // format for Calendar
                foreach ($events as $evt) {
                    $e = array(
                        'id' => $evt->id,
                        'title' => $evt->event_title,
                        'start' => $evt->start_date,
                        'allDay' => ($evt->all_day == 1)? true: false,
                    );
                    if(!is_null($evt->end_date) && !empty($evt->end_date)){ $e['end'] = $evt->end_date; }
                    if(!is_null($evt->event_url) && !empty($evt->event_url)){ $e['url'] = $evt->event_url; }
                    $event[] = (object) $e;
                }
            return $event;
        } else {
            return $events;
        }

    }

    // MySQL Event Scheduler: ais_event_cleaner
    // DELETE FROM events WHERE CURDATE() > DATE(end_date) OR (CURDATE() > DATE(start_date) AND all_day = 1)
    // Every 3 Hours
    // =================
//    CREATE EVENT `ais_event_cleaner`
//    ON SCHEDULE EVERY 3 HOUR STARTS '2013-06-24 01:01:52'
//    ON COMPLETION NOT PRESERVE
//    ENABLE
//    DO
//    DELETE FROM events WHERE CURDATE() > DATE(end_date) OR (CURDATE() > DATE(start_date) AND all_day = 1);

}