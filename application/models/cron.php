<?php
/**
 * File Description here.
 * Author: Mfawa Alfred Onen
 * Date: 5/1/13
 * Version: v1.0
 * File: user.php
 */

class Cron extends Basemodel {

    public static function clean_events(){
//
       $clean = DB::query("DELETE FROM events WHERE CURDATE() > DATE(end_date) OR (CURDATE() > DATE(start_date) AND all_day = 1)");
        return $clean ? $clean : false;
    }

}