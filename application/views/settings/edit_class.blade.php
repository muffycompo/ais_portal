@layout('template.layout')

@section('content')

<div class="home">
	<h2>Edit Class</h2>
	@include('template.partials.notification')
	{{ Form::open('settings/edit_class','POST') }}
    <p>
      {{ Form::label('class_name','Class Name:') }}<br>
      {{ Form::input('text','class_name',(isset($classes->class_name))? $classes->class_name : Input::old('class_name'),array('id'=>'class_name')) }}
      {{ $errors->first('class_name') }}
      {{ Form::hidden('class_id', $classes->id) }}
    </p>
    <p>
        {{ Form::submit('Update Class') }} | {{ HTML::link_to_route('ais_classes','Cancel') }}
    </p>
    {{ Form::close() }}
</div>
@endsection
