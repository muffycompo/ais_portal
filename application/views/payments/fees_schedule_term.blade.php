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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Fees Schedule
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
                                                <span>Fees Schedule by Class - {{ Expand::term_name($term_id) }}</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <p>{{ HTML::link_to_route('add_new_fee','Add New Fee','',array('class'=>'btn btn-info')) }}</p>
                                                <table class="table datatable-nosort table-striped table-bordered">
                                                    <thead>
                                                    <?php $sn = 1; ?>
                                                        <tr>
                                                            <th>S/N</th>
                                                            <th>Class</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                    @if(! is_null($classes) && is_array($classes))
                                                      @foreach($classes as $class)
                                                        <tr>
                                                            <td>{{ $sn++ }}</td>
                                                            <td>{{ $class->class_name }}</td>
                                                            <td>
                                                                {{ HTML::decode(HTML::link('payments/class_fee_schedule/' . $term_id . '/' . $class->id, HTML::image('webassets/img/icons/notepad.png','View Fee Schedule',array('title'=>'View Fee Schedule')),array('class'=>'edit'))) }}
                                                            </td>
                                                        </tr>
                                                      @endforeach
                                                    @endif
                                                    </tbody>

                                                    <tfoot>
                                                    <tr>
                                                        <th>S/N</th>
                                                        <th>Class</th>
                                                        <th>Action</th>
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
