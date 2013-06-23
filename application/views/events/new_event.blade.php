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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> New User
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
                                                <span>New Event</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <div class="row-fluid">
                                                    <div class="span9 utopia-form-freeSpace">
                                                        {{ Form::open('events/new_event','POST',array('class'=>'form-horizontal')) }}
                                                            <fieldset>

                                                                {{ $errors->has('event_title')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('event_title','Event Title:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','event_title',Input::old('event_title'),array('id'=>'event_title','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('event_title','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('event_url')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('event_url','Event URL:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','event_url',Input::old('event_url'),array('id'=>'event_url','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('event_url','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('all_day')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('all_day','',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        <label class="checkbox">
                                                                         {{ Form::checkbox('all_day',1,'',array('id'=>'ais_allday')) }} All Day Event
                                                                        </label>
                                                                        {{ $errors->first('all_day','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('start_date')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('start_date','Start Date:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','start_date',Input::old('start_date'),array('id'=>'start_date','class'=>'span6 input-fluid ais_datetime')) }}
                                                                        {{ $errors->first('start_date','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('end_date')? '<div id="ais_allday_check" class="control-group error">' : '<div id="ais_allday_check" class="control-group">' }}
                                                                    {{ Form::label('end_date','End Date:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','end_date',Input::old('end_date'),array('id'=>'end_date','class'=>'span6 input-fluid ais_datetime')) }}
                                                                        {{ $errors->first('end_date','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ Form::label('event_for_group_id','Event Group:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::event_group_dropdown('event_for_group_id',Input::old('event_for_group_id'),array('id'=>'event_for_group_id','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('event_for_group_id','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div id="ais_student_class" class="control-group">
                                                                    {{ Form::label('student_class_id','Students Class:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::class_dropdown('student_class_id',Input::old('role_id'),array('id'=>'role_id','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('student_class_id','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    <div class="controls inline">
                                                                    {{ Form::button('Add', array('class'=>'btn btn-info span3')) }} {{ HTML::link_to_route('calendars', 'Cancel','',array('class'=>'btn btn-danger span3')) }}
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
    var allDay = $('#ais_allday');
    var allDayCheck = $('#ais_allday_check');
    var studentCheck = $("select#event_for_group_id");
    var studentClass = $("#ais_student_class");
    allDay.on('click',function(){
        if(allDay.is(':checked')){
            allDayCheck.hide();
        } else {
            allDayCheck.show();
        }
    });
    studentCheck.change(function(){
        if(studentCheck.val() == 1){
            studentClass.show();
        } else {
            studentClass.hide();
        }
    });

    // Datetime Picker Related
    $('#start_date').datetimepicker({
        format: 'yyyy-mm-dd hh:ii:ss',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1
    });
    $('#end_date').datetimepicker({
        format: 'yyyy-mm-dd hh:ii:ss',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1
    });

});
</script>
@endsection
