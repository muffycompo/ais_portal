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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Events List
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
                                                <span>Events List</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <p>{{ HTML::link_to_route('calendars','Event Calendar','',array('class'=>'btn btn-info')) }}</p>
                                                <table class="table datatable-nosort table-striped table-bordered">
                                                    <thead>
                                                    <?php $sn = 1; ?>
                                                        <tr>
                                                            <th>S/N</th>
                                                            <th>Title</th>
                                                            <th>URL</th>
                                                            <th>Start Date (Time)</th>
                                                            <th>End Date (Time)</th>
                                                            <th>Type</th>
                                                            <th>Author</th>
                                                            <th>Actions</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                    @if(! empty($events) && is_array($events) )
                                                      @foreach($events as $event)
                                                        <tr>
                                                            <td>{{ $sn++ }}</td>
                                                            <td>{{ $event->event_title }}</td>
                                                            <td>{{ empty($event->event_url)? 'N/A' : $event->event_url }}</td>
                                                            <td>{{ Ais::reverse_db_datetime_to_date($event->start_date, true) }}</td>
                                                            <td>{{ Ais::reverse_db_datetime_to_date($event->end_date, true) }}</td>
                                                            <td>{{ Expand::event_group($event->event_for_group_id) }}</td>
                                                            <td>{{ Ais::resolve_name($event->user_id) }}</td>
                                                            <td>
                                                                {{ HTML::decode(HTML::link_to_route('edit_event', HTML::image('webassets/img/icons/pencil.png','Edit',array('title'=>'Edit')),array($event->id), array('class'=>'edit'))) }}
                                                                {{ HTML::decode(HTML::link_to_route('delete_event', HTML::image('webassets/img/icons/close.png','Delete',array('title'=>'Delete')),array($event->id), array('class'=>'delete'))) }}
                                                            </td>
                                                        </tr>
                                                      @endforeach
                                                    @endif
                                                    </tbody>

                                                    <tfoot>
                                                    <tr>
                                                        <th>S/N</th>
                                                        <th>Title</th>
                                                        <th>URL</th>
                                                        <th>Start Date (Time)</th>
                                                        <th>End Date (Time)</th>
                                                        <th>Type</th>
                                                        <th>Author</th>
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
