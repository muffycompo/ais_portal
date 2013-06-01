@layout('template.layout')

@section('content')

<div class="home">
	<h2>Report Sheet for {{Expand::term($term_id)}} of {{Expand::classes($class_id)}}, {{Expand::academic_session(Ais::active_academic_session())}} Academic Session</h2>
	@include('template.partials.notification')

    <p>Admission No: <strong>{{ Ais::resolve_admission_no_from_userid($biodata->id)}}</strong> &nbsp;&nbsp;&nbsp;&nbsp;Sex: <strong>{{Expand::gender($biodata->gender_id)}}</strong> &nbsp;&nbsp;&nbsp;&nbsp;Date: <strong>{{ date('d/m/Y') }}</strong></p>
    <p>Name: <strong>{{$biodata->firstname . ' ' . $biodata->surname}}</strong> &nbsp;&nbsp;&nbsp;&nbsp;Age: <strong>{{$biodata->age}}</strong> &nbsp;&nbsp;&nbsp;&nbsp;House: <strong></strong></p>
    <p>Class: <strong>{{ Expand::classes($biodata->current_class_id) }}</strong> &nbsp;&nbsp;&nbsp;&nbsp;No. in Class: <strong></strong> &nbsp;&nbsp;&nbsp;&nbsp;Attendance: <strong></strong></p>
    <p>Final Average: <strong></strong> &nbsp;&nbsp;&nbsp;&nbsp;Final Position: <strong></strong> &nbsp;&nbsp;&nbsp;&nbsp;Final Grade: <strong></strong></p>
    <p>Highest Class Ave.: <strong></strong> &nbsp;&nbsp;&nbsp;&nbsp;Lowest Class Ave.: <strong></strong> &nbsp;&nbsp;&nbsp;&nbsp;Final Grade: <strong></strong></p>
    <hr>
    <h4>COGNITIVE SKILL (ACADEMIC)</h4>
    <hr>
    <table class="ais_table">
        <thead>
            <tr>
                <th>Subjects</th>
                <th>1st CA<br><small>(20 %)</small></th>
                <th>2nd CA<br><small>(10 %)</small></th>
                <th>3rd CA<br><small>(10 %)</small></th>
                <th>Exam<br><small>(60 %)</small></th>
                <th>Total<br><small>(100 %)</small></th>
                <th>Grade</th>
                <th>Pos.</th>
                <th>Out of</th>
                <th>Class Ave.</th>
                <th>Comments</th>
            </tr>
        </thead>
        <tbody>
        @if(! is_null($subject_results) && is_array($subject_results) )
          @foreach($subject_results as $subject_result)
            <tr>
                <td>{{ $subject_result['subject'] }}</td>
                <td>{{ $subject_result['first_ca_score'] }}</td>
                <td>{{ $subject_result['second_ca_score'] }}</td>
                <td>{{ $subject_result['third_ca_score'] }}</td>
                <td>{{ $subject_result['exam_score'] }}</td>
                <td>{{ $subject_result['total'] }}</td>
                <td>{{ $subject_result['grade'] }}</td>
                <td>{{ $subject_result['pos']}}</td>
                <td>{{ $subject_result['out_of'] }}</td>
                <td>{{ $subject_result['class_average'] }}</td>
                <td>{{ $subject_result['comment'] }}</td>
            </tr>
          @endforeach
        @else
            <tr>
                <td colspan="11">No result has been published yet!</td>
            </tr>
        @endif
        </tbody>
    </table>
    <p>{{ HTML::link_to_route('results','Back') }}</p>
</div>
@endsection