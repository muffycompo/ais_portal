@layout('template.layout')

@section('content')

<div class="home">
	<h2>New Class</h2>
	@include('template.partials.notification')
	{{ Form::open('settings/new_class','POST') }}
    <p>
      {{ Form::label('class_name','Class Name:') }}<br>
      {{ Form::input('text','class_name',Input::old('class_name'),array('id'=>'class_name')) }}
      {{ $errors->first('class_name') }}
    </p>
    <p>
        {{ Form::submit('Add Class') }} | {{ HTML::link_to_route('ais_classes','Cancel') }}
    </p>
    {{ Form::close() }}
</div>
@endsection
