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
                                                <span>School Fees Schedule Bill For {{ Expand::classes($class_id) }} {{ Expand::term_name($term_id) }} {{ Expand::academic_session(Ais::active_academic_session()) }} Academic Session</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <table class="table table-striped table-bordered">
                                                    <thead>
                                                    <?php $sn = 1; ?>
                                                        <tr>
                                                            <th>S/N</th>
                                                            <th>Fee Title</th>
                                                            <th>Amount (N)</th>
                                                            <th>Recurring</th>
                                                            <th>Actions</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                    @if(! is_null($fees) && is_array($fees) )
                                                      @foreach($fees as $fee)
                                                        <tr>
                                                            <td>{{ $sn++ }}</td>
                                                            <td>{{ Expand::payment_category($fee->payment_category_id) }}</td>
                                                            <td>{{ Ais::format_to_currency($fee->amount) }}</td>
                                                            <td>{{ Expand::recurring($fee->recurring_payment) }}</td>
                                                            <td>
                                                                {{ HTML::decode(HTML::link('payments/edit_fee_schedule/' . $fee->id, HTML::image('webassets/img/icons/pencil.png','Edit',array('title'=>'Edit')),array('class'=>'edit'))) }}
                                                                {{ HTML::decode(HTML::link('payments/delete_fee_schedule/' . $fee->id, HTML::image('webassets/img/icons/trash_can.png','Delete',array('title'=>'Delete')),array('class'=>'delete'))) }}
                                                            </td>
                                                        </tr>
                                                      @endforeach
                                                      <tr>
                                                          <td colspan="2"><strong>TOTAL</strong></td>
                                                          <td><strong>{{ Ais::format_to_currency($total_amount) }}</strong></td>
                                                          <td></td>
                                                          <td></td>
                                                      </tr>
                                                    @endif
                                                    </tbody>
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
