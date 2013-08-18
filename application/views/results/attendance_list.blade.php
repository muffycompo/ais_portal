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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Attendance List
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
                                                <span>Attendance List for {{ Expand::classes($class_id) }}</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                            <p>{{ HTML::link_to_route('assessment','Assessments',array($subject_id, $class_id, $term_id),array('class'=>'btn btn-info')) }}</p>
                                                <table class="table datatable-nosort table-striped table-bordered">
                                                    <thead>
                                                    <?php $sn = 1; ?>
                                                        <tr>
                                                            <th>S/N</th>
                                                            <th>Admission No.</th>
                                                            <th>Student Name</th>
                                                            <th>Subject</th>
                                                            <th>Class</th>
                                                            <th>Date</th>
                                                            <th>Attendance</th>
                                                            <th>Reason</th>
                                                            <th>Total</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                    @if(! is_null($attendance) && is_array($attendance) )
                                                      @foreach($attendance as $attend)
                                                        <tr>
                                                            <td>{{ $sn++ }}</td>
                                                            <td>{{ $attend->admission_no }}</td>
                                                            <td>{{ Ais::resolve_name(Ais::resolve_userid_from_admission_no($attend->admission_no)) }}</td>
                                                            <td>{{ Expand::subject($attend->subject_id) }}</td>
                                                            <td>{{ Expand::classes($attend->class_id) }}</td>
                                                            <td>{{ Ais::reverse_db_datetime_to_date($attend->attendance_date) }}</td>
                                                            <td>{{ Expand::attendance_type($attend->attendance_type_id) }}</td>
                                                            <td>{{ $attend->attendance_reason }}</td>
                                                            <td>{{ $attend->attendance_count }}</td>
                                                        </tr>
                                                      @endforeach
                                                    @endif
                                                    </tbody>

                                                    <tfoot>
                                                    <tr>
                                                        <th>S/N</th>
                                                        <th>Admission No.</th>
                                                        <th>Student Name</th>
                                                        <th>Subject</th>
                                                        <th>Class</th>
                                                        <th>Date</th>
                                                        <th>Attendance</th>
                                                        <th>Reason</th>
                                                        <th>Total</th>
                                                    </tr>
                                                    </tfoot>
                                                </table>

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
