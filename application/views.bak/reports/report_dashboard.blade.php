@layout('template.layout')

@section('content')

<div class="home">
	<h2>Reports</h2>
	@include('template.partials.notification')
    {{ Ais::reports_dashboard_links(Session::get('role_id')) }}
    <p>{{ HTML::link_to_route('user_dashboard','Back') }}</p>
</div>
@endsection
