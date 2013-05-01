<?php
/**
 * Utility Class for AIS Portal.
 * Author: Mfawa Alfred Onen
 * Date: 5/1/13
 * Version: v1.0
 * File: ais.php
 */

class Ais {

    public static function term_dropdown($name, $selected = null, $attributes = array()){
        $opts = DB::table('terms')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->term_name;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function state_dropdown($name, $selected = null, $attributes = array()){
        $opts = DB::table('states')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->state_name;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function role_dropdown($name, $selected = null, $attributes = array()){
        $opts = DB::table('roles')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->role_name;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function nationality_dropdown($name, $selected = 118, $attributes = array()){
        $opts = DB::table('nationality')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->nationality_name;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function gender_dropdown($name, $selected = null, $attributes = array()){
        $opts = DB::table('gender')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->gender_name;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function class_dropdown($name, $selected = null, $attributes = array()){
        $opts = DB::table('classes')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->class_name;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function application_type_dropdown($name, $selected = null, $attributes = array()){
        $opts = DB::table('application_type')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->application_type_name;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function admission_recommendation_dropdown($name, $selected = null, $attributes = array()){
        $opts = DB::table('admission_recommendation')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->admission_remark;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function academic_session_dropdown($name, $selected = null, $attributes = array()){
        $opts = DB::table('academic_sessions')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->academic_session;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

   public static function payment_category_dropdown($name, $selected = null, $attributes = array()){
        $opts = DB::table('payment_categories')->get();
        foreach($opts as $opt){
            $options[$opt->id] = $opt->payment_name;
        }
        return Form::select($name, $options, $selected, $attributes);
    }

    public static function generate_pin($number_to_gen = '', $pin_length = ''){
        $num_to_gen = (! empty($number_to_gen))? $number_to_gen : 10;
        $length = (! empty($pin_length))? $pin_length : 6;

        for($i = 1; $i <= (int) $num_to_gen; $i++){
            $pin[] = substr((mt_rand().mt_rand().mt_rand()), 0, $length);
        }

        return $pin;
    }

    public static function message_format($text, $css_class){
        return '<p class="'.$css_class.'">'.$text.'</p>';
    }

}