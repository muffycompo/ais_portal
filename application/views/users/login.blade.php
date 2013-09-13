<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>AR-RAHMAN Portal - v0.1</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Ah-Rahman International School Portal">
    <meta name="author" content="Mfawa Alfred Onen">

    <!-- styles -->
    {{ HTML::style('webassets/css/utopia-white.css') }}
    {{ HTML::style('webassets/css/utopia-responsive.css') }}
    {{ HTML::style('webassets/css/validationEngine.jquery.css') }}

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    {{ HTML::script('webassets/js/jquery.min.js') }}

</head>

<body>

<div class="container-fluid">

    <div class="row-fluid">
        <div class="span12">
            <div class="utopia-login-message">
                <h1>Welcome to Ah-Rahman International Test School Portal</h1>
                <p>Login below to gain access</p>
            </div>
        </div>
    </div>

    <div class="row-fluid">

        <div class="span12">

            <div class="row-fluid">

                <div class="span6">
                    <div class="utopia-login-info">
                    {{ HTML::image('webassets/img/login.png','Login Banner') }}
                    </div>
                </div>

                <div class="span6">
                    <div class="utopia-login">
                        <h1>Portal Login</h1>
                        @include('template.partials.notification')
                        {{ Form::open('users/login','POST',array('class'=>'utopia')) }}
                            {{ Form::label('email','Email:') }}
                            {{ $errors->has('email')? '<div class="control-group error">' : '<div class="control-group">' }}
                                {{ Form::input('text','email',Input::old('email'),array('id'=>'email','class'=>'span12 utopia-fluid-input validate[required]')) }}
                                {{ $errors->first('email','<p><span class="help-inline">:message</span></p>') }}
                            </div>

                            {{ Form::label('password','Password:') }}
                            {{ $errors->has('password')? '<div class="control-group error">' : '<div class="control-group">' }}
                                {{ Form::password('password',array('id'=>'password','class'=>'span12 utopia-fluid-input validate[required]')) }}
                                {{ $errors->first('password','<p><span class="help-inline">:message</span></p>') }}
                            </div>
                            <ul class="utopia-login-action">
                                <li>
                                    {{ Form::submit('Login',array('class'=>'btn span4')) }}
                                    or {{ HTML::link_to_route('user_signup','Signup') }}
                                    <div class="pull-right">{{ Form::checkbox('remember',1) }}&nbsp;Remember me!</div>
                                </li>
                            </ul>

                            <label>{{ HTML::link_to_route('forgot_password','Forgot Password?') }}</label>
                        {{ Form::close() }}
                    </div>
                </div>

            </div>

        </div>
    </div>
</div> <!-- end of container -->

<!-- javascript placed at the end of the document so the pages load faster -->
{{ HTML::script('webassets/js/utopia.js') }}
{{ HTML::script('webassets/js/jquery.validationEngine.js') }}
{{ HTML::script('webassets/js/jquery.validationEngine-en.js') }}
<script type="text/javascript">
    jQuery(function(){
        jQuery(".utopia").validationEngine('attach', {promptPosition : "topLeft", scroll: false});
    })
</script>
</body>
</html>
