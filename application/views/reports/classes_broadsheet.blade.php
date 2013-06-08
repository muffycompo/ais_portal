@layout('template.layout')

@section('content')

<div class="home">
	<h2>Broadsheet by Class - {{ Expand::academic_session($session_id) }} Academic Session</h2>
	@include('template.partials.notification')
    <table class="ais_table">
        <thead>
            <tr>
                <th>Class</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        @if(! is_null($classes) && is_array($classes) )
          @foreach($classes as $class)
            <tr>
                <td>{{ $class->class_name }}</td>
                <td>
                    {{ HTML::link('reports/broadsheet/' . $session_id . '/' . $term_id . '/' . $class->id,'View Broadsheet') }}
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

    <p>{{ HTML::link_to_route('session_broadsheet','Back') }}</p>
</div>
@endsection