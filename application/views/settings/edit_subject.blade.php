@layout('template.layout')

@section('content')

<div class="home">
	<h2>Edit Subject</h2>
	@include('template.partials.notification')
	{{ Form::open('settings/edit_subject','POST') }}
    <p>
      {{ Form::label('subject_title','Class Name:') }}<br>
      {{ Form::input('text','subject_title',(isset($subject->subject_title))? $subject->subject_title : Input::old('subject_title'),array('id'=>'subject_title')) }}
      {{ $errors->first('subject_title') }}
      {{ Form::hidden('subject_id', $subject->id) }}
    </p>
    <p>
        {{ Form::submit('Update Subject') }} | {{ HTML::link_to_route('ais_subjects','Cancel') }}
    </p>
    {{ Form::close() }}
</div>
@endsection
