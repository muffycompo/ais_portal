@layout('template.layout')

@section('content')

        @include('template.partials.top_header')
        <div class="row-fluid">

        <!--  Left Sidebar -->
        @include('template.partials.left_sidebar')

        <!-- Body start -->
            <div class="span10 body-container">

            <div class="row-fluid">
                <div class="span12">
                    <ul class="breadcrumb">
                        Navigator <span class="divider">/</span>
                        <li>
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Report Sheet
                            <!--<span class="divider">/</span> -->
                        </li>
                    </ul>
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
                                                <span>Report Sheet for {{Expand::term($term_id)}} of {{Expand::classes($class_id)}}, {{Expand::academic_session(Ais::active_academic_session())}} Academic Session</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                              @if($final_average > 0)
                                                <table class="table">
                                                    <tbody>
                                                        <tr>
                                                            <td>Admission No: <strong>{{ Ais::resolve_admission_no_from_userid($biodata->id)}}</strong><td>
                                                            <td>Sex: <strong>{{Expand::gender($biodata->gender_id)}}</strong><td>
                                                            <td>Date: <strong>{{ date('d/m/Y') }}</strong><td>
                                                        </tr>
                                                        <tr>
                                                            <td>Name: <strong>{{$biodata->firstname . ' ' . $biodata->surname}}</strong><td>
                                                            <td>Age: <strong>{{$biodata->age}}</strong><td>
                                                            <td>House: <strong></strong><td>
                                                        </tr>
                                                        <tr>
                                                            <td>Class: <strong>{{ Expand::classes($biodata->current_class_id) }}</strong><td>
                                                            <td>No. in Class: <strong>{{ $number_in_class }}</strong><td>
                                                            <td>Attendance: <strong></strong><td>
                                                        </tr>
                                                        <tr>
                                                            <td>Final Average: <strong>{{ number_format($final_average,2) }}</strong><td>
                                                            <td>Final Position: <strong>{{ $final_position }}</strong><td>
                                                            <td>Final Grade: <strong>{{ $final_grade['grade'] }}</strong><td>
                                                        </tr>
                                                        <tr>
                                                            <td>Highest Class Ave.: <strong>{{ $class_average['highest_average'] }}</strong><td>
                                                            <td>Lowest Class Ave.: <strong>{{ $class_average['lowest_average'] }}</strong><td>
                                                            <td>&nbsp;<td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                                <table class="table">
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
                                                    @endif
                                                    </tbody>
                                                </table>

                                                <table class="table">
                                                    <tbody>
                                                        <tr>
                                                            <td>No. of Subjects Offered: <strong>{{ $subjects_offered }}</strong><td>
                                                            <td colspan="5">Total Score: <strong>{{ number_format($total_score,2) }}</strong><td>
                                                        </tr>
                                                        <tr>
                                                            <td>F=FAIL</td>
                                                            <td>P=PASS</td>
                                                            <td>C=CREDIT</td>
                                                            <td>B2=GOOD</td>
                                                            <td>B1=V.GOOD</td>
                                                            <td>A=DISTINCTION</td>
                                                        </tr>
                                                        <tr>
                                                            <td>F(0-49)</td>
                                                            <td>P(50-59)</td>
                                                            <td>C(60-69)</td>
                                                            <td>B2(70-79)</td>
                                                            <td>B1(80-89)</td>
                                                            <td>A(90-100)</td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                                <div class="row-fluid">
                                                    <div class="span12">
                                                        <div class="pull-right">
                                                            <a href="javascript:void(0)" class="btn btn-info"><li class="icon-print"></li> Print</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                @else
                                                    <div class="alert alert-error">
                                                        <strong>An error occurred...</strong>
                                                        <p><strong>{{Expand::term($term_id)}}</strong> Result has not been published, please check back at a later date when the result has been published!</p>
                                                    </div>

                                                @endif
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
