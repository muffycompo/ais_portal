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
                                                <span>Assessment for {{ $user->firstname . ' ' . $user->surname }}</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <div class="row-fluid">
                                                    <div class="span9 utopia-form-freeSpace">
                                                        {{ Form::open('results/new_assessment','POST',array('class'=>'form-horizontal')) }}
                                                            <fieldset>

                                                                <div class="control-group">
                                                                    {{ Form::label('assessment_type_id','Assessment Type:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::assessment_type_dropdown('assessment_type_id',Input::old('assessment_type_id'),array('id'=>'assessment_type_id','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('assessment_type_id','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('score')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('score','Score:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','score',Input::old('score'),array('id'=>'score','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('score','<span class="help-inline">:message</span>') }}
                                                                        {{ Form::hidden('subject_id',$subject_id) }}
                                                                        {{ Form::hidden('class_id',$class_id) }}
                                                                        {{ Form::hidden('user_id',$user->id) }}
                                                                        {{ Form::hidden('term_id',$term_id) }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    <div class="controls inline">
                                                                    {{ Form::button('Save', array('class'=>'btn btn-info span3')) }} {{ HTML::link('results/assessment/' . $subject_id . '/' . $class_id . '/' . $term_id,'Back',array('class'=>'btn btn-warning span3')) }}
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
