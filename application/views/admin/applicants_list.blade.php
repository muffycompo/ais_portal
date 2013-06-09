@layout('template.layout')

@section('content')

<div class="home">
	<h2>Applicants List</h2>
	@include('template.partials.notification')
	@if(! is_null($applicants) && is_array($applicants))
    <p>{{ HTML::link('admin/export_csv_list/1','Download List (CSV)') }}</p>
    @endif
    <table class="ais_table">
        <thead>
            <tr>
                <th>Form No</th>
                <th>Surname</th>
                <th>First Name</th>
                <th>Other Names</th>
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
                <td>{{ $applicant->surname }}</td>
                <td>{{ $applicant->firstname }}</td>
                <td>{{ $applicant->othernames }}</td>
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
                <td colspan="8">No Applicants found!</td>
            </tr>
        @endif
        </tbody>
    </table>

    <p>{{ HTML::link_to_route('admissions','Back') }}</p>
</div>
@endsection