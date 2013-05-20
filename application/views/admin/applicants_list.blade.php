@layout('template.layout')

@section('content')

<div class="home">
	<h2>Applicants List</h2>
	@include('template.partials.notification')
    <p>{{ HTML::link('#','Download List (CSV)') }}</p>
    <table class="ais_table">
        <thead>
            <tr>
                <th>Form No</th>
                <th>First Name</th>
                <th>Surname</th>
                <th>Email</th>
                <th>Age</th>
                <th>Application Type</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        @if(! is_null($applicants) && is_array($applicants) )
          @foreach($applicants as $applicant)
            <tr>
                <td>{{ $applicant->form_no }}</td>
                <td>{{ $applicant->firstname }}</td>
                <td>{{ $applicant->surname }}</td>
                <td>{{ $applicant->email }}</td>
                <td>{{ $applicant->age }}</td>
                <td>{{ Expand::application_type($applicant->application_type_id) }}</td>
                <td>
                    {{ HTML::link('admin/official_use/' . $applicant->id,'Process Admission') }}
                </td>
            </tr>
          @endforeach
        @else
            <tr>
                <td colspan="7">No Applicants found!</td>
            </tr>
        @endif
        </tbody>
    </table>

    <p>{{ HTML::link_to_route('admissions','Back') }}</p>
</div>
@endsection