@layout('template.layout')

@section('content')

<div class="home">
	<h2>Class Assignment - Form Teacher</h2>
	@include('template.partials.notification')
	{{ Form::open('settings/assign_class','POST') }}
		<p><strong>{{ $teacher->firstname . ' ' . $teacher->surname }}</strong></p>
		<p>Assigned Class:
            <strong>{{ $classes }}</strong>
		</p>
		<p>
			{{ Form::label('class_id','Class:') }}<br>
			{{ Ais::class_dropdown('class_id',Input::old('class_id'),array('id'=>'class_id')) }}
			{{ Form::hidden('user_id',$teacher->id) }}
		</p>
		<p>
			{{ Form::submit('Assign Class') }} | {{ HTML::link_to_route('teachers','Cancel') }}
		</p>
		{{ Form::close() }}
</div>
@endsection
