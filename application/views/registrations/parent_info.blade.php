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
                                                <span>Parental Information</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <div class="row-fluid">
                                                    <div class="span9 utopia-form-freeSpace">
                                                        {{ Form::open('registrations/parent_info','POST',array('class'=>'form-horizontal')) }}
                                                            <fieldset>

                                                                {{ $errors->has('father_name')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ HTML::decode(Form::label('father_name','Father&apos;s Full Name:',array('class'=>'control-label'))) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','father_name',(isset($parent->father_name) ? $parent->father_name : Input::old('father_name')),array('id'=>'father_name','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('father_name','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('father_occupation')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ HTML::decode(Form::label('father_occupation','Father&apos;s Occupation:',array('class'=>'control-label'))) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','father_occupation',(isset($parent->father_occupation) ? $parent->father_occupation : Input::old('father_occupation')),array('id'=>'father_occupation','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('father_occupation','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ HTML::decode(Form::label('father_religion','Father&apos;s Religion:',array('class'=>'control-label'))) }}
                                                                    <div class="controls">
                                                                        {{ Ais::religion_dropdown('father_religion', (isset($parent->father_religion) ? $parent->father_religion : Input::old('father_religion')),array('id'=>'father_religion','class'=>'span6 input-fluid')) }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('residential_address')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('residential_address','Residential Address:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::textarea('residential_address',(isset($parent->residential_address) ? $parent->residential_address : Input::old('residential_address')),array('id'=>'residential_address','class'=>'span6 input-fluid','rows'=>'5')) }}
                                                                        {{ $errors->first('residential_address','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('father_phone_no')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ HTML::decode(Form::label('father_phone_no','Father&apos;s Phone No.:',array('class'=>'control-label'))) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','father_phone_no',(isset($parent->father_phone_no) ? $parent->father_phone_no : Input::old('father_phone_no')),array('id'=>'father_phone_no','maxlength'=>'11','class'=>'span6 input-fluid ais_gsm')) }}
                                                                        {{ $errors->first('father_phone_no','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('mother_name')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ HTML::decode(Form::label('mother_name','Mother&apos;s Full Name',array('class'=>'control-label'))) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','mother_name',(isset($parent->mother_name) ? $parent->mother_name : Input::old('mother_name')),array('id'=>'mother_name','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('mother_name','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('mother_occupation')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ HTML::decode(Form::label('mother_occupation','Mother&apos;s Occupation:',array('class'=>'control-label'))) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','mother_occupation',(isset($parent->mother_occupation) ? $parent->mother_occupation : Input::old('mother_occupation')),array('id'=>'mother_occupation','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('mother_occupation','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ HTML::decode(Form::label('mother_religion','Mother&apos;s Religion:',array('class'=>'control-label'))) }}
                                                                    <div class="controls">
                                                                        {{ Ais::religion_dropdown('mother_religion', (isset($parent->father_religion) ? $parent->father_religion : Input::old('mother_religion')),array('id'=>'mother_religion','class'=>'span6 input-fluid')) }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('mother_phone_no')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ HTML::decode(Form::label('mother_phone_no','Mother&apos;s Phone No.:',array('class'=>'control-label'))) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','mother_phone_no',(isset($parent->mother_phone_no) ? $parent->mother_phone_no : Input::old('mother_phone_no')),array('id'=>'mother_phone_no','maxlength'=>'11','class'=>'span6 input-fluid ais_gsm')) }}
                                                                        {{ $errors->first('mother_phone_no','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    <div class="controls inline">
                                                                    {{ Form::button('Save', array('class'=>'btn btn-info span3')) }}
                                                                    @if(Ais::registration_status() >= 4)
                                                                    {{ HTML::decode(HTML::link_to_route('medical_record','Next <i class="icon-arrow-right"></i>','',array('class'=>'btn btn-success span3'))) }}
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
