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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> {{ HTML::link_to_route('pin_payments','PIN Payments') }}
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
                                                <span>PIN Payments</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <p>{{ HTML::link_to_route('new_pin_payment','New PIN Payment','',array('class'=>'btn btn-info')) }}</p>
                                                <table class="table datatable-nosort table-striped table-bordered">
                                                    <thead>
                                                    <?php $sn = 1; ?>
                                                        <tr>
                                                            <th>S/N</th>
                                                            <th>Surname</th>
                                                            <th>First Name</th>
                                                            <th>Amount</th>
                                                            <th>Receipt No.</th>
                                                            <th>Payment Date</th>
                                                            <th>Accountant</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        @if(! is_null($pin_payments) && is_array($pin_payments) )
                                                          @foreach($pin_payments as $payment)
                                                            <tr>
                                                                <td>{{ $sn++ }}</td>
                                                                <td>{{ $payment->applicant_firstname }}</td>
                                                                <td>{{ $payment->applicant_surname }}</td>
                                                                <td>N {{ Ais::format_to_currency($payment->amount) }}</td>
                                                                <td>{{ $payment->receipt_no }}</td>
                                                                <td>{{ Ais::reverse_db_date($payment->payment_date) }}</td>
                                                                <td>{{ $payment->accountant }}</td>
                                                                <td>
                                                                    {{ HTML::decode(HTML::link('payments/pin_receipt/' . $payment->id, HTML::image('webassets/img/icons/notepad.png','Receipt',array('title'=>'Receipt')),array('class'=>'edit', 'target'=>'_blank'))) }}
                                                                    {{ HTML::decode(HTML::link('payments/pin_slip/' . $payment->id, HTML::image('webassets/img/icons/copy.png','PIN Slip',array('title'=>'PIN Slip')),array('class'=>'edit', 'target'=>'_blank'))) }}
                                                                    {{ HTML::decode(HTML::link('payments/edit_pin_payment/' . $payment->id, HTML::image('webassets/img/icons/pencil.png','Edit',array('title'=>'Edit')),array('class'=>'edit'))) }}
                                                                    {{ HTML::decode(HTML::link('payments/delete_pin_payment/' . $payment->id, HTML::image('webassets/img/icons/trash_can.png','Delete',array('title'=>'Delete')),array('class'=>'delete'))) }}
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
                                                        <th>Amount</th>
                                                        <th>Receipt No.</th>
                                                        <th>Payment Date</th>
                                                        <th>Accountant</th>
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
