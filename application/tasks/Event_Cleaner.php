<?php
class Event_Cleaner_Task {

    public function run($arguments)
    {
		$clean = Cron::clean_events();
        if($clean === false){
            Log::info('Event(s) has already been cleaned');
        }
    }
}