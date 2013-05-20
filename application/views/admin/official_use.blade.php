@layout('template.layout')

@section('content')

<div class="home">
	<h2>Official Use Only</h2>
	@include('template.partials.notification')
	<p>Processing Admission for <strong>{{ $user->firstname . ' ' . $user->surname }}</strong></p>
	{{ Form::open('admin/official_use','POST') }}
	    <h3>Examination Scores</h3>
		<p>
			{{ Form::label('mathematics','Mathematics:') }}<br>
			{{ Form::input('text','mathematics',Input::old('mathematics'),array('id'=>'mathematics')) }}
			{{ $errors->first('mathematics') }}
		</p>
		<p>
			{{ Form::label('english','English Language:') }}<br>
			{{ Form::input('text','english',Input::old('english'),array('id'=>'english')) }}
			{{ $errors->first('english') }}
		</p>
		<p>
			{{ Form::label('science','Science:') }}<br>
			{{ Form::input('text','science',Input::old('science'),array('id'=>'science')) }}
			{{ $errors->first('science') }}
		</p>
		<p>
			{{ Form::label('social_science','Social Science:') }}<br>
			{{ Form::input('text','social_science',Input::old('social_science'),array('id'=>'social_science')) }}
			{{ $errors->first('social_science') }}
		</p>
		<p>
			{{ Form::label('quran','Quran:') }}<br>
			{{ Form::input('text','quran',Input::old('quran'),array('id'=>'quran')) }}
			{{ $errors->first('quran') }}
		</p>
		<p>
			{{ Form::label('arabic','Arabic:') }}<br>
			{{ Form::input('text','arabic',Input::old('arabic'),array('id'=>'arabic')) }}
			{{ $errors->first('arabic') }}
		</p>

		<h3>Admission Recommendation</h3>

		<p>
			{{ Form::label('last_class','Last Class:') }}<br>
			{{ Ais::class_dropdown('last_class',Input::old('last_class'),array('id'=>'last_class')) }}
			{{ $errors->first('last_class') }}
		</p>
		<p>
			{{ Form::label('present_class','Present Class:') }}<br>
			{{ Ais::class_dropdown('present_class',Input::old('present_class'),array('id'=>'present_class')) }}
			{{ $errors->first('present_class') }}
		</p>
		<p>
			{{ Form::label('admission_recommendation_id','Recommendation:') }}<br>
			{{ Ais::admission_recommendation_dropdown('admission_recommendation_id',Input::old('admission_recommendation_id'),array('id'=>'admission_recommendation_id')) }}
			{{ $errors->first('admission_recommendation_id') }}
		</p>
		<p>
			{{ Form::label('class_admitted_into','Class admitted into:') }}<br>
			{{ Ais::class_dropdown('class_admitted_into',Input::old('class_admitted_into'),array('id'=>'class_admitted_into')) }}
			{{ $errors->first('class_admitted_into') }}
			{{ Form::hidden('user_id',$user->id) }}
		</p>
		<p>
			{{ Form::submit('Process') }} | {{ HTML::link_to_route('applicants_list','Cancel') }}
		</p>
		{{ Form::close() }}
</div>
@endsection

