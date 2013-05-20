@layout('template.layout')

@section('content')

<div class="home">
	<h2>Assessment for {{ $user->firstname . ' ' . $user->surname }}</h2>
	@include('template.partials.notification')
    <p>Subject: <strong>{{ Expand::subject($subject_id) }}</strong></p>
    <p>Class: <strong>{{ Expand::classes($class_id) }}</strong></p>
    <p>Assessments: <strong>{{ $assessments }}</strong></p>
	{{ Form::open('results/new_assessment','POST') }}
    <p>
        {{ Form::label('assessment_type_id','Assessment Type:') }}<br>
        {{ Ais::assessment_type_dropdown('assessment_type_id',Input::old('assessment_type_id'),array('id'=>'assessment_type_id')) }}
    </p>
    <p>
      {{ Form::label('score','Score:') }}<br>
      {{ Form::input('text','score',Input::old('score'),array('id'=>'score')) }}
      {{ $errors->first('score') }}
      {{ Form::hidden('subject_id',$subject_id) }}
      {{ Form::hidden('class_id',$class_id) }}
      {{ Form::hidden('user_id',$user->id) }}
    </p>
    <p>
        {{ Form::submit('Save Result') }} | {{ HTML::link('results/assessment/' . $subject_id . '/' . $class_id,'Back') }}
    </p>
    {{ Form::close() }}
</div>
@endsection
