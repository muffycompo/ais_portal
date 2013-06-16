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
                                                <span>Official Use Only - Processing Admission for {{ $user->firstname . ' ' . $user->surname }}</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <div class="row-fluid">
                                                    <div class="span9 utopia-form-freeSpace">
                                                        {{ Form::open('admin/official_use','POST',array('class'=>'form-horizontal')) }}
                                                            <fieldset>

                                                                <div class="control-group">
                                                                    <div class="controls">
                                                                        <h3>Examination Scores</h3>
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('mathematics')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('mathematics','Amount:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','mathematics',Input::old('mathematics'),array('id'=>'mathematics','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('mathematics','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('english')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('english','Amount:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','english',Input::old('english'),array('id'=>'english','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('english','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('science')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('science','Amount:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','science',Input::old('science'),array('id'=>'science','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('science','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('social_science')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('social_science','Amount:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','social_science',Input::old('social_science'),array('id'=>'social_science','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('social_science','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('quran')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('quran','Amount:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','quran',Input::old('quran'),array('id'=>'quran','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('quran','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('arabic')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('arabic','Amount:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','arabic',Input::old('arabic'),array('id'=>'arabic','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('arabic','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    <div class="controls">
                                                                        <h3>Admission Recommendation</h3>
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ Form::label('admission_recommendation_id','Class:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::admission_recommendation_dropdown('admission_recommendation_id',Input::old('admission_recommendation_id'),array('id'=>'admission_recommendation_id','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('admission_recommendation_id','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ Form::label('class_admitted_into','Term:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::class_dropdown('class_admitted_into',Input::old('class_admitted_into'),array('id'=>'class_admitted_into','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('class_admitted_into','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    <div class="controls inline">
                                                                    {{ Form::button('Process', array('class'=>'btn btn-info span3')) }} {{ HTML::link_to_route('applicants_list','Cancel','',array('class'=>'btn btn-danger span3')) }}
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

