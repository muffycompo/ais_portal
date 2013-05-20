@layout('template.layout')

@section('content')

<div class="home">
	<h2>Students taking {{ Expand::subject($subject_id) }} in {{ Expand::classes($class_id) }}</h2>
	@include('template.partials.notification')

    <table class="ais_table">
        <thead>
            <tr>
                <th>Admission No</th>
                <th>First Name</th>
                <th>Surname</th>
                <th>F/CA</th>
                <th>S/CA</th>
                <th>T/CA</th>
                <th>Exam (60%)</th>
                <th>Total (100%)</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        @if(! is_null($students) && is_array($students) )
          @foreach($students as $student)
            <tr>
                <td>{{ Ais::resolve_admission_no_from_userid($student->id) }}</td>
                <td>{{ $student->firstname }}</td>
                <td>{{ $student->surname }}</td>
                <td>{{ Expand::ca_exam_score($student->id, $subject_id, $class_id, 1) }}</td>
                <td>{{ Expand::ca_exam_score($student->id, $subject_id, $class_id, 2) }}</td>
                <td>{{ Expand::ca_exam_score($student->id, $subject_id, $class_id, 3) }}</td>
                <td>{{ Expand::ca_exam_score($student->id, $subject_id, $class_id, 4) }}</td>
                <td>{{ Expand::ca_exam_total($student->id, $subject_id, $class_id) }}</td>
                <td>
                    {{ HTML::link('results/new_assessment/' . $student->id .'/' . $subject_id. '/' .$class_id,'Assessment Scores') }}
                </td>
            </tr>
          @endforeach
        @else
            <tr>
                <td colspan="6">No students found in this class!</td>
            </tr>
        @endif
        </tbody>
    </table>
    <p>
        <strong>KEYS:</strong><br>
        <strong>N/S</strong> => No Score<br>
        <strong>F/CA</strong> => 1st CA (20%)<br>
        <strong>S/CA</strong> => 2nd CA (10%)<br>
        <strong>T/CA</strong> => 3rd CA (10%)<br>
    </p>
    <p>{{ HTML::link_to_route('assessments','Back') }}</p>
</div>
@endsection