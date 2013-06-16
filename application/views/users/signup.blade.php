@layout('template.layout')

@section('content')

    @include('template.partials.top_header')

    <div class="row-fluid">
        <div class="span9">
            <section id="formElement" class="utopia-widget utopia-form-box section">
                <div class="utopia-widget-title">
                    {{ HTML::image('webassets/img/icons2/software24.png','',array('class'=>'utopia-widget-icon')) }}
                    <span>Signup</span>
                </div>

                <div class="row-fluid">
                    <div class="utopia-widget-content">
                        <div class="span9 utopia-form-freeSpace">
                            {{ Form::open('users/signup','POST',array('class'=>'form-horizontal')) }}
                                <fieldset>

                                    {{ $errors->has('surname')? '<div class="control-group error">' : '<div class="control-group">' }}
                                        {{ Form::label('surname','Surname:',array('class'=>'control-label')) }}
                                        <div class="controls">
                                            {{ Form::input('text','surname',Input::old('surname'),array('id'=>'surname','class'=>'span6 input-fluid')) }}
                                            {{ $errors->first('surname','<span class="help-inline">:message</span>') }}
                                        </div>
                                    </div>

                                    {{ $errors->has('firstname')? '<div class="control-group error">' : '<div class="control-group">' }}
                                        {{ Form::label('firstname','First Name:',array('class'=>'control-label')) }}
                                        <div class="controls">
                                            {{ Form::input('text','firstname',Input::old('firstname'),array('id'=>'firstname','class'=>'span6 input-fluid')) }}
                                            {{ $errors->first('firstname','<span class="help-inline">:message</span>') }}
                                        </div>
                                    </div>

                                    {{ $errors->has('email')? '<div class="control-group error">' : '<div class="control-group">' }}
                                        {{ Form::label('email','Email:',array('class'=>'control-label')) }}
                                        <div class="controls">
                                            {{ Form::input('text','email',Input::old('email'),array('id'=>'email','class'=>'span6 input-fluid')) }}
                                            {{ $errors->first('email','<span class="help-inline">:message</span>') }}
                                        </div>
                                    </div>

                                    {{ $errors->has('gsm_no')? '<div class="control-group error">' : '<div class="control-group">' }}
                                        {{ Form::label('gsm_no','Phone No. (GSM):',array('class'=>'control-label')) }}
                                        <div class="controls">
                                            {{ Form::input('text','gsm_no',Input::old('gsm_no'),array('id'=>'gsm_no','class'=>'span6 input-fluid ais_gsm','maxlength'=>'11')) }}
                                            {{ $errors->first('gsm_no','<span class="help-inline">:message</span>') }}
                                        </div>
                                    </div>

                                    {{ $errors->has('password')? '<div class="control-group error">' : '<div class="control-group">' }}
                                        {{ Form::label('password','Password:',array('class'=>'control-label')) }}
                                        <div class="controls">
                                            {{ Form::password('password',array('id'=>'password','class'=>'span6 input-fluid')) }}
                                            {{ $errors->first('password','<span class="help-inline">:message</span>') }}
                                        </div>
                                    </div>

                                    {{ $errors->has('password_confirmation')? '<div class="control-group error">' : '<div class="control-group">' }}
                                        {{ Form::label('password_confirmation','Confirm Password:',array('class'=>'control-label')) }}
                                        <div class="controls">
                                            {{ Form::password('password_confirmation',array('id'=>'password_confirmation','class'=>'span6 input-fluid')) }}
                                            {{ $errors->first('password_confirmation','<span class="help-inline">:message</span>') }}
                                        </div>
                                    </div>

                                    {{ $errors->has('pin_no')? '<div class="control-group error">' : '<div class="control-group">' }}
                                        {{ Form::label('pin_no','PIN No.:',array('class'=>'control-label')) }}
                                        <div class="controls">
                                            {{ Form::password('pin_no',array('id'=>'pin_no','class'=>'span6 input-fluid')) }}
                                            {{ $errors->first('pin_no','<span class="help-inline">:message</span>') }}
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <div class="controls inline">
                                        {{ Form::button('Signup', array('class'=>'btn btn-info span3')) }} {{ HTML::link_to_route('user_login','Cancel','',array('class'=>'btn btn-danger span3')) }}
                                        </div>
                                    </div>

                                </fieldset>
                            {{ Form::close() }}
                        </div>

                    </div>
                </div>
            </section>

       </div>
       <!--  Right Panel -->
        @include('template.partials.right_panel')
    </div>
    <!-- Maincontent end -->

@endsection
