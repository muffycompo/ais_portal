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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> New Question Upload
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
                                                <span>Upload New Question</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <div class="row-fluid">
                                                    <div class="span9 utopia-form-freeSpace">
                                                        {{ Form::open_for_files('results/new_question','POST',array('class'=>'form-horizontal')) }}
                                                            <fieldset>

                                                                {{ $errors->has('question_title')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('question_title','Title:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','question_title',Input::old('question_title'),array('id'=>'question_title','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('question_title','<span class="help-inline">:message</span>') }}
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

                                                                {{ $errors->has('question_file')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('question_file','Question File:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::file('question_file',array('id'=>'question_file','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('question_file','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    <div class="controls inline">
                                                                    {{ Form::button('Upload', array('class'=>'btn btn-info span3')) }} {{ HTML::link_to_route('questions','Cancel','',array('class'=>'btn btn-danger span3')) }}
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
