@layout('template.layout')

@section('content')

<div class="home">
	<h2>Profile</h2>
	@include('template.partials.notification')
	@if(!is_null($user))
	<p>
	    {{ HTML::image(Ais::passport_image(),'Passport Photo') }}<br>
        {{ Form::open_for_files('users/upload_photo','POST') }}
        {{ Form::file('passport_photo') }}<br>
        {{ Form::submit('Upload New Photo') }}<br>
        {{ $errors->first('passport_photo') }}
        {{ Form::close() }}<br>
        <small>After Uploading a new profile photo, remember to refresh this page so as to show the new photo.</small>
	</p>
    <p>First Name: <strong>{{ $user->firstname }}</strong></p>
    <p>Surname: <strong>{{ $user->surname }}</strong></p>
    <p>Email Address: <strong>{{ $user->email }}</strong></p>
    <p>Role: <strong>{{ Expand::role($user->role_id) }}</strong></p>
    <p>
        {{ HTML::link('users/edit_profile/' . $user->id,'Edit Profile') . ' | ' . HTML::link_to_route('user_dashboard','Back') }}
    </p>
    @else
    <p>We could not load your profile information...try to {{ HTML::link('users/logout','login') }} again to the portal.</p>
    <p>
        {{ HTML::link_to_route('user_dashboard','Back') }}
    </p>
    @endif
</div>

@endsection

