@layout('template.layout')

@section('content')

<div class="home">
	<h2>New User</h2>
	@include('template.partials.notification')
	{{ Form::open('users/new_user','POST') }}
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
			{{ Form::label('password','Password:') }}<br>
			{{ Form::password('password',array('id'=>'password')) }}
			{{ $errors->first('password') }}
		</p>
		<p>
			{{ Form::label('role_id','Role:') }}<br>
			{{ Ais::role_dropdown('role_id',Input::old('role_id'),array('id'=>'role_id')) }}
			{{ $errors->first('role_id') }}
		</p>
		<p>
			{{ Form::submit('Add User') }} | {{ HTML::link_to_route('users','Cancel') }}
		</p>
		{{ Form::close() }}
</div>
@endsection
