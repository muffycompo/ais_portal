@layout('template.layout')

@section('content')

<div class="home">
	<h2>Classes</h2>
	@include('template.partials.notification')
    <p>{{ HTML::link_to_route('new_class','New Class') }}</p>
    <table class="ais_table">
        <thead>
            <tr>
                <th>Class Title</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        @if(! is_null($classes) && is_array($classes) )
          @foreach($classes as $class)
            <tr>
                <td>{{ $class->class_name }}</td>
                <td>
                    {{ HTML::link('settings/edit_class/' . $class->id,'Edit') }} |
                    {{ HTML::link('settings/delete_class/' . $class->id,'Delete') }}
                </td>
            </tr>
          @endforeach
        @else
            <tr>
                <td colspan="2">No Class has been added yet!</td>
            </tr>
        @endif
        </tbody>
    </table>

    <p>{{ HTML::link_to_route('settings','Back') }}</p>
</div>
@endsection