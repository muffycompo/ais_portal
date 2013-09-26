<?php
/**
 * Utility Class for AIS Portal.
 * Author: Mfawa Alfred Onen
 * Date: 9/6/13
 * Version: v1.0
 * File: menu.php
 */

class Menu {

    public static function navigation_links($role_id, $nav_trail = ''){
        switch ($role_id) {
                case 1:
                    # Student
                    return static::student_role($nav_trail);
                    break;
                case 2:
                    # Teacher
                    return static::teacher_role($nav_trail);
                    break;
                case 3:
                    # Accountant
                    return static::accountant_role($nav_trail);
                    break;
                case 4:
                    # Ecommerce
                    return static::ecommerce_role($nav_trail);
                    break;
                case 5:
                    # Administrator
                    return static::admin_role($nav_trail);
                    break;
                default:
                    # Invalid
                    return '';
                    break;
            }
    }

    protected static function student_role($nav_trail){
        # Student
        $biodata_nav = ($nav_trail == 'biodata_nav')? 'class="current"' : '';
        $school_nav = ($nav_trail == 'school_nav')? 'class="current"' : '';
        $parental_info_nav = ($nav_trail == 'parental_info_nav')? 'class="current"' : '';
        $medical_record_nav = ($nav_trail == 'medical_record_nav')? 'class="current"' : '';
        $upload_nav = ($nav_trail == 'upload_nav')? 'class="current"' : '';
        $attestation_nav = ($nav_trail == 'attestation_nav')? 'class="current"' : '';
        $event_nav = ($nav_trail == 'event_nav')? 'class="current"' : '';

        $reg_status = Ais::registration_status();
        $display_menu = '';
        if($reg_status <= 6){
            $display_menu .= '<li '.$biodata_nav.'>'. HTML::link_to_route('biodata','<span>Bio-Data</span>','',array('class'=>'form')) . '</li>';
            if($reg_status >= 2){
                $display_menu .= '<li '.$school_nav.'>'. HTML::link_to_route('schools_attended','<span>Schools Attended</span>','',array('class'=>'tables')) . '</li>';
            }
            if($reg_status >= 3){
                $display_menu .= '<li '.$parental_info_nav.'>'. HTML::link_to_route('parent_info','<span>Parental Information</span>','',array('class'=>'chat')) . '</li>';
            }
            if($reg_status >= 4){
                $display_menu .= '<li '.$medical_record_nav.'>'. HTML::link_to_route('medical_record','<span>Medical Records</span>','',array('class'=>'charts')) . '</li>';
            }
            if($reg_status >= 5){
                $display_menu .= '<li '.$upload_nav.'>'. HTML::link_to_route('uploads','<span>Uploads</span>','',array('class'=>'wizard-form')) . '</li>';
            }
            if($reg_status == 6){
                $display_menu .= '<li '.$attestation_nav.'>'. HTML::link_to_route('attestation','<span>Attestation</span>','',array('class'=>'wizard-form')) . '</li>';
            }
            return HTML::decode($display_menu);
        } elseif($reg_status == 9) {
            $result_nav = ($nav_trail == 'result_nav')? 'class="current"' : '';
            $payment_nav = ($nav_trail == 'payment_nav')? 'class="current"' : '';
            $assignment_nav = ($nav_trail == 'assignment_nav')? 'class="current"' : '';
            $club_nav = ($nav_trail == 'club_nav')? 'class="current"' : '';
            $sport_nav = ($nav_trail == 'sport_nav')? 'class="current"' : '';
            $shop_nav = ($nav_trail == 'shop_nav')? 'class="current"' : '';
            return '
            <li '.$result_nav.'>
                <a class="simple" href="javascript:void(0)" title="Results"><span>Results</span></a>
                <ul class="dropdown">
                    <li>' . HTML::link('results/term_result/1','<span>First Term</span>',array('class'=>'simple smronju','title'=>'First Term'))  .'</li>
                    <li>' . HTML::link('results/term_result/2','<span>Second Term</span>',array('class'=>'simple smronju','title'=>'Second Term'))  .'</li>
                    <li>' . HTML::link('results/term_result/3','<span>Third Term</span>',array('class'=>'simple smronju','title'=>'Third Term'))  .'</li>
                </ul>'
            .'</li>
            <li '.$payment_nav.'>'. HTML::link_to_route('student_fee_payments','<span>Payments</span>','',array('class'=>'form')) . '</li>
            <li '.$event_nav.'>
            <a class="calendar" href="javascript:void(0)" title="Events"><span>Events</span></a>
                <ul class="dropdown">
                    <li>' . HTML::link_to_route('calendars','<span>Calendar</span>','',array('class'=>'calendar smronju','title'=>'Calendar'))  .'</li>
                </ul>'
            . '</li>
            <li '.$assignment_nav.'>' . HTML::link_to_route('assignments','<span>Assignments</span>','',array('class'=>'tables'))  .'</li>
            <li '.$club_nav.'>'. HTML::link('#','<span>Clubs</span>',array('class'=>'chat')) . '</li>
            <li '.$sport_nav.'>'. HTML::link('#','<span>Sports</span>',array('class'=>'charts')) . '</li>
            <li '.$shop_nav.'>'. HTML::link('#','<span>Shopping</span>',array('class'=>'wizard-form')) . '</li>';
        }
        return '';
    }

