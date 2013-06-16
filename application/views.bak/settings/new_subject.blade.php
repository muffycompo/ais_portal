@layout('template.layout')

@section('content')

<div class="home">
	<h2>New Subject</h2>
	@include('template.partials.notification')
	{{ Form::open('settings/new_subject','POST') }}
    <p>
      {{ Form::label('subject_title','Subject Title:') }}<br>
      {{ Form::input('text','subject_title',Input::old('subject_title'),array('id'=>'subject_title')) }}
      {{ $errors->first('subject_title') }}
    </p>
    <p>
        {{ Form::submit('Add Subject') }} | {{ HTML::link_to_route('ais_subjects','Cancel') }}
    </p>
    {{ Form::close() }}
</div>
@endsection
