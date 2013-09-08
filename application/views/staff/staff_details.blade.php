@layout('template.layout')

@section('content')

        @include('template.partials.top_header')
        <div class="row-fluid">

        <!--  Left Sidebar -->
        @include('template.partials.left_sidebar')

        <!-- Body start -->
            <div class="span10 body-container">

            <div class="row-fluid">
                <div class="span12">
                    <ul class="breadcrumb">
                        Navigator <span class="divider">/</span>
                        <li>
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Staff Details
                            <!--<span class="divider">/</span> -->
                        </li>
                    </ul>
                </div>
            </div>

                <div class="row-fluid">

                    <div class="span12">

                        <div class="row-fluid">

                            <div class="span9">
                                <div class="row-fluid">

                                    <div class="span12">
                                        <section class="utopia-widget">
                                            <div class="utopia-widget-title">
                                                {{ HTML::image('webassets/img/icons/paragraph_justify.png','',array('class'=>'utopia-widget-icon')) }}
                                                <span>Staff Details - {{ $details->name . ' [' . $details->staff_no . ']' }}</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <div class="row-fluid">
                                                    <div class="span12 utopia-form-freeSpace">
                                                         <div class="row-fluid">
                                                             <div class="span5 utopia-form-freeSpace">
                                                                 <p>Staff Number: <strong>{{ $details->staff_no }}</strong></p>
                                                                 <p>Full Name: <strong>{{ $details->name }}</strong></p>
                                                                 <p>Date of Birth: <strong>{{ Ais::reverse_db_datetime_to_date($details->date_of_birth) }}</strong></p>
                                                                 <p>Gender: <strong>{{ Expand::gender($details->gender_id) }}</strong></p>
                                                                 <p>State of Origin: <strong>{{ Expand::state($details->state_of_origin) }}</strong></p>
                                                                 <p>Nationality: <strong>{{ Expand::nationality($details->nationality_id) }}</strong></p>
                                                                 <p>Address: <strong>{{ $details->address }}</strong></p>
                                                                 <p>Email: <strong>{{ $details->email_address }}</strong></p>
                                                                 <p>Contact Phone: <strong>{{ $details->contact_phone }}</strong></p>
                                                                 <p>Department: <strong>{{ $details->department }}</strong></p>
                                                                 <p>Designation: <strong>{{ Expand::designation($details->designation_id) }}</strong></p>
                                                                 <p>Qualifications: <strong>{{ $details->qualification }}</strong></p>
                                                                 <p>Years of Experience: <strong>{{ $details->years_of_experience }} {{ ($details->years_of_experience > 1)? 'years' : 'year' }}</strong></p>
                                                                 <p>Employment Date: <strong>{{ Ais::reverse_db_datetime_to_date($details->employment_date) }}</strong></p>
                                                                 <p>Bank: <strong>{{ Expand::bank($details->bank_id) }}</strong></p>
                                                                 <p>Account Number: <strong>{{ $details->bank_account_number }}</strong></p>
                                                                 <p>{{ HTML::link_to_route('edit_staff','Edit Details',array($details->id),array('class'=>'btn btn-info')) }} {{ HTML::link_to_route('payroll','Cancel','',array('class'=>'btn btn-danger')) }}</p>
                                                             </div>
                                                             <div class="span7 utopia-form-freeSpace">
                                                                <p>
                                                                    {{ HTML::image('uploads/staff/' . $details->passport .'?' . time(),'Passport',array('class'=>'passport-image-border')) }}
                                                                </p>
                                                                {{ Form::open_for_files('staff/edit_staff_passport','POST',array('class'=>'form-horizontal')) }}
                                                                    <fieldset>
                                                                    <p>
                                                                        {{ Form::file('passport',array('id'=>'passport','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('passport','<span class="help-inline" style="color: #E25550;">:message</span>') }}
                                                                    </p>
                                                                    {{ Form::hidden('staff_id',$details->id) }}
                                                                    {{ Form::hidden('photo_name',$details->passport) }}
                                                                    <p>{{ Form::button('Update Passport', array('class'=>'btn btn-info span4')) }}</p>
                                                                    </fieldset>
                                                                {{ Form::close() }}
                                                             </div>
                                                         </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>

                                    </div>

                                </div>

                            </div><!-- Mid panel -->
                            <!--  Right Panel -->
                            @include('template.partials.right_panel')
                        </div>

                    </div>

                </div>

            </div>
        <!-- Body end -->

    </div>

    <!-- Maincontent end -->

<script type="text/javascript">
$(document).ready(function(){
 // Datetime Picker Related
    $('#date_of_birth').datetimepicker({
        format: 'yyyy-mm-dd',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1
    });

    $('#employment_date').datetimepicker({
        format: 'yyyy-mm-dd',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1,
        pickTime: false
    });
});
</script>
@endsection
