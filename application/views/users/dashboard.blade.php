@layout('template.layout')

@section('content')

<div class="home">
	<h2>Welcome, {{ Session::get('firstname') . ' ' . Session::get('surname') }}</h2>
	@include('template.partials.notification')

    <p>{{ HTML::link('#','Profile') }}</p>
    <p>{{ HTML::link('#','Results') }}</p>
    <p>{{ HTML::link('#','Payments') }}</p>
    <p>{{ HTML::link('#','Classes') }}</p>
    <p>{{ HTML::link('#','Assignments') }}</p>
    <p>{{ HTML::link('#','Staff') }}</p>
    <p>{{ HTML::link('#','Sales') }}</p>
    <p>{{ HTML::link('#','Calendar/Reminders') }}</p>
    <p>{{ HTML::link('#','Shop Inventory') }}</p>
    <p>{{ HTML::link('#','Clubs') }}</p>
    <p>{{ HTML::link('#','Sports') }}</p>
    <p>{{ HTML::link('#','Shopping') }}</p>
    <p>{{ HTML::link('#','Reports') }}</p>
    <p>{{ HTML::link_to_route('user_logout','Logout') }}</p>
</div>
@endsection
