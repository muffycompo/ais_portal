<?php
/**
 * File Description here.
 * Author: Mfawa Alfred Onen
 * Date: 5/1/13
 * Version: v1.0
 * File: validator.php
 */

class Validator extends Laravel\Validator {

    public static function validate_pin($attribute, $value){
        if(User::check_pin($value)){ return true;} else {return false;}
    }

}