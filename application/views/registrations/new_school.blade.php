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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> New School Attended
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
                                                <span>New School Attended</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <div class="row-fluid">
                                                    <div class="span9 utopia-form-freeSpace">
                                                        {{ Form::open('registrations/new_school','POST',array('class'=>'form-horizontal')) }}
                                                            <fieldset>

                                                                {{ $errors->has('school_name')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('school_name','School Name:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','school_name',Input::old('school_name'),array('id'=>'school_name','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('school_name','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ Form::label('class_from_id','Class (from):',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::class_dropdown('class_from_id',Input::old('class_from_id'),array('id'=>'class_from_id','class'=>'span6 input-fluid')) }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ Form::label('class_to_id','Class (to):',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::class_dropdown('class_to_id',Input::old('class_to_id'),array('id'=>'class_to_id','class'=>'span6 input-fluid')) }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('year_from_id')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('year_from_id','Year (from):',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','year_from_id',Input::old('year_from_id'),array('id'=>'year_from_id','class'=>'span6 input-fluid ais_date_four','maxlength'=>'4')) }}
                                                                        @if($errors->has('year_from_id'))
                                                                            {{ $errors->first('year_from_id','<span class="help-inline">:message</span>') }}
                                                                        @else
                                                                            <span class="help-inline">Format: <strong>yyyy</strong></span>
                                                                        @endif
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('year_to_id')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('year_to_id','Year (to):',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','year_to_id',Input::old('year_to_id'),array('id'=>'year_to_id','class'=>'span6 input-fluid ais_date_four','maxlength'=>'4')) }}
                                                                        @if($errors->has('year_to_id'))
                                                                            {{ $errors->first('year_to_id','<span class="help-inline">:message</span>') }}
                                                                        @else
                                                                            <span class="help-inline">Format: <strong>yyyy</strong></span>
                                                                        @endif
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    <div class="controls inline">
                                                                    {{ Form::button('Save', array('class'=>'btn btn-info span3')) }} {{ HTML::link_to_route('schools_attended','Cancel','',array('class'=>'btn btn-danger span3')) }}
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
