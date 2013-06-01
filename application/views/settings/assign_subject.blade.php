@layout('template.layout')

@section('content')

<div class="home">
	<h2>Subject Assignment</h2>
	@include('template.partials.notification')
	{{ Form::open('settings/assign_subject','POST') }}
		<p><strong>{{ $teacher->firstname . ' ' . $teacher->surname }}</strong></p>
		<p>
			{{ Form::label('subject_id','Subject:') }}<br>
			{{ Ais::subject_dropdown('subject_id',Input::old('subject_id'),array('id'=>'subject_id')) }}
		</p>
		<p>
			{{ Form::label('class_id','Class:') }}<br>
			{{ Ais::class_dropdown('class_id',Input::old('class_id'),array('id'=>'class_id')) }}
		</p>
		<p>
			{{ Form::label('term_id','Term:') }}<br>
			{{ Ais::term_dropdown('term_id',Input::old('term_id'),array('id'=>'term_id')) }}
			{{ Form::hidden('user_id',$teacher->id) }}
		</p>
		<p>
			{{ Form::submit('Assign Subject') }} | {{ HTML::link_to_route('teachers','Cancel') }}
		</p>
		{{ Form::close() }}
		<table class="ais_table">
                <thead>
                    <tr>
                        <th>Subject</th>
                        <th>Class</th>
                        <th>Term</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                @if(! is_null($subjects) && is_array($subjects) )
                  @foreach($subjects as $subject)
                    <tr>
                        <td>{{ Expand::subject($subject->subject_id) }}</td>
                        <td>{{ Expand::classes($subject->class_id) }}</td>
                        <td>{{ Expand::term($subject->term_id) }}</td>
                        <td>
                            {{ HTML::link('settings/unassign_subject/' . $subject->user_id .'/' . $subject->subject_id. '/' .$subject->class_id . '/' . $subject->term_id,'Unassign Subject') }}
                        </td>
                    </tr>
                  @endforeach
                @else
                    <tr>
                        <td colspan="4">No subject assigned to this teacher!</td>
                    </tr>
                @endif
                </tbody>
            </table>
</div>
@endsection
