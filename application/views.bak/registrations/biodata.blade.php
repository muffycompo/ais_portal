@layout('template.layout')

@section('content')

<div class="home">
	<h2>Bio-Data</h2>
	@include('template.partials.notification')
	{{ Form::open('registrations/biodata','POST') }}
        <p>
            {{ Form::label('surname','Surname:') }}<br>
            {{ Form::input('text','surname',(isset($user_meta->surname) ? $user_meta->surname : Session::get('surname')),array('id'=>'surname')) }}
            {{ $errors->first('surname') }}
        </p>
		<p>
			{{ Form::label('firstname','First Name:') }}<br>
			{{ Form::input('text','firstname',(isset($user_meta->firstname) ? $user_meta->firstname : Session::get('firstname')),array('id'=>'firstname')) }}
			{{ $errors->first('firstname') }}
		</p>
		<p>
			{{ Form::label('othernames','Other Names:') }}<br>
			{{ Form::input('text','othernames',(isset($user_meta->othernames) ? $user_meta->othernames : Input::old('othernames')),array('id'=>'othernames')) }}
			{{ $errors->first('othernames') }}
		</p>
		<p>
			{{ Form::label('date_of_birth','Date of Birth (dd/mm/YYYY):') }}<br>
			{{ Form::input('text','date_of_birth',(isset($biodata->date_of_birth) ? Ais::reverse_db_date($biodata->date_of_birth) : Input::old('date_of_birth')),array('id'=>'date_of_birth')) }}
			{{ $errors->first('date_of_birth') }}
		</p>
		<p>
			{{ Form::label('application_type_id','Application Type:') }}<br>
			{{ Ais::application_type_dropdown('application_type_id',(isset($biodata->application_type_id) ? $biodata->application_type_id : Input::old('application_type_id')),array('id'=>'application_type_id')) }}
			{{ $errors->first('application_type_id') }}
		</p>
		<p>
			{{ Form::label('gender_id','Sex:') }}<br>
			{{ Ais::gender_dropdown('gender_id',(isset($biodata->gender_id) ? $biodata->gender_id : Input::old('gender_id')),array('id'=>'gender_id')) }}
			{{ $errors->first('gender_id') }}
		</p>
		<p>
			{{ Form::label('state_id','State of origin:') }}<br>
			{{ Ais::state_dropdown('state_id',(isset($biodata->state_id) ? $biodata->state_id : Input::old('state_id')),array('id'=>'state_id')) }}
			{{ $errors->first('state_id') }}
		</p>
		<p>
			{{ Form::label('nationality_id','Nationality:') }}<br>
			{{ Ais::nationality_dropdown('nationality_id',(isset($biodata->nationality_id) ? $biodata->nationality_id : 118),array('id'=>'nationality_id')) }}
			{{ $errors->first('nationality_id') }}
		</p>
		<p>
			{{ Form::label('tribe','Tribe:') }}<br>
			{{ Form::input('text','tribe',(isset($biodata->tribe) ? $biodata->tribe : Input::old('tribe')),array('id'=>'tribe')) }}
			{{ $errors->first('tribe') }}
		</p>
		<p>
			{{ Form::label('last_class_id','Last Class:') }}<br>
			{{ Ais::class_dropdown('last_class_id',(isset($biodata->last_class_id) ? $biodata->last_class_id : Input::old('last_class_id')),array('id'=>'last_class_id')) }}
			{{ $errors->first('last_class_id') }}
		</p>
		<p>
			{{ Form::label('csai_id','Class Seeking Admission Into:') }}<br>
			{{ Ais::class_dropdown('csai_id',(isset($biodata->csai_id) ? $biodata->csai_id : Input::old('csai_id')),array('id'=>'csai_id')) }}
			{{ $errors->first('csai_id') }}
		</p>
		<p>
			{{ Form::submit('Save') }} | {{ HTML::link_to_route('user_dashboard','Cancel') }}
		</p>
		{{ Form::close() }}
</div>
@endsection
