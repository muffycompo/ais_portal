@layout('template.layout')

@section('content')

<div class="home">
	<h2>Signup Complete!</h2>
	@include('template.partials.notification')

    <p>Congratulations! you have successfuly signed up to our portal. A welcome email has been sent to your email address <strong>{{ Session::get('email') }}</strong> and an SMS sent to your Phone number <strong>{{ Session::get('gsm') }}</strong>.</p>
    <p>Follow the instructions in the welcome email to continue with your application process. Also you can login in to the portal by clicking {{ HTML::link_to_route('home','here') }}.</p>
</div>
@endsection
