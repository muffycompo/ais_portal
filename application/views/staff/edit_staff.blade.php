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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Edit Staff
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
                                                <span>Edit Staff - {{ $staff->name . ' [' .$staff->staff_no. ']' }}</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <div class="row-fluid">
                                                    <div class="span9 utopia-form-freeSpace">
                                                        {{ Form::open('staff/edit_staff','POST',array('class'=>'form-horizontal')) }}
                                                            <fieldset>

                                                                {{ $errors->has('name')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('name','Name:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','name',(Input::old('name') != '')? Input::old('name') : $staff->name,array('id'=>'name','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('name','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('date_of_birth')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('date_of_birth','Date of Birth:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','date_of_birth',(Input::old('date_of_birth') != '')? Input::old('date_of_birth') : $staff->date_of_birth,array('id'=>'date_of_birth','class'=>'span6 input-fluid ais_dateonly')) }}
                                                                        {{ $errors->first('date_of_birth','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>


                                                                <div class="control-group">
                                                                    {{ Form::label('gender_id','Gender:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::gender_dropdown('gender_id',(Input::old('gender_id') != '')? Input::old('gender_id') : $staff->gender_id,array('id'=>'role_id','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('gender_id','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ Form::label('state_of_origin','State of Origin:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::state_dropdown('state_of_origin',(Input::old('state_of_origin') != '')? Input::old('state_of_origin') : $staff->state_of_origin,array('id'=>'state_of_origin','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('state_of_origin','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ Form::label('nationality_id','Nationality:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::nationality_dropdown('nationality_id',(Input::old('nationality_id') != '')? Input::old('nationality_id') : $staff->nationality_id,array('id'=>'nationality_id','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('nationality_id','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('address')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('address','Contact Address:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::textarea('address',(Input::old('address') != '')? Input::old('address') : $staff->address,array('id'=>'address','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('address','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('email')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('email','Email:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','email',(Input::old('email') != '')? Input::old('email') : $staff->email_address,array('id'=>'email','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('email','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('contact_phone')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('contact_phone','Contact Phone:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','contact_phone',(Input::old('contact_phone') != '')? Input::old('contact_phone') : $staff->contact_phone,array('id'=>'contact_phone','class'=>'span6 input-fluid ais_gsm')) }}
                                                                        {{ $errors->first('contact_phone','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('department')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('department','Department:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','department',(Input::old('department') != '')? Input::old('department') : $staff->department,array('id'=>'department','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('department','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ Form::label('designation_id','Designation:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::designations_dropdown('designation_id',(Input::old('designation_id') != '')? Input::old('designation_id') : $staff->designation_id,array('id'=>'designation_id','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('designation_id','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('qualification')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('qualification','Qualification:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','qualification',(Input::old('qualification') != '')? Input::old('qualification') : $staff->qualification,array('id'=>'qualification','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('qualification','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('years_of_experience')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('years_of_experience','Years of Experience:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','years_of_experience',(Input::old('years_of_experience') != '')? Input::old('years_of_experience') : $staff->years_of_experience,array('id'=>'years_of_experience','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('years_of_experience','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('employment_date')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('employment_date','Employment Date:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','employment_date',(Input::old('employment_date') != '')? Input::old('employment_date') : $staff->employment_date,array('id'=>'employment_date','class'=>'span6 input-fluid ais_dateonly')) }}
                                                                        {{ $errors->first('employment_date','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>
                                                                {{ Form::hidden('staff_id', $staff->id) }}
                                                                <div class="control-group">
                                                                    <div class="controls inline">
                                                                    {{ Form::button('Update', array('class'=>'btn btn-info span3')) }} {{ HTML::link_to_route('staff_details', 'Cancel',array($staff->id),array('class'=>'btn btn-danger span3')) }}
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
 // Datetime Picker Related
    $('#date_of_birth').datepicker({
        format: 'yyyy-mm-dd',
        weekStart: 1,
        todayBtn:  0,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
    });

    $('#employment_date').datepicker({
      format: 'yyyy-mm-dd',
      weekStart: 1,
      todayBtn:  0,
      autoclose: 1,
      todayHighlight: 1,
      startView: 2,
      forceParse: 0,
    });
});
</script>
@endsection
