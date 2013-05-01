<?php
/**
 * File Description here.
 * Author: Mfawa Alfred Onen
 * Date: 5/1/13
 * Version: v1.0
 * File: basemodel.php
 */

class Basemodel extends Eloquent {

    public static function validation($validation_input, $validation_rules){
        $validate = Validator::make($validation_input, $validation_rules);

        if($validate->passes()){
            return true;
        } else {
            return $validate;
        }
    }

}