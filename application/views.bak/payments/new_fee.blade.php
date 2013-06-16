@layout('template.layout')

@section('content')

<div class="home">
	<h2>New Fee Payment</h2>
	@include('template.partials.notification')
	{{ Form::open('payments/new_fee','POST') }}
		<p>
			{{ Form::label('admission_no','Admission No:') }}<br>
			{{ Form::input('text','admission_no',Input::old('admission_no'),array('id'=>'admission_no')) }}
			{{ $errors->first('admission_no') }}
		</p>
		<p>
			{{ Form::label('paid_amount','Amount:') }}<br>
			{{ Form::input('text','paid_amount',Input::old('paid_amount'),array('id'=>'paid_amount')) }}
			{{ $errors->first('paid_amount') }}
		</p>
		<p>
			{{ Form::label('teller_no','Teller No:') }}<br>
			{{ Form::input('text','teller_no',Input::old('teller_no'),array('id'=>'teller_no')) }}
			{{ $errors->first('teller_no') }}
		</p>
		<p>
			{{ Form::label('payment_category_id','Payment Type:') }}<br>
			{{ Ais::payment_category_dropdown('payment_category_id',Input::old('payment_category_id'),array('id'=>'payment_category_id')) }}
			{{ $errors->first('payment_category_id') }}
		</p>
		<p>
			{{ Form::label('class_id','Class:') }}<br>
			{{ Ais::class_dropdown('class_id',Input::old('class_id'),array('id'=>'class_id')) }}
			{{ $errors->first('class_id') }}
		</p>
		<p>
			{{ Form::label('term_id','Term:') }}<br>
			{{ Ais::term_dropdown('term_id',Input::old('term_id'),array('id'=>'term_id')) }}
			{{ $errors->first('term_id') }}
		</p>
		<p>
			{{ Form::label('academic_session_id','Academic Session:') }}<br>
			{{ Ais::academic_session_dropdown('academic_session_id',Ais::active_academic_session(),array('id'=>'academic_session_id')) }}
			{{ $errors->first('academic_session_id') }}
		</p>
		<p>
			{{ Form::submit('Add Payment') }} | {{ HTML::link_to_route('pin_payments','Cancel') }}
		</p>
		{{ Form::close() }}

</div>
@endsection
