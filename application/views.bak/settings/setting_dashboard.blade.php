@layout('template.layout')

@section('content')

<div class="home">
	<h2>Settings</h2>
	@include('template.partials.notification')

    <p>{{ HTML::link_to_route('teachers','Teachers') }}</p>
    <p>{{ HTML::link_to_route('ais_subjects','Subjects') }}</p>
    <p>{{ HTML::link_to_route('ais_classes','Classes') }}</p>

    <p>{{ HTML::link_to_route('user_dashboard','Back') }}</p>
</div>
@endsection
