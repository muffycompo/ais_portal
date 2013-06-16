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
                                                <span>Admissions List</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                            	@if(! is_null($admissions) && is_array($admissions) )
                                                <p>{{ HTML::decode(HTML::link('admin/export_csv_list/2','<i class="icon-download-alt"></i> Download (CSV)',array('class'=>'btn btn-info'))) }}</p>
                                                @endif
                                                <table class="table datatable-nosort table-striped table-bordered">
                                                    <thead>
                                                    <?php $sn = 1; ?>
                                                    <tr>
                                                        <th>S/N</th>
                                                        <th>Admission No.</th>
                                                        <th>Surname</th>
                                                        <th>First Name</th>
                                                        <th>Other Names</th>
                                                        <th>Class Admitted into</th>
                                                        <th>Recommendation</th>
                                                        <th>Action</th>
                                                    </tr>
                                                    </thead>

                                                    <tbody>
                                                    @if(! is_null($admissions) && is_array($admissions) )
                                                      @foreach($admissions as $admission)
                                                        <tr>
                                                            <td>{{ $sn++ }}</td>
                                                            <td>{{ $admission->admission_no }}</td>
                                                            <td>{{ $admission->surname }}</td>
                                                            <td>{{ $admission->firstname }}</td>
                                                            <td>{{ $admission->othernames }}</td>
                                                            <td>{{ Expand::classes($admission->aic_id) }}</td>
                                                            <td>{{ Expand::admission_recommendation($admission->admission_recommendation_id) }}</td>
                                                            <td>
                                                                {{ HTML::decode(HTML::link('admin/approve_admission/' . $admission->id, HTML::image('webassets/img/icons/checkmark2.png','Approve',array('title'=>'Approve')),array('class'=>'edit'))) }}
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
                                                        <th>Other Names</th>
                                                        <th>Class Admitted into</th>
                                                        <th>Recommendation</th>
                                                        <th>Action</th>
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
