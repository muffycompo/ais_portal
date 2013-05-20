@layout('template.layout')

                   @section('content')

<div class="home">
	<h2>Schools Attended</h2>
	@include('template.partials.notification')

    <p>{{ HTML::link_to_route('new_school','New School Attended') }}</p>

    <table class="ais_table">
        <thead>
            <tr>
                <th>Name of School</th>
                <th colspan="2">Class</th>
                <th colspan="2">Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        @if(! is_null($schools) && is_array($schools) )
          @foreach($schools as $school)
            <tr>
                <td>{{ $school->school_name }}</td>
                <td>{{ $school->class_from_id }}</td>
                <td>{{ $school->class_to_id }}</td>
                <td>{{ $school->year_from }}</td>
                <td>{{ $school->year_to }}</td>
                <td>
                    {{ HTML::link('registrations/edit_school/' . $school->id,'Edit') }} |
                    {{ HTML::link('registrations/delete_school/' . $school->id,'Delete') }}
                </td>
            </tr>
          @endforeach
        @else
            <tr>
                <td colspan="6">No Schools found!</td>
            </tr>
        @endif
        </tbody>
    </table>

    <p>{{ HTML::link_to_route('user_dashboard','Back') }}</p>
</div>
@endsection