@layout('template.layout')

@section('content')

<div class="home">
	<h2>Broadsheet Report</h2>
	@if(!empty($subjects_offered))
	<p>Class: <strong>{{ Expand::classes($class_id) }}</strong>&nbsp;&nbsp;&nbsp;&nbsp;Term: <strong>{{ Expand::term($term_id) }}</strong>&nbsp;&nbsp;&nbsp;&nbsp;Session: <strong>{{ Expand::academic_session($session_id) }}</strong></p>
	@include('template.partials.notification')
    <table class="ais_table">
        <thead>
            <tr>
                <th>S/No.</th>
                <th>Admission No.</th>
                <th>Name</th>
                @if(! is_null($subjects_offered) && is_array($subjects_offered) )
                @foreach($subjects_offered as $subject)
                    <th>{{ Expand::subject($subject->subject_id) }}</th>
                @endforeach
                @endif
                <th>No. of Sub</th>
                <th>Ave.</th>
                <th>Pos.</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
        @if(! is_null($students) && is_array($students) )
        <?php
            $promoted = 0;
            $notpromoted = 0;
            $trialpromoted = 0;
            $c_ave = 0;
            $cl_ave = array();
            $students_count = count($students);
         ?>
          @foreach($students as $student)
            <tr>
                <td>{{$sn++}}</td>
                <td>{{ Ais::resolve_admission_no_from_userid($student->id) }}</td>
                <td>{{ $student->firstname . ' '.$student->surname }}</td>
                <?php
                    $subject_count = count($subjects_total);
                    $ave = 0;
                ?>
                @foreach($subjects_total as $subject)
                    <?php
                        $total_score = Ais::student_total_score($subject->subject_id,$class_id,$term_id,$session_id,$student->id);
                        $ave = $ave + $total_score;
                    ?>
                  <td>{{ $total_score }}</td>
                @endforeach
                <?php
                    $total_ave = ($ave / $subject_count);
                    $final_ave = number_format((float)$total_ave, 2);
                ?>
                <td>{{ $subject_count }}</td>
                <td>{{ $final_ave }}</td>
                <?php
                    $c_ave = $c_ave + $total_ave;
                    $cl_ave[] = $total_ave;
                    $ts_ar = Ais::total_score_per_class($class_id, $term_id, $session_id);
                    $key = array_search($ave, $ts_ar);
                ?>
                <td>{{ $key + 1 }}</td>
                <td>
                    {{ Ais::class_promotion($final_ave, $student->id, $class_id, $term_id, $session_id) }}
                    <?php
                        $pr = Ais::class_promotion($final_ave, $student->id, $class_id, $term_id, $session_id);
                        if($pr == 'Promoted'){
                            $promoted++;
                        }
                        if($pr == 'Repeat'){
                            $notpromoted++;
                        }
                        if($pr == 'Promoted Trial'){
                            $trialpromoted++;
                        }

                    ?>
                </td>
            </tr>
          @endforeach
        @else
            <tr>
                <td colspan="8">No Student has been added yet!</td>
            </tr>
        @endif
        </tbody>
    </table>
    <p>
        No. of Students: <strong>{{ $students_count }}</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Class Average: <strong>{{ number_format(round($c_ave / $subject_count),2) }}</strong><br>
        No. of Promoted: <strong>{{ $promoted }}</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Highest Average in Class: <strong>{{ number_format(max($cl_ave),2) }}</strong><br>
        No. of Promoted on Trial: <strong>{{ $trialpromoted }}</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Lowest Average in Class: <strong>{{ number_format(min($cl_ave),2) }}</strong><br>
        No. of Repeat: <strong>{{ $notpromoted }}</strong>
    </p>
    @else
    <p>Results has not been published for <strong>{{Expand::term($term_id)}}</strong>!</p>
    @endif
    <p>{{ HTML::link('reports/broadsheet/' . $session_id . '/' . $term_id,'Back') }}</p>
</div>
@endsection