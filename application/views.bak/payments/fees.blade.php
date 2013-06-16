@layout('template.layout')

@section('content')

<div class="home">
	<h2>Fees Payments</h2>
	@include('template.partials.notification')

    <p>{{ HTML::link_to_route('new_fee_payment','New Fees Payment') }}</p>

    <table class="ais_table">
        <thead>
            <tr>
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
        </thead>
        <tbody>
        @if(! is_null($fee_payments) && is_array($fee_payments) )
          @foreach($fee_payments as $payment)
            <tr>
                <td>{{ $payment->admission_no }}</td>
                <td>N {{ Ais::format_to_currency($payment->paid_amount) }}</td>
                <td>{{ $payment->teller_no }}</td>
                <td>{{ $payment->receipt_no }}</td>
                <td>{{ Expand::payment_category($payment->payment_category_id) }}</td>
                <td>{{ Ais::reverse_db_date($payment->date_of_payment) }}</td>
                <td>{{ Expand::classes($payment->class_id) }}</td>
                <td>{{ $payment->accountant_name }}</td>
                <td>
                    {{ HTML::link('payments/fee_receipt/' . $payment->id,'Receipt',array('target'=>'_blank')) }} |
                    {{ HTML::link('payments/edit_fee_payment/' . $payment->id,'Edit') }}
                   <!-- {{ HTML::link('payments/delete_fee_payment/' . $payment->id,'Delete') }} -->
                </td>
            </tr>
          @endforeach
        @else
            <tr>
                <td colspan="9">No Fees Payment found!</td>
            </tr>
        @endif
        </tbody>
    </table>

    <p>{{ HTML::link_to_route('admin_payments','Back') }}</p>
</div>
@endsection