@layout('template.layout')

@section('content')

<div class="home">
	<h2>Subjects</h2>
	@include('template.partials.notification')
    <p>{{ HTML::link('#','New Subject') }}</p>
    <table class="ais_table">
        <thead>
            <tr>
                <th>Subject Title</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        @if(! is_null($subjects) && is_array($subjects) )
          @foreach($subjects as $subject)
            <tr>
                <td>{{ $subject->subject_name }}</td>
                <td>
                    {{ HTML::link('settings/subject/' . $subject->id . '/edit_subject','Edit') }} |
                    {{ HTML::link('settings/subject/' . $subject->id . '/delete_subject','Delete') }}
                </td>
            </tr>
          @endforeach
        @else
            <tr>
                <td colspan="2">No Subject has been added yet!</td>
            </tr>
        @endif
        </tbody>
    </table>

    <p>{{ HTML::link_to_route('settings','Back') }}</p>
</div>
@endsection