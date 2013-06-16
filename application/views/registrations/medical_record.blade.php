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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Medical Record
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
                                                <span>Medical Record</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <div class="row-fluid">
                                                    <div class="span9 utopia-form-freeSpace">
                                                        {{ Form::open('registrations/medical_record','POST',array('class'=>'form-horizontal')) }}
                                                            <fieldset>

                                                                {{ $errors->has('hospital_name')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ HTML::decode(Form::label('hospital_name','Hospital Name:',array('class'=>'control-label'))) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','hospital_name',(isset($medical->hospital_name) ? $medical->hospital_name : Input::old('hospital_name')),array('id'=>'hospital_name','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('hospital_name','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('hospital_address')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('hospital_address','Hospital Address:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::textarea('hospital_address',(isset($medical->hospital_address) ? $medical->hospital_address : Input::old('hospital_address')),array('id'=>'hospital_address','class'=>'span6 input-fluid','rows'=>'5')) }}
                                                                        {{ $errors->first('hospital_address','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('doctor_name')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ HTML::decode(Form::label('doctor_name','Doctor&apos;s Full Name:',array('class'=>'control-label'))) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','doctor_name',(isset($medical->doctor_name) ? $medical->doctor_name : Input::old('doctor_name')),array('id'=>'doctor_name','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('doctor_name','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('doctor_phone_no')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ HTML::decode(Form::label('doctor_phone_no','Doctor&apos;s Phone No.:',array('class'=>'control-label'))) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','doctor_phone_no',(isset($medical->doctor_phone_no) ? $medical->doctor_phone_no : Input::old('doctor_phone_no')),array('id'=>'doctor_phone_no','maxlength'=>'11','class'=>'span6 input-fluid ais_gsm')) }}
                                                                        {{ $errors->first('doctor_phone_no','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('child_file_no')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ HTML::decode(Form::label('child_file_no','Child File No.:',array('class'=>'control-label'))) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','child_file_no',(isset($medical->child_file_no) ? $medical->child_file_no : Input::old('child_file_no')),array('id'=>'child_file_no','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('child_file_no','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('blood_group')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ HTML::decode(Form::label('blood_group','Blood Group:',array('class'=>'control-label'))) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','blood_group',(isset($medical->blood_group) ? $medical->blood_group : Input::old('blood_group')),array('id'=>'blood_group','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('blood_group','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('genotype')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ HTML::decode(Form::label('genotype','Genotype',array('class'=>'control-label'))) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','genotype',(isset($medical->genotype) ? $medical->genotype : Input::old('genotype')),array('id'=>'genotype','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('genotype','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('allergic_reaction')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ HTML::decode(Form::label('allergic_reaction','Allergic Reaction?:',array('class'=>'control-label'))) }}
                                                                    <div class="controls">
                                                                        <label class="radio">
                                                                            <p>
                                                                                {{ Form::radio('allergic_reaction','No',((isset($medical->allergic_reaction) && $medical->allergic_reaction == 'No') ||  (Input::old('allergic_reaction') == 'No'))? true : false) }}
                                                                                No
                                                                            </p>
                                                                            <p>
                                                                                {{ Form::radio('allergic_reaction','Yes',((isset($medical->allergic_reaction) && $medical->allergic_reaction == 'Yes') ||  (Input::old('allergic_reaction') == 'Yes'))? true : false) }}
                                                                                Yes
                                                                            </p>
                                                                        </label>
                                                                        {{ $errors->first('allergic_reaction','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('allergic_details')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ HTML::decode(Form::label('allergic_details','Indicate any Allergic Reaction(s):',array('class'=>'control-label'))) }}
                                                                    <div class="controls">
                                                                        {{ Form::textarea('allergic_details',(isset($medical->allergic_details) ? $medical->allergic_details : Input::old('allergic_details')),array('id'=>'allergic_details','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('allergic_details','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('disability')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ HTML::decode(Form::label('disability','Does your child have any mental or physical disability?:',array('class'=>'control-label'))) }}
                                                                    <div class="controls">
                                                                        <label class="radio">
                                                                            <p>
                                                                                {{ Form::radio('disability','No',((isset($medical->disability) && $medical->disability == 'No') ||  (Input::old('disability') == 'No'))? true : false) }}
                                                                                No
                                                                            </p>
                                                                            <p>
                                                                                {{ Form::radio('disability','Yes',((isset($medical->disability) && $medical->disability == 'Yes') || (Input::old('disability') == 'Yes'))? true : false) }}
                                                                                Yes
                                                                            </p>
                                                                        </label>
                                                                        {{ $errors->first('disability','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('disability_details')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ HTML::decode(Form::label('disability_details','Indicate any disability:',array('class'=>'control-label'))) }}
                                                                    <div class="controls">
                                                                        {{ Form::textarea('disability_details',(isset($medical->disability_details) ? $medical->disability_details : Input::old('disability_details')),array('id'=>'disability_details','class'=>'span6 input-fluid','rows'=>'5')) }}
                                                                        {{ $errors->first('disability_details','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    <div class="controls inline">
                                                                    {{ Form::button('Save', array('class'=>'btn btn-info span3')) }}
                                                                    @if(Ais::registration_status() >= 5)
                                                                    {{ HTML::decode(HTML::link_to_route('uploads','Next <i class="icon-arrow-right"></i>','',array('class'=>'btn btn-success span3'))) }}
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
