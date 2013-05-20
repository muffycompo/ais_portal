@layout('template.layout')

@section('content')

<div class="home">
	<h2>Edit PIN Payment</h2>
	@include('template.partials.notification')
	{{ Form::open('payments/edit_pin_payment','POST') }}
		<p>
			{{ Form::label('firstname','First Name:') }}<br>
			{{ Form::input('text','firstname',$pin_payment->applicant_firstname,array('id'=>'firstname')) }}
			{{ $errors->first('firstname') }}
		</p>
		<p>
			{{ Form::label('surname','Surname:') }}<br>
			{{ Form::input('text','surname',$pin_payment->applicant_surname,array('id'=>'surname')) }}
			{{ $errors->first('surname') }}
		</p>
		<p>
			{{ Form::label('amount','Amount:') }}<br>
			{{ Form::input('text','amount',$pin_payment->amount,array('id'=>'amount')) }}
			{{ $errors->first('amount') }}
			{{ Form::hidden('payment_id',$pin_payment->id) }}
		</p>
		<p>
			{{ Form::submit('Update Payment') }} | {{ HTML::link_to_route('pin_payments','Cancel') }}
		</p>
		{{ Form::close() }}
</div>
@endsection
