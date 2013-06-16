<?php
/**
 * Utility Class for AIS Portal.
 * Author: Mfawa Alfred Onen
 * Date: 9/6/13
 * Version: v1.0
 * File: menu.php
 */

class Menu {

    public static function navigation_links($role_id){
        switch ($role_id) {
                case 1:
                    # Student
                    return static::student_role();
                    break;
                case 2:
                    # Teacher
                    return static::teacher_role();
                    break;
                case 3:
                    # Accountant
                    return static::accountant_role();
                    break;
                case 4:
                    # Ecommerce
                    return static::ecommerce_role();
                    break;
                case 5:
                    # Administrator
                    return static::admin_role();
                    break;
                default:
                    # Invalid
                    return '';
                    break;
            }
    }

    protected static function student_role(){
        # Student
        $reg_status = Ais::registration_status();
        $display_menu = '';
        if($reg_status <= 6){
            $display_menu .= '<li>'. HTML::link_to_route('biodata','<span>Bio-Data</span>','',array('class'=>'form')) . '</li>';
            if($reg_status >= 2){
                $display_menu .= '<li>'. HTML::link_to_route('schools_attended','<span>Schools Attended</span>','',array('class'=>'tables')) . '</li>';
            }
            if($reg_status >= 3){
                $display_menu .= '<li>'. HTML::link_to_route('parent_info','<span>Parental Information</span>','',array('class'=>'chat')) . '</li>';
            }
            if($reg_status >= 4){
                $display_menu .= '<li>'. HTML::link_to_route('medical_record','<span>Medical Records</span>','',array('class'=>'charts')) . '</li>';
            }
            if($reg_status >= 5){
                $display_menu .= '<li>'. HTML::link_to_route('uploads','<span>Uploads</span>','',array('class'=>'wizard-form')) . '</li>';
            }
            if($reg_status == 6){
                $display_menu .= '<li>'. HTML::link_to_route('attestation','<span>Attestation</span>','',array('class'=>'wizard-form')) . '</li>';
            }
            return HTML::decode($display_menu);
        } elseif($reg_status == 9) {
            return '
            <li>
                <a class="simple" href="javascript:void(0)" title="Results"><span>Results</span></a>
                <ul class="dropdown">
                    <li>' . HTML::link('results/term_result/1','<span>First Term</span>',array('class'=>'simple smronju','title'=>'First Term'))  .'</li>
                    <li>' . HTML::link('results/term_result/2','<span>Second Term</span>',array('class'=>'simple smronju','title'=>'Second Term'))  .'</li>
                    <li>' . HTML::link('results/term_result/3','<span>Third Term</span>',array('class'=>'simple smronju','title'=>'Third Term'))  .'</li>
                </ul>'
            .'</li>
            <li>'. HTML::link_to_route('student_fee_payments','<span>Payments</span>','',array('class'=>'form')) . '</li>
            <li>'. HTML::link('#','<span>Assignments</span>',array('class'=>'tables')) . '</li>
            <li>'. HTML::link('#','<span>Clubs</span>',array('class'=>'chat')) . '</li>
            <li>'. HTML::link('#','<span>Sports</span>',array('class'=>'charts')) . '</li>
            <li>'. HTML::link('#','<span>Shopping</span>',array('class'=>'wizard-form')) . '</li>';
        }
        return '';
    }

