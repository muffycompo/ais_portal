<?php
/**
 * File Description here.
 * Author: Mfawa Alfred Onen
 * Date: 9/12/13
 * Version: v1.0
 * File: cron.php
 */

class Cron_Controller extends Base_Controller {

   public $restful = true;

    public function get_event_cleaner(){
        // Run from cron
        $clean = Cron::clean_events();
        if($clean === false){
            Log::info('Event(s) has already been cleaned');
        }
    }
}