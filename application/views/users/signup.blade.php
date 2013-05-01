@layout('template.layout')

@section('content')
		
<div class="home">
	<h2>Sign Up</h2>
	@include('template.partials.notification')
	{{ Form::open() }}
		<p>
			{{ Form::label('firstname','First Name:') }}<br>
			{{ Form::input('text','firstname',Input::old('firstname'),array('id'=>'firstname')) }}
			{{ $errors->first('firstname') }}
		</p>
		<p>
			{{ Form::label('surname','Surname:') }}<br>
			{{ Form::input('text','surname',Input::old('surname'),array('id'=>'surname')) }}
			{{ $errors->first('surname') }}
		</p>
		<p>
			{{ Form::label('email','Email:') }}<br>
			{{ Form::input('text','email',Input::old('email'),array('id'=>'email')) }}
			{{ $errors->first('email') }}
		</p>
		<p>
			{{ Form::label('gsm_no','Phone No. (GSM):') }}<br>
			{{ Form::input('text','gsm_no',Input::old('gsm_no'),array('id'=>'gsm_no','maxlength'=>'11')) }}
			{{ $errors->first('gsm_no') }}
		</p>
		<p>
			{{ Form::label('password','Password:') }}<br>
			{{ Form::password('password',array('id'=>'password')) }}
			{{ $errors->first('password') }}
		</p>
		<p>
			{{ Form::label('password_confirmation','Confirm Password:') }}<br>
			{{ Form::password('password_confirmation',array('id'=>'password_confirmation')) }}
			{{ $errors->first('password_confirmation') }}
		</p>
		<p>
			{{ Form::label('pin_no','PIN No.:') }}<br>
			{{ Form::input('text','pin_no',Input::old('pin_no'),array('id'=>'pin_no')) }}
			{{ $errors->first('pin_no') }}
		</p>
		<p>	
			{{ Form::submit('Signup') }} | {{ HTML::link_to_route('user_login','Cancel') }}
		</p>
		{{ Form::close() }}
</div>
@endsection
