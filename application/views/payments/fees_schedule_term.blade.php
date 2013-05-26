@layout('template.layout')

@section('content')

<div class="home">
	<h2>Fees Schedule by Class - {{ Expand::term_name($term_id) }}</h2>
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
                    {{ HTML::link('payments/class_fee_schedule/' . $term_id . '/' . $class->id,'View Fee Schedule') }}
                </td>
            </tr>
          @endforeach
        @else
            <tr>
                <td colspan="2">No Fees Schedule for this Class!</td>
            </tr>
        @endif
        </tbody>
    </table>

    <p>{{ HTML::link_to_route('fees_schedule','Back') }}</p>
</div>
@endsection