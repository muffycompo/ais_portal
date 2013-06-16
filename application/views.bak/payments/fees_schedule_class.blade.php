@layout('template.layout')

@section('content')

<div class="home">
	<h2>School Fees Schedule Bill For {{ Expand::classes($class_id) }} {{ Expand::term_name($term_id) }} {{ Expand::academic_session(Ais::active_academic_session()) }} Academic Session</h2>
	@include('template.partials.notification')
    <table class="ais_table">
        <thead>
            <tr>
                <th>Fee Title</th>
                <th>Amount (N)</th>
                <th>Recurring</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        @if(! is_null($fees) && is_array($fees) )
          @foreach($fees as $fee)
            <tr>
                <td>{{ Expand::payment_category($fee->payment_category_id) }}</td>
                <td>{{ Ais::format_to_currency($fee->amount) }}</td>
                <td>{{ Expand::recurring($fee->recurring_payment) }}</td>
                <td>
                    {{ HTML::link('payments/edit_fee_schedule/' . $fee->id,'Edit') }} |
                    {{ HTML::link('payments/delete_fee_schedule/' . $fee->id,'Delete') }}
                </td>
            </tr>
          @endforeach
          <tr>
                <td><strong>TOTAL</strong></td>
                <td>{{ Ais::format_to_currency($total_amount) }}</td>
                <td colspan="2"></td>
          </tr>
        @else
            <tr>
                <td colspan="4">No Fees Schedule for this Class!</td>
            </tr>
        @endif
        </tbody>
    </table>

    <p>{{ HTML::link('payments/fees_schedule/' . $term_id,'Back') }}</p>
</div>
@endsection