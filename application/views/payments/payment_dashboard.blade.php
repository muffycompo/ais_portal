@layout('template.layout')

@section('content')

<div class="home">
	<h2>Payments</h2>
	@include('template.partials.notification')

    <p>{{ HTML::link('#','Schedule of Fees') }}</p><!-- Only shown to Admin -->
    <p>{{ HTML::link_to_route('fee_payments','Fees Payments') }}</p>
    <p>{{ HTML::link_to_route('pin_payments','PIN Payments') }}</p>
    <p>{{ HTML::link_to_route('user_dashboard','Back') }}</p>
</div>
@endsection
