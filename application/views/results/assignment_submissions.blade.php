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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Assignment Submissions
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
                                                <span>Assignment Submissions</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <p>{{ HTML::link_to_route('assignments','Assignments/Notes','',array('class'=>'btn btn-info')) }}</p>
                                                <table class="table datatable-nosort table-striped table-bordered">
                                                    <thead>
                                                    <?php $sn = 1; ?>
                                                        <tr>
                                                            <th>S/N</th>
                                                            <th>Title</th>
                                                            <th>Score</th>
                                                            <th>Submitted By</th>
                                                            <th>Submission Date</th>
                                                            <th>Actions</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                    @if(! is_null($submissions) && is_array($submissions) )
                                                      @foreach($submissions as $submission)
                                                        <tr>
                                                            <td>{{ $sn++ }}</td>
                                                            <td>{{ Expand::assignment_title($submission->assignment_id) }}</td>
                                                            <td>{{ empty($submission->assignment_score) ? 'Not Marked' : $submission->assignment_score }}</td>
                                                            <td>{{ Ais::resolve_name($submission->user_id) }}</td>
                                                            <td>{{ Ais::reverse_db_datetime_to_date($submission->submission_date) }}</td>
                                                            <td>
                                                                {{ HTML::decode(HTML::link($submission->assignment_file_path, HTML::image('webassets/img/icons/download2.png','Download',array('title'=>'Download')),array('class'=>'edit','target'=>'_blank'))) }}
                                                                @if(Session::get('role_id') >= 2)
                                                                  {{ HTML::decode(HTML::link('results/assignment_score/' . $submission->user_id . '/' . $submission->assignment_id . '/' . $submission->id, HTML::image('webassets/img/icons/calculator.png','Score Assignment',array('title'=>'Score Assignment')),array('class'=>'delete'))) }}
                                                                @endif
                                                            </td>
                                                        </tr>
                                                      @endforeach
                                                    @endif
                                                    </tbody>

                                                    <tfoot>
                                                    <tr>
                                                        <th>S/N</th>
                                                        <th>Title</th>
                                                        <th>Score</th>
                                                        <th>Submitted By</th>
                                                        <th>Submission Date</th>
                                                        <th>Actions</th>
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
