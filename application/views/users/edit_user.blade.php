@layout('template.layout')

@section('content')

<div class="home">
	<h2>Edit User - {{ $user->firstname . ' ' . $user->surname }}</h2>
	@include('template.partials.notification')
	{{ Form::open('users/edit_user','POST') }}
		<p>
			{{ Form::label('firstname','First Name:') }}<br>
			{{ Form::input('text','firstname',$user->firstname,array('id'=>'firstname')) }}
			{{ $errors->first('firstname') }}
		</p>
		<p>
			{{ Form::label('surname','Surname:') }}<br>
			{{ Form::input('text','surname',$user->surname,array('id'=>'surname')) }}
			{{ $errors->first('surname') }}
		</p>
		<p>
			{{ Form::label('password','Password:') }}<br>
			{{ Form::password('password',array('id'=>'password')) }}
			{{ $errors->first('password') }}
		</p>
		<p>
			{{ Form::label('role_id','Role:') }}<br>
			{{ Ais::role_dropdown('role_id',$user->role_id,array('id'=>'role_id')) }}
			{{ $errors->first('role_id') }}
		</p>
		<p>
		    {{ Form::hidden('user_id',$user->id) }}
			{{ Form::submit('Update User') }} | {{ HTML::link_to_route('users','Cancel') }}
		</p>
		{{ Form::close() }}
</div>
@endsection
