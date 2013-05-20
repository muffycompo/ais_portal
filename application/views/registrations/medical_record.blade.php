@layout('template.layout')

@section('content')

<div class="home">
	<h2>Medical Record</h2>
	@include('template.partials.notification')
	{{ Form::open('registrations/medical_record','POST') }}
		<p>
			{{ Form::label('hospital_name',"Hospital Name:") }}<br>
			{{ Form::input('text','hospital_name',(isset($medical->hospital_name) ? $medical->hospital_name : Input::old('hospital_name')),array('id'=>'hospital_name')) }}
			{{ $errors->first('hospital_name') }}
		</p>
		<p>
			{{ Form::label('hospital_address',"Hospital Address:") }}<br>
			{{ Form::textarea('hospital_address',(isset($medical->hospital_address) ? $medical->hospital_address : Input::old('hospital_address')),array('id'=>'hospital_address')) }}
			{{ $errors->first('hospital_address') }}
		</p>
		<p>
			{{ Form::label('doctor_name',"Doctor's Name:") }}<br>
			{{ Form::input('text','doctor_name',(isset($medical->doctor_name) ? $medical->doctor_name : Input::old('doctor_name')),array('id'=>'doctor_name')) }}
			{{ $errors->first('doctor_name') }}
		</p>
		<p>
			{{ Form::label('doctor_phone_no',"Doctor's Phone No:") }}<br>
			{{ Form::input('text','doctor_phone_no',(isset($medical->doctor_phone_no) ? $medical->doctor_phone_no : Input::old('doctor_phone_no')),array('id'=>'doctor_phone_no')) }}
			{{ $errors->first('doctor_phone_no') }}
		</p>
		<p>
			{{ Form::label('child_file_no',"Child File No:") }}<br>
			{{ Form::input('text','child_file_no',(isset($medical->child_file_no) ? $medical->child_file_no : Input::old('child_file_no')),array('id'=>'child_file_no')) }}
			{{ $errors->first('child_file_no') }}
		</p>
		<p>
			{{ Form::label('blood_group',"Blood Group:") }}<br>
			{{ Form::input('text','blood_group',(isset($medical->blood_group) ? $medical->blood_group : Input::old('blood_group')),array('id'=>'blood_group')) }}
			{{ $errors->first('blood_group') }}
		</p>
		<p>
			{{ Form::label('genotype',"Genotype:") }}<br>
			{{ Form::input('text','genotype',(isset($medical->genotype) ? $medical->genotype : Input::old('genotype')),array('id'=>'genotype')) }}
			{{ $errors->first('genotype') }}
		</p>
		<p>
			{{ Form::label('allergic_reaction',"Allergic Reaction?:") }}<br>
			{{ Form::input('text','allergic_reaction',(isset($medical->allergic_reaction) ? $medical->allergic_reaction : Input::old('allergic_reaction')),array('id'=>'allergic_reaction')) }}
			{{ $errors->first('allergic_reaction') }}
		</p>
		<p>
			{{ Form::label('allergic_details',"Indicate any Allergic Reaction:") }}<br>
			{{ Form::textarea('allergic_details',(isset($medical->allergic_details) ? $medical->allergic_details : Input::old('allergic_details')),array('id'=>'allergic_details')) }}
			{{ $errors->first('allergic_details') }}
		</p>
		<p>
			{{ Form::label('disability',"Does your child have any mental or physical disability?:") }}<br>
			{{ Form::input('text','disability',(isset($medical->disability) ? $medical->disability : Input::old('disability')),array('id'=>'disability')) }}
			{{ $errors->first('disability') }}
		</p>
		<p>
			{{ Form::label('disability_details',"Specify any disability:") }}<br>
			{{ Form::textarea('disability_details',(isset($medical->disability_details) ? $medical->disability_details : Input::old('disability_details')),array('id'=>'disability_details')) }}
			{{ $errors->first('disability_details') }}
		</p>
		<p>
			{{ Form::submit('Save') }} | {{ HTML::link_to_route('user_dashboard','Cancel') }}
		</p>
		{{ Form::close() }}
</div>
@endsection
