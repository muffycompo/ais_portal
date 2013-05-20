@layout('template.layout')

@section('content')

<div class="home">
	<h2>Password Reset Complete!</h2>
	@include('template.partials.notification')

    <p>Your new password has been sent to your email address: <strong>{{ Session::has('email') ? Str::lower(Session::get('email')) : '' }}</strong></p>
    <p><strong>Note:</strong> You are required to change the password IMMEDIATELY to something you can remember by editing your profile.</p>
    <p>Click {{ HTML::link_to_route('home','here') }} to login</p>
</div>
@endsection
