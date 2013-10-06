@layout('template.layout')

@section('content')

        @include('template.partials.top_header')
        <div class="row-fluid">

        <!--  Left Sidebar -->
        @include('template.partials.left_sidebar')

        <!-- Body start -->
            <div class="span10 body-container">

            <div class="row-fluid print-top-breadcrumb">
                <div class="span12">
                    <ul class="breadcrumb">
                        Navigator <span class="divider">/</span>
                        <li>
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Broadsheet Report
                            <!--<span class="divider">/</span> -->
                        </li>
                    </ul>
                </div>
            </div>


            <div class="row-fluid print-only-div" style="display: none;">
                <div class="span12">
                    <div id="print-identity">
                        <div id="logo">
                          {{ HTML::image('webassets/receipts/images/logo.png','Logo') }}
                        </div>
                    </div>
                </div>
            </div>

                <div class="row-fluid">

                    <div class="span12">

                        <div class="row-fluid">

                            <div class="span9">
                                <div class="row-fluid">

                                    <div class="span12">
                                        <section class="utopia-widget">
                                            <div class="utopia-widget-title">
                                                {{ HTML::image('webassets/img/icons/paragraph_justify.png','',array('class'=>'utopia-widget-icon')) }}
                                                <span>Broadsheet Report</span>
                                            </div>
                                            <div class="utopia-widget-content">
                                                @include('template.partials.notification')
                                            	@if(!empty($subjects_offered))
                                            	<p>Class: <strong>{{ Expand::classes($class_id) }}</strong>&nbsp;&nbsp;&nbsp;&nbsp;Term: <strong>{{ Expand::term($term_id) }}</strong>&nbsp;&nbsp;&nbsp;&nbsp;Session: <strong>{{ Expand::academic_session($session_id) }}</strong></p>
                                                <table class="table">
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
                                                            <td colspan="8">No Student(s) has been added yet!</td>
                                                        </tr>
                                                    @endif
                                                    </tbody>
                                                </table>
                                                <table class="table">
                                                    <tbody>
                                                    <tr><td colspan="2">&nbsp;</td></tr>
                                                        <tr>
                                                            <td>No. of Students: <strong>{{ $students_count }}</strong></td>
                                                            <td>Class Average: <strong>{{ number_format(round($c_ave / $subject_count),2) }}</strong></td>
                                                        </tr>
                                                        <tr>
                                                            <td>No. of Promoted: <strong>{{ $promoted }}</strong></td>
                                                            <td>Highest Average in Class: <strong>{{ number_format(max($cl_ave),2) }}</strong></td>
                                                        </tr>
                                                        <tr>
                                                            <td>No. of Promoted on Trial: <strong>{{ $trialpromoted }}</td>
                                                            <td>Lowest Average in Class: <strong>{{ number_format(min($cl_ave),2) }}</strong></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">No. of Repeat: <strong>{{ $notpromoted }}</strong></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                @else
                                                <p>Results has not been published for <strong>{{Expand::term($term_id)}}</strong>!</p>
                                                @endif
                                                <a href="javascript:window.print();" class="btn btn-info"><li class="icon-print"></li> Print</a>
                                            </div>

                                        </section>

                                    </div>

                                </div>

                            </div><!-- Mid panel -->
                            <!--  Right Panel -->
                            @include('template.partials.right_panel')
                        </div>

                    </div>

                </div>

            </div>
        <!-- Body end -->

    </div>

    <!-- Maincontent end -->

@endsection
