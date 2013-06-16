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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> {{ HTML::link_to_route('fee_payments','Fees Payments') }}
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
                                                <span>Bio-Data</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <div class="row-fluid">
                                                    <div class="span9 utopia-form-freeSpace">
                                                        {{ Form::open('registrations/biodata','POST',array('class'=>'form-horizontal')) }}
                                                            <fieldset>

                                                                {{ $errors->has('surname')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('surname','Surname:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','surname',(isset($user_meta->surname) ? $user_meta->surname : Session::get('surname')),array('id'=>'surname','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('surname','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('firstname')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('firstname','First Name:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','firstname',(isset($user_meta->firstname) ? $user_meta->firstname : Session::get('firstname')),array('id'=>'firstname','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('firstname','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('othernames')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('othernames','Other Names:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','othernames',(isset($biodata->othernames) ? $biodata->othernames : Input::old('othernames')),array('id'=>'othernames','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('othernames','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('date_of_birth')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('date_of_birth','Date of Birth:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','date_of_birth',(isset($biodata->date_of_birth) ? Ais::reverse_db_date($biodata->date_of_birth) : Input::old('date_of_birth')),array('id'=>'date_of_birth','class'=>'span6 input-fluid ais_date')) }}
                                                                        @if($errors->has('date_of_birth'))
                                                                        {{ $errors->first('date_of_birth','<span class="help-inline">:message</span>') }}
                                                                        @else
                                                                        <span class="help-inline">Format: <strong>dd/mm/yyyy</strong></span>
                                                                        @endif
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ Form::label('application_type_id','Application Type:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::application_type_dropdown('application_type_id',(isset($biodata->application_type_id) ? $biodata->application_type_id : Input::old('application_type_id')),array('id'=>'application_type_id','class'=>'span6 input-fluid')) }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ Form::label('gender_id','Sex:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::gender_dropdown('gender_id',(isset($biodata->gender_id) ? $biodata->gender_id : Input::old('gender_id')),array('id'=>'gender_id','class'=>'span6 input-fluid')) }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ Form::label('state_id','State of Origin:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::state_dropdown('state_id',(isset($biodata->state_id) ? $biodata->state_id : Input::old('state_id')),array('id'=>'state_id','class'=>'span6 input-fluid')) }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ Form::label('nationality_id','Nationality:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::nationality_dropdown('nationality_id',(isset($biodata->nationality_id) ? $biodata->nationality_id : 118),array('id'=>'nationality_id','class'=>'span6 input-fluid')) }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('tribe')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('tribe','Tribe:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','tribe',(isset($biodata->tribe) ? $biodata->tribe : Input::old('tribe')),array('id'=>'tribe','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('tribe','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ Form::label('last_class_id','Last Class:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::class_dropdown('last_class_id',(isset($biodata->last_class_id) ? $biodata->last_class_id : Input::old('last_class_id')),array('id'=>'last_class_id','class'=>'span6 input-fluid')) }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ Form::label('csai_id','Class Applied for:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::class_dropdown('csai_id',(isset($biodata->csai_id) ? $biodata->csai_id : Input::old('csai_id')),array('id'=>'csai_id','class'=>'span6 input-fluid')) }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    <div class="controls inline">
                                                                    {{ Form::button('Save', array('class'=>'btn btn-info span3')) }}
                                                                    @if(Ais::registration_status() >= 2)
                                                                    {{ HTML::decode(HTML::link_to_route('schools_attended','Next <i class="icon-arrow-right"></i>','',array('class'=>'btn btn-success span3'))) }}
                                                                    @endif
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

@endsection