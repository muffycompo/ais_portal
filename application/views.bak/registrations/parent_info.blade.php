@layout('template.layout')

@section('content')

<div class="home">
	<h2>Parental Information</h2>
	@include('template.partials.notification')
	{{ Form::open('registrations/parent_info','POST') }}
		<p>
			{{ Form::label('father_name',"Father's Name:") }}<br>
			{{ Form::input('text','father_name',(isset($parent->father_name) ? $parent->father_name : Input::old('father_name')),array('id'=>'father_name')) }}
			{{ $errors->first('father_name') }}
		</p>
		<p>
			{{ Form::label('father_occupation',"Father's Occupation:") }}<br>
			{{ Form::input('text','father_occupation',(isset($parent->father_occupation) ? $parent->father_occupation : Input::old('father_occupation')),array('id'=>'father_occupation')) }}
			{{ $errors->first('father_occupation') }}
		</p>
		<p>
			{{ Form::label('father_religion',"Father's Religion:") }}<br>
			{{ Ais::religion_dropdown('father_religion', (isset($parent->father_religion) ? $parent->father_religion : Input::old('father_religion')),array('id'=>'father_religion')) }}
			{{ $errors->first('father_religion') }}
		</p>
		<p>
			{{ Form::label('residential_address','Resdential Address:') }}<br>
			{{ Form::textarea('residential_address',(isset($parent->residential_address) ? $parent->residential_address : Input::old('residential_address')),array('id'=>'residential_address')) }}
			{{ $errors->first('residential_address') }}
		</p>
		<p>
			{{ Form::label('father_phone_no',"Father's Phone No:") }}<br>
			{{ Form::input('text','father_phone_no',(isset($parent->father_phone_no) ? $parent->father_phone_no : Input::old('father_phone_no')),array('id'=>'father_phone_no','maxlength'=>'11')) }}
			{{ $errors->first('father_phone_no') }}
		</p>
		<p>
			{{ Form::label('mother_name',"Mother's Name:") }}<br>
			{{ Form::input('text','mother_name',(isset($parent->mother_name) ? $parent->mother_name : Input::old('mother_name')),array('id'=>'mother_name')) }}
			{{ $errors->first('mother_name') }}
		</p>
		<p>
			{{ Form::label('mother_occupation',"Mother's Occupation:") }}<br>
			{{ Form::input('text','mother_occupation',(isset($parent->mother_occupation) ? $parent->mother_occupation : Input::old('mother_occupation')),array('id'=>'mother_occupation')) }}
			{{ $errors->first('mother_occupation') }}
		</p>
		<p>
			{{ Form::label('mother_religion',"Mother's Religion:") }}<br>
			{{ Ais::religion_dropdown('mother_religion', (isset($parent->father_religion) ? $parent->father_religion : Input::old('mother_religion')),array('id'=>'mother_religion')) }}
			{{ $errors->first('mother_religion') }}
		</p>
		<p>
			{{ Form::label('mother_phone_no',"Mother's Phone No:") }}<br>
			{{ Form::input('text','mother_phone_no',(isset($parent->mother_phone_no) ? $parent->mother_phone_no : Input::old('mother_phone_no')),array('id'=>'mother_phone_no','maxlength'=>'11')) }}
			{{ $errors->first('mother_phone_no') }}
		</p>

		<p>
			{{ Form::submit('Save') }} | {{ HTML::link_to_route('user_dashboard','Cancel') }}
		</p>
		{{ Form::close() }}
</div>
@endsection
