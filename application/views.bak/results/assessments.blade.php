@layout('template.layout')

@section('content')

<div class="home">
	<h2>Assigned Subjects for {{Expand::academic_session(Ais::active_academic_session())}} Academic Session</h2>
	@include('template.partials.notification')

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
                    {{ HTML::link('results/assessment/' . $subject->subject_id .'/'. $subject->class_id . '/' . $subject->term_id,'Students List') }}
                </td>
            </tr>
          @endforeach
        @else
            <tr>
                <td colspan="3">No subject has been assigned to you!</td>
            </tr>
        @endif
        </tbody>
    </table>

    <p>{{ HTML::link_to_route('results','Back') }}</p>
</div>
@endsection