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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Attendance
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
                                                <span>Attendance for {{ $user->firstname . ' ' . $user->surname }} in {{ Expand::classes($class_id) }}</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <div class="row-fluid">
                                                    <div class="span9 utopia-form-freeSpace">
                                                        {{ Form::open('results/attendance','POST',array('class'=>'form-horizontal')) }}
                                                            <fieldset>

                                                                <div class="control-group">
                                                                    {{ Form::label('attendance_type_id','Attendance:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::attendance_type_dropdown('attendance_type_id',Input::old('attendance_type_id'),array('id'=>'attendance_type_id','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('attendance_type_id','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('attendance_reason')? '<div class="control-group error" id="attendance_reason_check">' : '<div class="control-group" id="attendance_reason_check">' }}
                                                                    {{ Form::label('attendance_reason','Reason:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::textarea('attendance_reason',Input::old('attendance_reason'),array('id'=>'attendance_reason','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('score','<span class="help-inline">:message</span>') }}
                                                                        {{ Form::hidden('subject_id',$subject_id) }}
                                                                        {{ Form::hidden('class_id',$class_id) }}
                                                                        {{ Form::hidden('user_id',$user_id) }}
                                                                        {{ Form::hidden('term_id',$term_id) }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    <div class="controls inline">
                                                                    {{ Form::button('Save', array('class'=>'btn btn-info span3')) }} {{ HTML::link_to_route('assessment','Cancel',array($subject_id, $class_id, $term_id), array('class'=>'btn btn-danger span3')) }}
                                                                    </div>
                                                                </div>

                                                            </fieldset>
                                                        {{ Form::close() }}
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
    var attendanceReason = $('#attendance_reason_check');
    var attendanceCheck = $("select#attendance_type_id");

   if(attendanceCheck.val() == 3){
    attendanceReason.show();
   } else{
    attendanceReason.hide();
   }

    attendanceCheck.change(function(){
        if(attendanceCheck.val() == 3){
            attendanceReason.show();
        } else {
            attendanceReason.hide();
        }
    });

});
</script>

@endsection
