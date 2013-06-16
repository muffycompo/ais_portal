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

                            <div class="span12">
                                <div class="row-fluid">

                                    <div class="span12">

                                        <section class="utopia-widget">
                                            <div class="utopia-widget-title">
                                                {{ HTML::image('webassets/img/icons/paragraph_justify.png','',array('class'=>'utopia-widget-icon')) }}
                                                <span>Applicants List</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                            	@if(! is_null($applicants) && is_array($applicants) )
                                                <p>{{ HTML::decode(HTML::link('admin/export_csv_list/1','<i class="icon-download-alt"></i> Download (CSV)',array('class'=>'btn btn-info'))) }}</p>
                                                @endif
                                                <table class="table datatable-nosort table-striped table-bordered">
                                                    <thead>
                                                    <?php $sn = 1; ?>
                                                    <tr>
                                                        <th>S/N</th>
                                                        <th>Form No.</th>
                                                        <th>Surname</th>
                                                        <th>First Name</th>
                                                        <th>Other Names</th>
                                                        <th>Email</th>
                                                        <th>Age</th>
                                                        <th>Application Type</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                    </thead>

                                                    <tbody>
                                                    @if(! is_null($applicants) && is_array($applicants) )
                                                      @foreach($applicants as $applicant)
                                                        <tr>
                                                            <td>{{ $sn++ }}</td>
                                                            <td>{{ $applicant->form_no }}</td>
                                                            <td>{{ $applicant->surname }}</td>
                                                            <td>{{ $applicant->firstname }}</td>
                                                            <td>{{ $applicant->othernames }}</td>
                                                            <td>{{ $applicant->email }}</td>
                                                            <td>{{ $applicant->age }}</td>
                                                            <td>{{ Expand::application_type($applicant->application_type_id) }}</td>
                                                            <td>
                                                                {{ HTML::decode(HTML::link('registrations/print_application/' . $applicant->id, HTML::image('webassets/img/icons/print.png','Application Form',array('title'=>'Application Form')),array('class'=>'edit','target'=>'_blank'))) }}
                                                                {{ HTML::decode(HTML::link('admin/official_use/' . $applicant->id, HTML::image('webassets/img/icons/fast_forward.png','Process Admission',array('title'=>'Process Admission')),array('class'=>'edit'))) }}
                                                            </td>
                                                        </tr>
                                                      @endforeach
                                                    @endif

                                                    </tbody>

                                                    <tfoot>
                                                    <tr>
                                                        <th>S/N</th>
                                                        <th>Form No.</th>
                                                        <th>Surname</th>
                                                        <th>First Name</th>
                                                        <th>Other Names</th>
                                                        <th>Email</th>
                                                        <th>Age</th>
                                                        <th>Application Type</th>
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
