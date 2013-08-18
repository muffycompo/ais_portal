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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Assignments/Notes
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
                                                <span>Assignments/Notes</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <p>
                                                @if(Session::get('role_id') == 1 && !empty($assignments))
                                                    {{ HTML::link_to_route('assignment_submissions','Assignment Submissions','',array('class'=>'btn btn-info')) }}
                                                @elseif(Session::get('role_id') >= 2)
                                                    {{ HTML::link_to_route('new_assignment','Upload New Assignment/Note','',array('class'=>'btn btn-info')) }}
                                                @endif
                                                </p>
                                                <table class="table datatable-nosort table-striped table-bordered">
                                                    <thead>
                                                    <?php $sn = 1; ?>
                                                        <tr>
                                                            <th>S/N</th>
                                                            <th>Title</th>
                                                            <th>Type</th>
                                                            <th>Subject</th>
                                                            <th>Class</th>
                                                            <th>Author</th>
                                                            <th>Due Date</th>
                                                            <th>Actions</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                    @if(! is_null($assignments) && is_array($assignments) )
                                                      @foreach($assignments as $assignment)
                                                        <tr>
                                                            <td>{{ $sn++ }}</td>
                                                            <td>{{ $assignment->title }}</td>
                                                            <td>{{ Expand::assignment_note($assignment->an_type) }}</td>
                                                            <td>{{ Expand::subject($assignment->subject_id) }}</td>
                                                            <td>{{ Expand::classes($assignment->class_id) }}</td>
                                                            <td>{{ Ais::resolve_name($assignment->user_id) }}</td>
                                                            <td>{{ empty($assignment->submission_deadline)? 'N/A' : '<span class="ais_tooltip" data-original-title="'.Ais::days_left($assignment->submission_deadline).'">' . Ais::reverse_db_datetime_to_date($assignment->submission_deadline) . '</span>' }}</td>
                                                            <td>
                                                                @if(Session::get('role_id') >= 2 && $assignment->an_type == 2)
                                                                    {{ HTML::decode(HTML::link_to_route('assignment_submissions', HTML::image('webassets/img/icons/spreadsheet.png','Submissions',array('title'=>'Submissions')),'',array('class'=>'edit'))) }}
                                                                @endif
                                                                    {{ HTML::decode(HTML::link($assignment->an_file_path, HTML::image('webassets/img/icons/download2.png','Download',array('title'=>'Download')),array('class'=>'edit','target'=>'_blank'))) }}
                                                                @if(Session::get('role_id') == 1 && Ais::has_submitted_assignment($assignment->id) == false && Ais::days_left($assignment->submission_deadline, true) != false)
                                                                    {{ HTML::decode(HTML::link_to_route('new_assignment_submission', HTML::image('webassets/img/icons/upload2.png','Submit Assignment',array('title'=>'Submit Assignment')),array($assignment->id),array('class'=>'edit'))) }}
                                                                @endif
                                                                @if(Session::get('role_id') >= 2)
                                                                    <?php $file = explode('/',$assignment->an_file_path); ?>
                                                                    {{ HTML::decode(HTML::link('results/delete_assignment/' .$assignment->id .'/'. base64_encode($file[3]), HTML::image('webassets/img/icons/trash_can.png','Delete',array('title'=>'Delete')),array('class'=>'delete'))) }}
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
                                                        <th>Type</th>
                                                        <th>Subject</th>
                                                        <th>Class</th>
                                                        <th>Author</th>
                                                        <th>Due Date</th>
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
<script type="text/javascript">
    $(document).ready(function(){
        $('.ais_tooltip').tooltip('toggle');
        $('.ais_tooltip').tooltip('hide');
    });
</script>
@endsection
