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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Students by Subject
                            <!--<span class="divider">/</span> -->
                        </li>
                    </ul>
                </div>
            </div>

                <div class="row-fluid">

                    <div class="span12">

                        <div class="row-fluid">

                            <div class="span12">
                                <div class="row-fluid">

                                    <div class="span12">

                                        <section class="utopia-widget">
                                            <div class="utopia-widget-title">
                                                {{ HTML::image('webassets/img/icons/paragraph_justify.png','',array('class'=>'utopia-widget-icon')) }}
                                                <span>Students taking {{ Expand::subject($subject_id) }} in {{ Expand::classes($class_id) }}</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                            <p>{{ HTML::link_to_route('attendance_list','Attendance List',array($subject_id, $class_id, $term_id),array('class'=>'btn btn-info')) }}</p>
                                                <table class="table datatable-nosort table-striped table-bordered">
                                                    <thead>
                                                    <?php $sn = 1; ?>
                                                        <tr>
                                                            <th>S/N</th>
                                                            <th>Admission No.</th>
                                                            <th>Surname</th>
                                                            <th>First Name</th>
                                                            <th>1st CA<br><small>(20%)</small></th>
                                                            <th>2nd CA<br><small>(10%)</small></th>
                                                            <th>3rd CA<br><small>(10%)</small></th>
                                                            <th>Exam<br><small>(60%)</small></th>
                                                            <th>Total<br><small>(100%)</small></th>
                                                            <th>Actions</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                    @if(! is_null($students) && is_array($students) )
                                                      @foreach($students as $student)
                                                        <tr>
                                                            <td>{{ $sn++ }}</td>
                                                            <td>{{ Ais::resolve_admission_no_from_userid($student['student_id']) }}</td>
                                                            <td>{{ $student['surname'] }}</td>
                                                            <td>{{ $student['firstname'] }}</td>
                                                            <td>{{ $student['first_ca_score'] }}</td>
                                                            <td>{{ $student['second_ca_score'] }}</td>
                                                            <td>{{ $student['third_ca_score'] }}</td>
                                                            <td>{{ $student['exam_score'] }}</td>
                                                            <td>{{ $student['total'] }}</td>
                                                            <td>
                                                                {{ HTML::decode(HTML::link('results/new_assessment/' . $student['student_id'] .'/' . $subject_id. '/' .$class_id . '/' . $term_id, HTML::image('webassets/img/icons/calculator.png','Scores',array('title'=>'Scores')),array('class'=>'edit'))) }}
                                                                @if($student['total'] > 0)
                                                                    @if($student['publish_status'])
                                                                      {{ HTML::decode(HTML::link('results/unpublish_result/' . $student['student_id'] .'/' . $subject_id. '/' .$class_id . '/' . $term_id, HTML::image('webassets/img/icons/undo.png','UnPublish',array('title'=>'UnPublish')),array('class'=>'edit'))) }}
                                                                    @else
                                                                      {{ HTML::decode(HTML::link('results/publish_result/' . $student['student_id'] .'/' . $subject_id. '/' .$class_id . '/' . $term_id, HTML::image('webassets/img/icons/redo.png','Publish',array('title'=>'Publish')),array('class'=>'edit'))) }}
                                                                    @endif
                                                                @endif
                                                                {{ HTML::decode(HTML::link_to_route('attendance', HTML::image('webassets/img/icons/notepad.png','Mark Attendance',array('title'=>'Mark Attendance')),array($student['student_id'], $subject_id, $class_id, $term_id),array('class'=>'edit'))) }}
                                                            </td>
                                                        </tr>
                                                      @endforeach
                                                      @endif
                                                    </tbody>

                                                    <tfoot>
                                                    <tr>
                                                        <th>S/N</th>
                                                        <th>Admission No.</th>
                                                        <th>Surname</th>
                                                        <th>First Name</th>
                                                        <th>1st CA<br><small>(20%)</small></th>
                                                        <th>2nd CA<br><small>(10%)</small></th>
                                                        <th>3rd CA<br><small>(10%)</small></th>
                                                        <th>Exam<br><small>(60%)</small></th>
                                                        <th>Total<br><small>(100%)</small></th>
                                                        <th>Actions</th>
                                                    </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                        </section>

                                    </div>

                                </div>

                            </div><!-- Mid panel -->
                        </div>

                    </div>

                </div>

            </div>
        <!-- Body end -->

    </div>

    <!-- Maincontent end -->

@endsection