    protected static function admin_role(){
        return '
            <li>
                <a class="wizard-form" href="javascript:void(0)" title="Payments"><span>Payments</span></a>
                <ul class="dropdown">
                    <li>' . HTML::link_to_route('fee_payments','<span>Fees Payments</span>','',array('class'=>'wizard-form smronju','title'=>'Fees Payments'))  .'</li>
                    <li>' . HTML::link_to_route('pin_payments','<span>PIN Payments</span>','',array('class'=>'wizard-form smronju','title'=>'PIN Payments'))  .'</li>
                    <li>
                        <a class="wizard-form" href="javascript:void(0)" title="Schedule of Fees"><span>Schedule of Fees</span></a>
                        <ul class="dropdown">
                            <li>'. HTML::link('payments/fees_schedule/1','<span>First Term Schedule</span>',array('class'=>'wizard-form smronju','title'=>'First Term Schedule')) .'</li>
                            <li>'. HTML::link('payments/fees_schedule/2','<span>Second Term Schedule</span>',array('class'=>'wizard-form smronju','title'=>'Second Term Schedule')) .'</li>
                            <li>'. HTML::link('payments/fees_schedule/3','<span>Third Term Schedule</span>',array('class'=>'wizard-form smronju','title'=>'Third Term Schedule')) .'</li>
                        </ul>
                    </li>
                </ul>'
            .'</li>
            <li>
                <a class="editor" href="javascript:void(0)" title="Admissions"><span>Admissions</span></a>
                <ul class="dropdown">
                    <li>' . HTML::link_to_route('applicants_list','<span>Applicants List</span>','',array('class'=>'editor smronju','title'=>'Applicants List'))  .'</li>
                    <li>' . HTML::link_to_route('admissions_list','<span>Admissions List</span>','',array('class'=>'editor smronju','title'=>'Admissions List'))  .'</li>
                </ul>'
            .'</li>
            <li>'. HTML::link('#','<span>Classes</span>',array('class'=>'elements')) . '</li>
            <li>'. HTML::link('#','<span>Assignments</span>',array('class'=>'tables')) . '</li>
            <li>'. HTML::link('#','<span>Staff</span>',array('class'=>'media')) . '</li>
            <li>'. HTML::link('#','<span>Calendar/Reminders</span>',array('class'=>'calendar')) . '</li>
            <li>'. HTML::link('#','<span>Shop Inventory</span>',array('class'=>'barcode')) . '</li>
            <li>'. HTML::link('#','<span>Clubs</span>',array('class'=>'chat')) . '</li>
            <li>'. HTML::link('#','<span>Sports</span>',array('class'=>'charts')) . '</li>
            <li>
               <a class="users" href="javascript:void(0)" title="Users"><span>Users</span></a>
                <ul class="dropdown">
                    <li>' . HTML::link_to_route('users','<span>Admin</span>','',array('class'=>'users smronju','title'=>'Admin'))  .'</li>
                    <li>' . HTML::link_to_route('students','<span>Students</span>','',array('class'=>'users smronju','title'=>'Students List'))  .'</li>
                </ul>'
            .'</li>
            <li>
                <a class="grid" href="javascript:void(0)" title="Portal Settings"><span>Portal Settings</span></a>
                <ul class="dropdown">
                     <li>' . HTML::link_to_route('teachers','<span>Teachers</span>','',array('class'=>'grid smronju','title'=>'Teachers'))  .'</li>
                    <li>' . HTML::link_to_route('ais_subjects','<span>Subjects</span>','',array('class'=>'grid smronju','title'=>'Subjects'))  .'</li>
                    <li>' . HTML::link_to_route('ais_classes','<span>Classes</span>','',array('class'=>'grid smronju','title'=>'Classes'))  .'</li>
                </ul>'
            .'</li>
            <li>
                <a class="list" href="javascript:void(0)" title="Reports"><span>Reports</span></a>
                <ul class="dropdown">
                    <li>' . HTML::link_to_route('session_broadsheet','<span>Results Broadsheets</span>','',array('class'=>'list smronju','title'=>'Results Broadsheets'))  .'</li
                </ul>'
            .'</li>';
    }

    protected static function teacher_role(){
        return '
            <li>
                <a class="simple" href="javascript:void(0)" title="Results"><span>Results</span></a>
                <ul class="dropdown">
                    <li>' . HTML::link_to_route('assessments','<span>Assessments</span>','',array('class'=>'simple smronju','title'=>'Assessments'))  .'</li>
                </ul>'
            .'</li>
            <li>'. HTML::link('#','<span>Classes</span>',array('class'=>'elements')) . '</li>';
    }

    protected static function ecommerce_role(){
        return '
            <li>'. HTML::link('#','<span>Sales</span>',array('class'=>'chat')) . '</li>
            <li>'. HTML::link('#','<span>Shop Inventory</span>',array('class'=>'barcode')) . '</li>';
    }

    protected static function accountant_role(){
        return '
            <li>
                <a class="form" href="javascript:void(0)" title="Payments"><span>Payments</span></a>
                <ul class="dropdown">
                    <li>' . HTML::link_to_route('fee_payments','<span>Fees Payments</span>','',array('class'=>'form smronju','title'=>'Fees Payments'))  .'</li>
                    <li>' . HTML::link_to_route('pin_payments','<span>PIN Payments</span>','',array('class'=>'form smronju','title'=>'PIN Payments'))  .'</li>
                </ul>'
            .'</li>
            <li>'. HTML::link('#','<span>Staff</span>',array('class'=>'media')) . '</li>
            <li>'. HTML::link('#','<span>Reports</span>',array('class'=>'list')) . '</li>';
    }

    public static function entrance_exam_instructions(){
        $instruction = '
            <p>Thank you for applying to <strong>AR-Rahman International School</strong>, your Application is being processed. At this time, you can only print the completed form by clicking on the button below:</p>
            '.HTML::decode(HTML::link_to_route('print_application','<li class="icon-print"></li> Print Form','',array('class'=>'btn btn-warning', 'target'=>'_blank'))).'
            <hr>
            <h3>Examination Guidelines</h3>
            <ol>
                <li>
                    Applicants will be tested in the following subjects:
                    <ul>
                        <li>Mathematics</li>
                        <li>English Language</li>
                        <li>Social Studies</li>
                        <li>Arabic</li>
                        <li>Science</li>
                        <li>Qu&apos;ran</li>
                    </ul>
                </li>
                <li>Applicants are expected to come along with their <strong>pencil, ball pen and erasers</strong></li>
                <li>Examination commences at <strong>10:00 AM</strong> and ends <strong>1:00 PM</strong></li>
            </ol>';
        return $instruction;
    }

    public static function registration_instructions(){
        $instruction = '<p>Kindly take your time to read the registration instructions before filling the forms. As you progress through the forms, the menu links on the left will update to reflect new form entries';
        $instruction .= (Ais::registration_status() == 0) ? ' or you can click on the <strong>"next"</strong> button.</p>' :  '.</p>';
        $instruction .= (Ais::registration_status() == 0) ? '<p>'.HTML::decode(HTML::link_to_route('biodata','Next <i class="icon-arrow-right"></i>','',array('class'=>'btn btn-info'))).'</p>' :  '';
        return $instruction;
    }
}