    protected static function admin_role($nav_trail){
        $payment_nav = ($nav_trail == 'payment_nav')? 'class="current"' : '';
        $admission_nav = ($nav_trail == 'admission_nav')? 'class="current"' : '';
        $class_nav = ($nav_trail == 'class_nav')? 'class="current"' : '';
        $assignment_nav = ($nav_trail == 'assignment_nav')? 'class="current"' : '';
        $staff_nav = ($nav_trail == 'staff_nav')? 'class="current"' : '';
        $event_nav = ($nav_trail == 'calendar_nav')? 'class="current"' : '';
        $shop_nav = ($nav_trail == 'shop_nav')? 'class="current"' : '';
        $club_nav = ($nav_trail == 'club_nav')? 'class="current"' : '';
        $sport_nav = ($nav_trail == 'sport_nav')? 'class="current"' : '';
        $user_nav = ($nav_trail == 'user_nav')? 'class="current"' : '';
        $setting_nav = ($nav_trail == 'setting_nav')? 'class="current"' : '';
        $report_nav = ($nav_trail == 'report_nav')? 'class="current"' : '';
        return '
            <li '.$payment_nav.'>
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
            <li '.$admission_nav.'>
                <a class="editor" href="javascript:void(0)" title="Admissions"><span>Admissions</span></a>
                <ul class="dropdown">
                    <li>' . HTML::link_to_route('applicants_list','<span>Applicants List</span>','',array('class'=>'editor smronju','title'=>'Applicants List'))  .'</li>
                    <li>' . HTML::link_to_route('admissions_list','<span>Admissions List</span>','',array('class'=>'editor smronju','title'=>'Admissions List'))  .'</li>
                </ul>'
            .'</li>
            <li '.$setting_nav.'>
            <a class="grid" href="javascript:void(0)" title="Portal Settings"><span>Portal Settings</span></a>
            <ul class="dropdown">
                <li>
                    <a class="grid" href="javascript:void(0)" title="Manage"><span>Manage</span></a>
                    <ul class="dropdown">
                        <li>' . HTML::link_to_route('manage_banks','<span>Banks</span>','',array('class'=>'calendar smronju','title'=>'Banks'))  .'</li>
                        <li>' . HTML::link_to_route('manage_app_type','<span>Application Types</span>','',array('class'=>'calendar smronju','title'=>'Application Types'))  .'</li>
                        <li>' . HTML::link_to_route('manage_aca_session','<span>Academic Sessions</span>','',array('class'=>'calendar smronju','title'=>'Academic Sessions'))  .'</li>
                        <li>' . HTML::link_to_route('manage_aca_term','<span>Academic Terms</span>','',array('class'=>'calendar smronju','title'=>'Academic Terms'))  .'</li>
                        <li>' . HTML::link_to_route('manage_app_pin','<span>Application PINs</span>','',array('class'=>'calendar smronju','title'=>'Application PINs'))  .'</li>
                        <li>' . HTML::link_to_route('manage_payment_categories','<span>Payment Categories</span>','',array('class'=>'calendar smronju','title'=>'Payment Categories'))  .'</li>
                    </ul>
                </li>
                 <li>' . HTML::link_to_route('teachers','<span>Teachers</span>','',array('class'=>'grid smronju','title'=>'Teachers'))  .'</li>
                <li>' . HTML::link_to_route('ais_subjects','<span>Subjects</span>','',array('class'=>'grid smronju','title'=>'Subjects'))  .'</li>
                <li>' . HTML::link_to_route('ais_classes','<span>Classes</span>','',array('class'=>'grid smronju','title'=>'Classes'))  .'</li>
                <li>' . HTML::link_to_route('questions','<span>Questions</span>','',array('class'=>'grid smronju','title'=>'Questions'))  .'</li>
            </ul>'
        .'</li>
            <!--<li '.$class_nav.'>'. HTML::link('#','<span>Classes</span>',array('class'=>'elements')) . '</li>
            <li '.$assignment_nav.'>'. HTML::link('#','<span>Assignments</span>',array('class'=>'tables')) . '</li>-->
            <li '.$staff_nav.'>
                <a class="calendar" href="javascript:void(0)" title="Staff"><span>Staff</span></a>
                <ul class="dropdown">
                    <li>' . HTML::link_to_route('payroll','<span>Payroll</span>','',array('class'=>'calendar smronju','title'=>'Payroll'))  .'</li>
                    <li>' . HTML::link_to_route('staff_attendance','<span>Attendance</span>','',array('class'=>'calendar smronju','title'=>'Attendance'))  .'</li>
                </ul>
                '
            . '</li>
            <li '.$event_nav.'>
            <a class="calendar" href="javascript:void(0)" title="Events"><span>Events</span></a>
                <ul class="dropdown">
                    <li>' . HTML::link_to_route('calendars','<span>Calendar</span>','',array('class'=>'calendar smronju','title'=>'Calendar'))  .'</li>
                    <!--<li>' . HTML::link_to_route('notifications','<span>Notification</span>','',array('class'=>'calendar smronju','title'=>'Reminder'))  .'</li>-->
                </ul>'
            . '</li>
            <li '.$shop_nav.'>'. HTML::link('#','<span>Shop Inventory</span>',array('class'=>'barcode')) . '</li>
            <li '.$club_nav.'>'. HTML::link('#','<span>Clubs</span>',array('class'=>'chat')) . '</li>
            <li '.$sport_nav.'>'. HTML::link('#','<span>Sports</span>',array('class'=>'charts')) . '</li>
            <li '.$user_nav.'>
               <a class="users" href="javascript:void(0)" title="Users"><span>Users</span></a>
                <ul class="dropdown">
                    <li>' . HTML::link_to_route('users','<span>Admin</span>','',array('class'=>'users smronju','title'=>'Admin'))  .'</li>
                    <li>' . HTML::link_to_route('students','<span>Students</span>','',array('class'=>'users smronju','title'=>'Students List'))  .'</li>
                </ul>'
            .'</li>
            <li '.$report_nav.'>
                <a class="list" href="javascript:void(0)" title="Reports"><span>Reports</span></a>
                <ul class="dropdown">
                    <li>' . HTML::link_to_route('session_broadsheet','<span>Results Broadsheets</span>','',array('class'=>'list smronju','title'=>'Results Broadsheets'))  .'</li
                </ul>'
            .'</li>';
    }

