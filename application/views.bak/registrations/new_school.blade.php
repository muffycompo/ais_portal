@layout('template.layout')

@section('content')

<div class="home">
	<h2>New School Attended</h2>
	@include('template.partials.notification')
	{{ Form::open('registrations/new_school','POST') }}
		<p>
			{{ Form::label('school_name','Name of School:') }}<br>
			{{ Form::input('text','school_name',Input::old('school_name'),array('id'=>'school_name')) }}
			{{ $errors->first('school_name') }}
		</p>
		<p>
			{{ Form::label('class_from_id','Class (From):') }}<br>
			{{ Ais::class_dropdown('class_from_id',Input::old('class_from_id'),array('id'=>'class_from_id')) }}
			{{ $errors->first('class_from_id') }}
		</p>
		<p>
			{{ Form::label('class_to_id','Class (To):') }}<br>
			{{ Ais::class_dropdown('class_to_id',Input::old('class_to_id'),array('id'=>'class_to_id')) }}
			{{ $errors->first('class_to_id') }}
		</p>
		<p>
			{{ Form::label('year_from_id','Year (From):') }}<br>
			{{ Form::input('text','year_from_id',Input::old('year_from_id'),array('id'=>'year_from_id','maxlength'=>'4')) }}
			{{ $errors->first('year_from_id') }}
		</p>
		<p>
			{{ Form::label('year_to_id','Year (To):') }}<br>
			{{ Form::input('text','year_to_id',Input::old('year_to_id'),array('id'=>'year_to_id','maxlength'=>'4')) }}
			{{ $errors->first('year_to_id') }}
		</p>
		<p>
			{{ Form::submit('Add School') }} | {{ HTML::link_to_route('schools_attended','Back') }}
		</p>
		{{ Form::close() }}
</div>
@endsection
