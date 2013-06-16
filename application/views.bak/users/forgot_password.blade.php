@layout('template.layout')

@section('content')

<div class="home">
	<h2>Reset Password</h2>
	@include('template.partials.notification')
	{{ Form::open('users/forgot_password','POST') }}
		<p>
			{{ Form::label('email','Email:') }}<br>
			{{ Form::input('text','email',Input::old('email'),array('id'=>'email')) }}
			{{ $errors->first('email') }}
		</p>
		<p>
            {{ Form::submit('Reset Password') }}	| {{ HTML::link_to_route('home','Back') }}
        </p>
		{{ Form::close() }}
</div>

@endsection