    protected static function teacher_role($nav_trail){
       $result_nav = ($nav_trail == 'result_nav')? 'class="current"' : '';
       $class_nav = ($nav_trail == 'class_nav')? 'class="current"' : '';
       $event_nav = ($nav_trail == 'event_nav')? 'class="current"' : '';
        return '
            <li '.$result_nav.'>
                <a class="simple" href="javascript:void(0)" title="Results"><span>Results</span></a>
                <ul class="dropdown">
                    <li>' . HTML::link_to_route('assessments','<span>Assessments</span>','',array('class'=>'simple smronju','title'=>'Assessments'))  .'</li>
                    <li>' . HTML::link_to_route('assignments','<span>Assignments</span>','',array('class'=>'simple smronju','title'=>'Assignments'))  .'</li>
                    <li>' . HTML::link_to_route('questions','<span>Questions</span>','',array('class'=>'simple smronju','title'=>'Questions'))  .'</li>
                </ul>'
            .'</li>
            <li '.$class_nav.'>'. HTML::link('#','<span>Classes</span>',array('class'=>'elements')) . '</li>
            <li '.$event_nav.'>
            <a class="calendar" href="javascript:void(0)" title="Events"><span>Events</span></a>
                <ul class="dropdown">
                    <li>' . HTML::link_to_route('calendars','<span>Calendar</span>','',array('class'=>'calendar smronju','title'=>'Calendar'))  .'</li>
                    <!--<li>' . HTML::link_to_route('notifications','<span>Notification</span>','',array('class'=>'calendar smronju','title'=>'Reminder'))  .'</li>-->
                </ul>'
            . '</li>';
    }

