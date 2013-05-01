@layout('template.layout')

@section('content')

<div class="home">
	<h2>Login</h2>
	@include('template.partials.notification')
	{{ Form::open('users/login','POST') }}
		<p>
			{{ Form::label('email','Email:') }}<br>
			{{ Form::input('text','email',Input::old('email'),array('id'=>'email')) }}
			{{ $errors->first('email') }}
		</p>
		<p>
			{{ Form::label('password','Password:') }}<br>
			{{ Form::password('password',array('id'=>'password')) }}
            {{ $errors->first('password') }}
		</p>
		<p>
			{{ Form::checkbox('remember',1) }}&nbsp;Remember me.
		</p>
		<p>
            {{ Form::submit('Login') }}	| {{ HTML::link_to_route('user_signup','Signup') }}
        </p>
        <p>
            {{ HTML::link('#','Forgot Password?') }}
        </p>
		{{ Form::close() }}
</div>

@endsection

