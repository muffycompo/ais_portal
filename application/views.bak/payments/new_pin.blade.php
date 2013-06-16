@layout('template.layout')

@section('content')

<div class="home">
	<h2>New PIN Payment</h2>
	@include('template.partials.notification')
	{{ Form::open('payments/new_pin','POST') }}
		<p>
			{{ Form::label('firstname','First Name:') }}<br>
			{{ Form::input('text','firstname',Input::old('firstname'),array('id'=>'firstname')) }}
			{{ $errors->first('firstname') }}
		</p>
		<p>
			{{ Form::label('surname','Surname:') }}<br>
			{{ Form::input('text','surname',Input::old('surname'),array('id'=>'surname')) }}
			{{ $errors->first('surname') }}
		</p>
		<p>
			{{ Form::label('amount','Amount:') }}<br>
			{{ Form::input('text','amount',Input::old('amount'),array('id'=>'amount')) }}
			{{ $errors->first('amount') }}
		</p>
		<p>
			{{ Form::submit('Add Payment') }} | {{ HTML::link_to_route('pin_payments','Cancel') }}
		</p>
		{{ Form::close() }}
</div>
@endsection
