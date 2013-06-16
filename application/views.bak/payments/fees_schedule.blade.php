@layout('template.layout')

@section('content')

<div class="home">
	<h2>Schedule of Fees</h2>
	@include('template.partials.notification')
	<p>{{ HTML::link_to_route('add_new_fee','Add New Fee') }}</p>
    <p>1 - {{ HTML::link('payments/fees_schedule/1','First Term Schedule') }}</p>
    <p>2 - {{ HTML::link('payments/fees_schedule/2','Second Term Schedule') }}</p>
    <p>3 - {{ HTML::link('payments/fees_schedule/3','Third Term Schedule') }}</p>
    <p>{{ HTML::link_to_route('admin_payments','Back') }}</p>
</div>
@endsection
