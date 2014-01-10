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
                                                <span>Results for students taking {{ Expand::subject($subject_id) }} in {{ Expand::classes($class_id) }}</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <table class="table datatable-nosort table-striped table-bordered">
                                                    <thead>
                                                    <?php $sn = 1; ?>
                                                        <tr>
                                                            <th>S/N</th>
                                                            <th>Admission No.</th>
                                                            <th>Surname</th>
                                                            <th>First Name</th>
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
                                                            <td>
                                                                {{ HTML::decode(HTML::link_to_route('term_result', HTML::image('webassets/img/icons/eye.png','View Result',array('title'=>'View Result')),array($term_id,$student['student_id']),array('class'=>'edit','target'=>'_blank'))) }}
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
