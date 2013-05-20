@layout('template.layout')

                   @section('content')

<div class="home">
	<h2>PIN Payments</h2>
	@include('template.partials.notification')

    <p>{{ HTML::link_to_route('new_pin_payment','New PIN Payment') }}</p>

    <table class="ais_table">
        <thead>
            <tr>
                <th>First Name</th>
                <th>Surname</th>
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
                <td>{{ $payment->applicant_firstname }}</td>
                <td>{{ $payment->applicant_surname }}</td>
                <td>N {{ Ais::format_to_currency($payment->amount) }}</td>
                <td>{{ $payment->receipt_no }}</td>
                <td>{{ Ais::reverse_db_date($payment->payment_date) }}</td>
                <td>{{ $payment->accountant }}</td>
                <td>
                    {{ HTML::link('payments/pin_receipt/' . $payment->id,'Receipt',array('target'=>'_blank')) }} |
                    {{ HTML::link('payments/pin_slip/' . $payment->pin_id,'PIN Slip',array('target'=>'_blank')) }} |
                    {{ HTML::link('payments/edit_pin_payment/' . $payment->id,'Edit') }}
                   <!-- {{ HTML::link('payments/delete_pin_payment/' . $payment->id,'Delete') }} -->
                </td>
            </tr>
          @endforeach
        @else
            <tr>
                <td colspan="7">No PIN Payment found!</td>
            </tr>
        @endif
        </tbody>
    </table>

    <p>{{ HTML::link_to_route('admin_payments','Back') }}</p>
</div>
@endsection