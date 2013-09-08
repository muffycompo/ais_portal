<?php
/**
 * A Payroll Library for AIS Portal.
 * Author: Mfawa Alfred Onen
 * Date: 9/8/13
 * Version: v1.0
 * File: payroll.php
 */

class Payroll {

    public function staff_basic_salary($id){
        $db = DB::table('salaries')->where('id','=',$id)->first('basic_monthly_salary');
        return $db? $db->basic_monthly_salary : 0.0;
    }

    public function staff_bonus($id){
        if(empty($id)){ return false; }
        $db = DB::table('salaries')->where('id','=',$id)->first('bonus');
        return $db? (float) $db->bonus : 0.0;
    }

    public function staff_general_incentives($basic_salary){
        $db = DB::table('incentives')->where('incentive_type_id','=',1)->get();
        $general_incentive = 0;
        foreach ($db as $incentive) {
            $general_incentive = $general_incentive + ($basic_salary * ($incentive->incentive_percentage / 100));
        }
        return $general_incentive;
    }

    public function staff_incentives($basic_salary){
        $db = DB::table('incentives')->where('incentive_type_id','=',1)->get();
        $general_incentive = array();
        foreach ($db as $incentive) {
            $general_incentive[$incentive->incentive_name] = $basic_salary * ($incentive->incentive_percentage / 100);
        }
        return $general_incentive;
    }

    public function staff_designated_incentives($staff_id, $basic_salary){
        $designation_id = $this->staff_designation($staff_id);
        switch ($designation_id) {
            case 1:
                # Ordinary Staff
                return 0.0;
                break;
            case 2:
                # Principal
                $incentive_percentage = $this->incentive_percentage(6);
                return $basic_salary * ($incentive_percentage / 100);
                break;
            case 3:
                # Vice Principal
                $incentive_percentage = $this->incentive_percentage(7);
                return $basic_salary * ($incentive_percentage / 100);
                break;
            case 4:
                # HOD/Senior Master
                $incentive_percentage = $this->incentive_percentage(9);
                return $basic_salary * ($incentive_percentage / 100);
                break;
            case 5:
                # Exam Officer
                $incentive_percentage = $this->incentive_percentage(10);
                return $basic_salary * ($incentive_percentage / 100);
                break;
            case 6:
                # Head Cleaner/Security
                $incentive_percentage = $this->incentive_percentage(11);
                return $basic_salary * ($incentive_percentage / 100);
                break;
            case 7:
                # Special Duty/Extension
                $incentive_percentage = $this->incentive_percentage(12);
                return $basic_salary * ($incentive_percentage / 100);
                break;
            default:
                return 0.0;
                break;
        }
    }

    public function staff_designation($staff_id){
        $db = DB::table('staff_records')->where('id','=',$staff_id)->first(array('designation_id'));
        return $db? $db->designation_id : false;
    }

    public function incentive_percentage($incentive_id){
        $db = DB::table('incentives')->where('id','=',$incentive_id)->first('incentive_percentage');
        return $db? $db->incentive_percentage : 0;
    }

    public function staff_id_from_salary($salary_id){
        $db = DB::table('salaries')->where('id','=',$salary_id)->first('staff_id');
        return $db? $db->staff_id : false;
    }

    public function staff_deductions($staff_id, $date, $basic_salary){
        date_default_timezone_set('Africa/Lagos');
        $ddate = date('m-Y',$date);
        $ddeduction = array();
        $db = DB::table('deductions')->where('staff_id','=',$staff_id)->get();
        if(!$db) {
            return 0.0;
        } else {
            foreach ($db as $deduction) {
                if(date('m-Y',strtotime($deduction->deduction_date)) == $ddate){
                    $ddeduction[Expand::deduction($deduction->deduction_type_id)] = $this->deduction_amount_from_type($deduction->deduction_type_id, $basic_salary);
                }
            }
            return $ddeduction;
        }
    }

    public function deduction_amount_from_type($id, $basic_salary){
        switch ($id) {
            case 1:
                # code...
                return (float) ($basic_salary * (40 / 100));
                break;
            case 2:
                # code...
                return (float) ($basic_salary * (7.5 / 100));
                break;
            case 3:
                # code...
                $m = $basic_salary / 30;
                return (float) ($m * (50 / 100));
                break;
            case 4:
                # code...
                return (float)2000;
                break;
            case 5:
                # code...
                return (float)5000;
                break;
            case 6:
                # code...
                return (float)1000;
                break;
            default:
                # code...
                return 0.0;
                break;
        }
    }

    public function pay_staff($salary_id)
    {
        $staff_id =$this->staff_id_from_salary($salary_id);
        $basic_salary = $this->staff_basic_salary($salary_id);
        $bonus = $this->staff_bonus($salary_id);
        $general_incentives = $this->staff_general_incentives($basic_salary);
        $designated_incentives = $this->staff_designated_incentives($staff_id, $basic_salary);

        $total_takehome = (float)$basic_salary + (float)$general_incentives + (float)$designated_incentives + (float)$bonus;
        return $total_takehome;
    }


}