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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Fees Payments
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
                                                <span>Fees Payments</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <p>{{ HTML::link_to_route('new_fee_payment','New Fees Payment','',array('class'=>'btn btn-info')) }}</p>
                                                <table class="table datatable-nosort table-striped table-bordered">
                                                    <thead>
                                                    <?php $sn = 1; ?>
                                                        <tr>
                                                            <th>S/N</th>
                                                            <th>Admission No</th>
                                                            <th>Amount</th>
                                                            <th>Teller No.</th>
                                                            <th>Receipt No.</th>
                                                            <th>Payment Type</th>
                                                            <th>Payment Date</th>
                                                            <th>Class</th>
                                                            <th>Accountant</th>
                                                            <th>Actions</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                    @if(! is_null($fee_payments) && is_array($fee_payments) )
                                                      @foreach($fee_payments as $payment)
                                                        <tr>
                                                            <td>{{ $sn++ }}</td>
                                                            <td>{{ $payment->admission_no }}</td>
                                                            <td>N {{ Ais::format_to_currency($payment->paid_amount) }}</td>
                                                            <td>{{ $payment->teller_no }}</td>
                                                            <td>{{ $payment->receipt_no }}</td>
                                                            <td>{{ Expand::payment_category($payment->payment_category_id) }}</td>
                                                            <td>{{ Ais::reverse_db_date($payment->date_of_payment) }}</td>
                                                            <td>{{ Expand::classes($payment->class_id) }}</td>
                                                            <td>{{ $payment->accountant_name }}</td>
                                                            <td>
                                                                {{ HTML::decode(HTML::link('payments/fee_receipt/' . $payment->id, HTML::image('webassets/img/icons/notepad.png','Receipt',array('title'=>'Receipt')),array('class'=>'edit', 'target'=>'_blank'))) }}
                                                                {{ HTML::decode(HTML::link('payments/edit_fee_payment/' . $payment->id, HTML::image('webassets/img/icons/pencil.png','Edit',array('title'=>'Edit')),array('class'=>'edit'))) }}
                                                                @if(Session::get('role_id') == 5)
                                                                {{ HTML::decode(HTML::link('payments/delete_fee_payment/' . $payment->id, HTML::image('webassets/img/icons/trash_can.png','Delete',array('title'=>'Delete')),array('class'=>'delete'))) }}
                                                                @endif
                                                            </td>
                                                        </tr>
                                                      @endforeach
                                                      @endif
                                                    </tbody>

                                                    <tfoot>
                                                    <tr>
                                                        <th>S/N</th>
                                                        <th>Admission No</th>
                                                        <th>Amount</th>
                                                        <th>Teller No.</th>
                                                        <th>Receipt No.</th>
                                                        <th>Payment Type</th>
                                                        <th>Payment Date</th>
                                                        <th>Class</th>
                                                        <th>Accountant</th>
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
