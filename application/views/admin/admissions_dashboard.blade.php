@layout('template.layout')

@section('content')

<div class="home">
	<h2>Admissions Processing</h2>
	@include('template.partials.notification')
    <p>{{ HTML::link_to_route('applicants_list','Applicants List') }}</p>
    <p>{{ HTML::link_to_route('admissions_list','Admissions List') }}</p>
    <p>{{ HTML::link_to_route('user_dashboard','Back') }}</p>
</div>
@endsection
