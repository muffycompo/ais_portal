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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Student Phone Numbers
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
                                                <span>Students Report - Phone Numbers</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                            <p>{{ HTML::link_to_route('download_no_list','Download List',array(base64_encode('student')),array('class'=>'btn btn-info')) }}</p>
                                                <table class="table datatable-nosort table-striped table-bordered">
                                                    <thead>
                                                    <?php $sn = 1; ?>
                                                        <tr>
                                                            <th>S/N</th>
                                                            <th>Surname</th>
                                                            <th>First Name</th>
                                                            <th>Class</th>
                                                            <th>GSM Number</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                    @if(($students !== false) && is_array($students) )
                                                      @foreach($students as $student)
                                                        <tr>
                                                            <td>{{ $sn++ }}</td>
                                                            <td>{{ $student->surname }}</td>
                                                            <td>{{ $student->firstname }}</td>
                                                            <td>{{ Expand::classes($student->current_class_id) }}</td>
                                                            <td>{{ !empty($student->phone_number) ? $student->phone_number : 'No GSM No. present' }}</td>
                                                        </tr>
                                                      @endforeach
                                                    @endif
                                                    </tbody>

                                                    <tfoot>
                                                    <tr>
                                                        <th>S/N</th>
                                                        <th>Surname</th>
                                                        <th>First Name</th>
                                                        <th>Class</th>
                                                        <th>GSM Number</th>
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
