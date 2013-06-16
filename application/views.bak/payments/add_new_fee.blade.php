@layout('template.layout')

@section('content')

<div class="home">
	<h2>New Fee</h2>
	@include('template.partials.notification')
	{{ Form::open('payments/add_new_fee','POST') }}
		<p>
			{{ Form::label('payment_category_id','Payment Type:') }}<br>
			{{ Ais::payment_category_dropdown('payment_category_id',Input::old('payment_category_id'),array('id'=>'payment_category_id')) }}
			{{ $errors->first('payment_category_id') }}
		</p>
		<p>
			{{ Form::label('paid_amount','Amount: (N)') }}<br>
			{{ Form::input('text','paid_amount',Input::old('paid_amount'),array('id'=>'paid_amount')) }}
			{{ $errors->first('paid_amount') }}
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
			{{ Form::label('recurring_payment','Recurring Type:') }}<br>
			{{ Ais::recurring_dropdown('recurring_payment',Input::old('recurring_payment'),array('id'=>'recurring_payment')) }}
			{{ $errors->first('recurring_payment') }}
		</p>
		<p>
			{{ Form::submit('Add Fee') }} | {{ HTML::link_to_route('fees_schedule','Cancel') }}
		</p>
		{{ Form::close() }}

</div>
@endsection
