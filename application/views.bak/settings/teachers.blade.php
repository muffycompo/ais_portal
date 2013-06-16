@layout('template.layout')

                   @section('content')

<div class="home">
	<h2>Teachers</h2>
	@include('template.partials.notification')

    <table class="ais_table">
        <thead>
            <tr>
                <th>First Name</th>
                <th>Surname</th>
                <th>Email</th>
                <th>Assigned Subjects</th>
                <th>Assigned Class</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        @if(! is_null($teachers) && is_array($teachers) )
          @foreach($teachers as $teacher)
            <tr>
                <td>{{ $teacher->firstname }}</td>
                <td>{{ $teacher->surname }}</td>
                <td>{{ $teacher->email }}</td>
                <td>{{ Ais::assigned_teacher_subjects($teacher->id) }}</td>
                <td>{{ Ais::assigned_teacher_class($teacher->id) }}</td>
                <td>
                    {{ HTML::link('settings/teacher/' . $teacher->id . '/assign_subject','Assign to Subject') }} |
                    {{ HTML::link('settings/teacher/' . $teacher->id . '/assign_class','Assign to Class') }}
                </td>
            </tr>
          @endforeach
        @else
            <tr>
                <td colspan="4">No Teacher has been added yet!</td>
            </tr>
        @endif
        </tbody>
    </table>

    <p>{{ HTML::link_to_route('settings','Back') }}</p>
</div>
@endsection