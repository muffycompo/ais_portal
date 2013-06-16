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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Teachers
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
                                                <span>Teachers</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <table class="table datatable-nosort table-striped table-bordered">
                                                    <thead>
                                                    <?php $sn = 1; ?>
                                                        <tr>
                                                            <th>S/N</th>
                                                            <th>Surname</th>
                                                            <th>First Name</th>
                                                            <th>Email</th>
                                                            <th>Assigned Subjects</th>
                                                            <th>Assigned Class</th>
                                                            <th>Actions</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                    @if(! is_null($teachers) && is_array($teachers) )
                                                      @foreach($teachers as $teacher)
                                                        <tr>
                                                            <td>{{ $sn++ }}</td>
                                                            <td>{{ $teacher->surname }}</td>
                                                            <td>{{ $teacher->firstname }}</td>
                                                            <td>{{ $teacher->email }}</td>
                                                            <td>{{ Ais::assigned_teacher_subjects($teacher->id) }}</td>
                                                            <td>{{ Ais::assigned_teacher_class($teacher->id) }}</td>
                                                            <td>
                                                                {{ HTML::decode(HTML::link('settings/teacher/' . $teacher->id . '/assign_subject', HTML::image('webassets/img/icons/clip.png','Assign to Subject',array('title'=>'Assign to Subject')),array('class'=>'edit'))) }}
                                                                {{ HTML::decode(HTML::link('settings/teacher/' . $teacher->id . '/assign_class', HTML::image('webassets/img/icons/clipboard.png','Assign to Class',array('title'=>'Assign to Class')),array('class'=>'edit'))) }}
                                                            </td>
                                                        </tr>
                                                      @endforeach
                                                    @endif
                                                    </tbody>

                                                    <tfoot>
                                                    <tr>
                                                        <th>S/N</th>
                                                        <th>Surname</th>
                                                        <th>First Name</th>
                                                        <th>Email</th>
                                                        <th>Assigned Subjects</th>
                                                        <th>Assigned Class</th>
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
