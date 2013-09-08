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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Payroll
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
                                                <span>Staff List</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <p>{{ HTML::link_to_route('new_staff','New Staff Record','',array('class'=>'btn btn-info')) }} {{ HTML::link_to_route('incentives','Incentives','',array('class'=>'btn btn-success')) }}</p>
                                                <table class="table datatable-nosort table-striped table-bordered">
                                                    <thead>
                                                    <?php $sn = 1; ?>
                                                        <tr>
                                                            <th>S/N</th>
                                                            <th>Staff No.</th>
                                                            <th>Full Name</th>
                                                            <th>Designation</th>
                                                            <th>Actions</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                    @if(! is_null($staff) && is_array($staff) )
                                                      @foreach($staff as $user)
                                                        <tr>
                                                            <td>{{ $sn++ }}</td>
                                                            <td>{{ $user->staff_no }}</td>
                                                            <td>{{ $user->name }}</td>
                                                            <td>{{ Expand::designation($user->designation_id) }}</td>
                                                            <td>
                                                                {{ HTML::decode(HTML::link_to_route('staff_details', HTML::image('webassets/img/icons/paragraph_justify.png','Details',array('title'=>'Details')),array($user->id), array('class'=>'edit'))) }}
                                                                {{ HTML::decode(HTML::link_to_route('staff_salary', HTML::image('webassets/img/icons/money_bag.png','Salary',array('title'=>'Salary')),array($user->id), array('class'=>'edit'))) }}
                                                                {{ HTML::decode(HTML::link_to_route('staff_deduction', HTML::image('webassets/img/icons/coin.png','Deductions',array('title'=>'Deductions')),array($user->id), array('class'=>'edit'))) }}
                                                                {{ HTML::decode(HTML::link_to_route('delete_staff', HTML::image('webassets/img/icons/trash_can.png','Delete',array('title'=>'Delete')),array($user->id), array('class'=>'delete'))) }}
                                                            </td>
                                                        </tr>
                                                      @endforeach
                                                    @endif
                                                    </tbody>

                                                    <tfoot>
                                                    <tr>
                                                        <th>S/N</th>
                                                        <th>Staff No.</th>
                                                        <th>Full Name</th>
                                                        <th>Designation</th>
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
