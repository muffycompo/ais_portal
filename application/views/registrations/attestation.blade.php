@layout('template.layout')

@section('content')

<div class="home">
	<h2>Attestation</h2>
	@include('template.partials.notification')
    <p>I <strong>{{ Session::get('firstname') . ' ' . Session::get('surname') }}</strong> have provided valid information to the best of my knowledge and abilities.</p>
    <p>By Checking the tick box below <strong>("Complete Application")</strong>, I <strong>AGREE</strong> to finalize my application to AR-Rahman International School.</p>
    {{ Form::open('registrations/finalize_application','POST') }}
    <p>
        {{ Form::checkbox('finalize_registration',1, false, array('id'=>'finalize_registration')) }}&nbsp;&nbsp;{{ Form::label('finalize_registration','Complete Application') }}<br>
        {{ $errors->first('finalize_registration') }}
    </p>
    <p>
        {{ Form::submit('Finalize Application') }} | {{ HTML::link_to_route('user_dashboard','Cancel') }}
    </p>
    {{ Form::close() }}
</div>
@endsection