    protected static function ecommerce_role($nav_trail){
        $shop_nav = ($nav_trail == 'shop_nav')? 'class="current"' : '';
        $sale_nav = ($nav_trail == 'sale_nav')? 'class="current"' : '';
        return '
            <li '.$sale_nav.'>'. HTML::link('#','<span>Sales</span>',array('class'=>'chat')) . '</li>
            <li '.$shop_nav.'>'. HTML::link('#','<span>Shop Inventory</span>',array('class'=>'barcode')) . '</li>';
    }

    protected static function accountant_role($nav_trail){
        $payment_nav = ($nav_trail == 'payment_nav')? 'class="current"' : '';
        $staff_nav = ($nav_trail == 'staff_nav')? 'class="current"' : '';
        $report_nav = ($nav_trail == 'report_nav')? 'class="current"' : '';
        $event_nav = ($nav_trail == 'event_nav')? 'class="current"' : '';
        return '
            <li '.$payment_nav.'>
                <a class="form" href="javascript:void(0)" title="Payments"><span>Payments</span></a>
                <ul class="dropdown">
                    <li>' . HTML::link_to_route('fee_payments','<span>Fees Payments</span>','',array('class'=>'form smronju','title'=>'Fees Payments'))  .'</li>
                    <li>' . HTML::link_to_route('pin_payments','<span>PIN Payments</span>','',array('class'=>'form smronju','title'=>'PIN Payments'))  .'</li>
                </ul>'
            .'</li>
            <li '.$staff_nav.'>'. HTML::link('#','<span>Staff</span>',array('class'=>'media')) . '</li>
            <li '.$event_nav.'>
            <a class="calendar" href="javascript:void(0)" title="Events"><span>Events</span></a>
                <ul class="dropdown">
                    <li>' . HTML::link_to_route('calendars','<span>Calendar</span>','',array('class'=>'calendar smronju','title'=>'Calendar'))  .'</li>
                </ul>'
            . '</li>
            <li '.$report_nav.'>'. HTML::link('#','<span>Reports</span>',array('class'=>'list')) . '</li>';
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