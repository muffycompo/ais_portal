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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> {{ HTML::link_to_route('fee_payments','Fees Payments') }}
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
                                                <span>Schools Attended</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <p>
                                                    {{ HTML::link_to_route('new_school','Add School','',array('class'=>'btn btn-info')) }}
                                                    @if(Ais::registration_status() >= 3)
                                                        {{ HTML::decode(HTML::link_to_route('parent_info','Next <i class="icon-arrow-right"></i>','',array('class'=>'btn btn-success'))) }}
                                                    @endif
                                                </p>
                                                <table class="table table-striped table-bordered">
                                                    <thead>
                                                    <?php $sn = 1; ?>
                                                        <tr>
                                                            <th>S/N</th>
                                                            <th>Name of School</th>
                                                            <th colspan="2">Class</th>
                                                            <th colspan="2">Date</th>
                                                            <th>Actions</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>

                                                    @if(! is_null($schools) && is_array($schools) )
                                                      @foreach($schools as $school)
                                                        <tr>
                                                            <td>{{ $sn++ }}</td>
                                                            <td>{{ $school->school_name }}</td>
                                                            <td>{{ Expand::classes($school->class_from_id) }}</td>
                                                            <td>{{ Expand::classes($school->class_to_id) }}</td>
                                                            <td>{{ $school->year_from }}</td>
                                                            <td>{{ $school->year_to }}</td>
                                                            <td>
                                                                {{ HTML::decode(HTML::link('registrations/edit_school/' . $school->id, HTML::image('webassets/img/icons/pencil.png','Edit',array('title'=>'Edit')),array('class'=>'edit'))) }}
                                                                {{ HTML::decode(HTML::link('registrations/delete_school/' . $school->id, HTML::image('webassets/img/icons/trash_can.png','Delete',array('title'=>'Delete')),array('class'=>'delete'))) }}
                                                            </td>
                                                        </tr>
                                                      @endforeach
                                                    @else
                                                      <tr>
                                                          <td colspan="7">You have not added any School(s)!</td>
                                                      </tr>
                                                    @endif
                                                    </tbody>

                                                    <tfoot>
                                                    <tr>
                                                        <th>S/N</th>
                                                        <th>Name of School</th>
                                                        <th colspan="2">Class</th>
                                                        <th colspan="2">Date</th>
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
