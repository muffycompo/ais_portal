@layout('template.layout')

@section('content')

<div class="home">
	<h2>Payments</h2>
	@include('template.partials.notification')
    @if(Ais::is_admin(Session::get('user_id')))
    <p>{{ HTML::link_to_route('fees_schedule','Schedule of Fees') }}</p>
    @endif
    <p>{{ HTML::link_to_route('fee_payments','Fees Payments') }}</p>
    <p>{{ HTML::link_to_route('pin_payments','PIN Payments') }}</p>
    <p>{{ HTML::link_to_route('user_dashboard','Back') }}</p>
</div>
@endsection
