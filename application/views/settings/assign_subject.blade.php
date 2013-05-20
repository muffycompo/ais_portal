@layout('template.layout')

@section('content')

<div class="home">
	<h2>Subject Assignment</h2>
	@include('template.partials.notification')
	{{ Form::open('settings/assign_subject','POST') }}
		<p><strong>{{ $teacher->firstname . ' ' . $teacher->surname }}</strong></p>
		<p>Assigned Subjects:
            <strong>{{ $subjects }}</strong>
		</p>
		<p>
			{{ Form::label('subject_id','Subject:') }}<br>
			{{ Ais::subject_dropdown('subject_id',Input::old('subject_id'),array('id'=>'subject_id')) }}
		</p>
		<p>
			{{ Form::label('class_id','Class:') }}<br>
			{{ Ais::class_dropdown('class_id',Input::old('class_id'),array('id'=>'class_id')) }}
			{{ Form::hidden('user_id',$teacher->id) }}
		</p>
		<p>
			{{ Form::submit('Assign Subject') }} | {{ HTML::link_to_route('teachers','Cancel') }}
		</p>
		{{ Form::close() }}
</div>
@endsection
