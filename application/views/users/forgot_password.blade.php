@layout('template.layout')

@section('content')

    @include('template.partials.top_header')

    <div class="row-fluid">
        <div class="span9">
            <section id="formElement" class="utopia-widget utopia-form-box section">
                <div class="utopia-widget-title">
                    {{ HTML::image('webassets/img/icons2/software24.png','',array('class'=>'utopia-widget-icon')) }}
                    <span>Reset Password</span>
                </div>

                <div class="row-fluid">
                    <div class="utopia-widget-content">
                        <div class="span9 utopia-form-freeSpace">
                            {{ Form::open('users/forgot_password','POST',array('class'=>'form-horizontal')) }}
                                <fieldset>

                                    {{ $errors->has('email')? '<div class="control-group error">' : '<div class="control-group">' }}
                                        {{ Form::label('email','Email:',array('class'=>'control-label')) }}
                                        <div class="controls">
                                            {{ Form::input('text','email',Input::old('email'),array('id'=>'email','class'=>'span6 input-fluid')) }}
                                            {{ $errors->first('email','<span class="help-inline">:message</span>') }}
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <div class="controls inline">
                                        {{ Form::button('Reset Password', array('class'=>'btn span3')) }} {{ HTML::link_to_route('user_login','Cancel','',array('class'=>'btn btn-danger span2')) }}
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
