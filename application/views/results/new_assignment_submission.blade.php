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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Assignment Submission
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
                                                <span>Submit Assignment</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <div class="row-fluid">
                                                    <div class="span9 utopia-form-freeSpace">
                                                        {{ Form::open_for_files('results/new_assignment_submission','POST',array('class'=>'form-horizontal')) }}
                                                            <fieldset>

                                                                {{ $errors->has('assignment_file')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('assignment_file','Assignment File:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::file('assignment_file',array('id'=>'assignment_file','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('assignment_file','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('final_submission')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    <div class="controls">
                                                                        <label class="checkbox">
                                                                            <p>
                                                                                {{ Form::checkbox('final_submission',1) }}
                                                                                Final Submission
                                                                            </p>
                                                                        </label>
                                                                        {{ $errors->first('final_submission','<span class="help-inline">:message</span>') }}
                                                                        {{ Form::hidden('assignment_id', $assignment_id) }}
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

@endsection
