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
                <td>{{ Ais::resolve_admission_no_from_userid($student['student_id']) }}</td>
                <td>{{ $student['firstname'] }}</td>
                <td>{{ $student['surname'] }}</td>
                <td>{{ $student['first_ca_score'] }}</td>
                <td>{{ $student['second_ca_score'] }}</td>
                <td>{{ $student['third_ca_score'] }}</td>
                <td>{{ $student['exam_score'] }}</td>
                <td>{{ $student['total'] }}</td>
                <td>
                    {{ HTML::link('results/new_assessment/' . $student['student_id'] .'/' . $subject_id. '/' .$class_id . '/' . $term_id,'Assessment Scores') }}
                    @if($student['total'] > 0)
                        @if($student['publish_status'])
                         | {{ HTML::link('results/unpublish_result/' . $student['student_id'] .'/' . $subject_id. '/' .$class_id . '/' . $term_id,'UnPublish Result') }}
                        @else
                        | {{ HTML::link('results/publish_result/' . $student['student_id'] .'/' . $subject_id. '/' .$class_id . '/' . $term_id,'Publish Result') }}
                        @endif
                    @endif
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
        <strong>F/CA</strong> => 1st CA (20%)<br>
        <strong>S/CA</strong> => 2nd CA (10%)<br>
        <strong>T/CA</strong> => 3rd CA (10%)<br>
    </p>
    <p>{{ HTML::link_to_route('assessments','Back') }}</p>
</div>
@endsection