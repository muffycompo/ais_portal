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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> New Assignment/Note Upload
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
                                                <span>Upload New Assignment/Note</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <div class="row-fluid">
                                                    <div class="span9 utopia-form-freeSpace">
                                                        {{ Form::open_for_files('results/new_assignment','POST',array('class'=>'form-horizontal')) }}
                                                            <fieldset>

                                                                {{ $errors->has('title')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('title','Title:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','title',Input::old('title'),array('id'=>'title','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('title','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ Form::label('an_type','Type:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::assignment_note_dropdown('an_type',Input::old('an_type'),array('id'=>'an_type','class'=>'span6 input-fluid'), true) }}
                                                                        {{ $errors->first('an_type','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('submission_deadline')? '<div id="ais_submission_check" class="control-group error">' : '<div id="ais_submission_check" class="control-group">' }}
                                                                    {{ Form::label('submission_deadline','Submission Date:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','submission_deadline',Input::old('submission_deadline'),array('id'=>'submission_deadline','class'=>'span6 input-fluid ais_datetime')) }}
                                                                        {{ $errors->first('submission_deadline','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ Form::label('subject_id','Subject:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::subject_dropdown('subject_id',Input::old('subject_id'),array('id'=>'subject_id','class'=>'span6 input-fluid'), true) }}
                                                                        {{ $errors->first('subject_id','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ Form::label('class_id','Class:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::class_dropdown('class_id',Input::old('class_id'),array('id'=>'class_id','class'=>'span6 input-fluid'), true) }}
                                                                        {{ $errors->first('class_id','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('an_file')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('an_file','Assignment/Note File:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::file('an_file',array('id'=>'an_file','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('an_file','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    <div class="controls inline">
                                                                    {{ Form::button('Upload', array('class'=>'btn btn-info span3')) }} {{ HTML::link_to_route('assignments','Cancel','',array('class'=>'btn btn-danger span3')) }}
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
    var submissionDate = $('#ais_submission_check');
    var assignmentCheck = $("select#an_type");

   if(assignmentCheck.val() == 2){
    submissionDate.show();
   } else{
    submissionDate.hide();
   }

    assignmentCheck.change(function(){
        if(assignmentCheck.val() == 2){
            submissionDate.show();
        } else {
            submissionDate.hide();
        }
    });

    // Datetime Picker Related
    $('#submission_deadline').datetimepicker({
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
