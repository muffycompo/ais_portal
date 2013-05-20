@layout('template.layout')

@section('content')

<div class="home">
	<h2>Edit Fee Payment</h2>
	@include('template.partials.notification')
	{{ Form::open('payments/edit_fee_payment','POST') }}
		<p>
			{{ Form::label('admission_no','Admission No:') }}<br>
			{{ Form::input('text','admission_no',$fee_payment->admission_no,array('id'=>'admission_no')) }}
			{{ $errors->first('admission_no') }}
		</p>
		<p>
			{{ Form::label('paid_amount','Amount:') }}<br>
			{{ Form::input('text','paid_amount',$fee_payment->paid_amount,array('id'=>'paid_amount')) }}
			{{ $errors->first('paid_amount') }}
		</p>
		<p>
			{{ Form::label('teller_no','Teller No:') }}<br>
			{{ Form::input('text','teller_no',$fee_payment->teller_no,array('id'=>'teller_no')) }}
			{{ $errors->first('teller_no') }}
		</p>
		<p>
			{{ Form::label('payment_category_id','Payment Type:') }}<br>
			{{ Ais::payment_category_dropdown('payment_category_id',$fee_payment->payment_category_id,array('id'=>'payment_category_id')) }}
			{{ $errors->first('payment_category_id') }}
		</p>
		<p>
			{{ Form::label('class_id','Class:') }}<br>
			{{ Ais::class_dropdown('class_id',$fee_payment->class_id,array('id'=>'class_id')) }}
			{{ $errors->first('class_id') }}
		</p>
		<p>
			{{ Form::label('term_id','Term:') }}<br>
			{{ Ais::term_dropdown('term_id',$fee_payment->term_id,array('id'=>'term_id')) }}
			{{ $errors->first('term_id') }}
		</p>
		<p>
			{{ Form::label('academic_session_id','Academic Session:') }}<br>
			{{ Ais::academic_session_dropdown('academic_session_id',$fee_payment->academic_session_id,array('id'=>'academic_session_id')) }}
			{{ $errors->first('academic_session_id') }}
			{{ Form::hidden('fee_id',$fee_payment->id) }}
		</p>
		<p>
			{{ Form::submit('Update Payment') }} | {{ HTML::link_to_route('fee_payments','Cancel') }}
		</p>
		{{ Form::close() }}

</div>
@endsection
