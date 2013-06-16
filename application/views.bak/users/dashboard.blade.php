@layout('template.layout')

@section('content')

<div class="home">
	<h2>Welcome, {{ Session::get('firstname') . ' ' . Session::get('surname') }}</h2>
	@include('template.partials.notification')
    {{ Ais::dashboard_links_by_role(Session::get('role_id')) }}
    <p>{{ HTML::link_to_route('user_logout','Logout') }}</p>
</div>
@endsection
