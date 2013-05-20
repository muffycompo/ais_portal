@layout('template.layout')

@section('content')

<div class="home">
	<h2>Admissions List</h2>
	@include('template.partials.notification')
    <p>{{ HTML::link('#','Download List (CSV)') }}</p>
    <table class="ais_table">
        <thead>
            <tr>
                <th>Admission No</th>
                <th>First Name</th>
                <th>Surname</th>
                <th>Class Admitted into</th>
                <th>Recommendation</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        @if(! is_null($admissions) && is_array($admissions) )
          @foreach($admissions as $admission)
            <tr>
                <td>{{ $admission->admission_no }}</td>
                <td>{{ $admission->firstname }}</td>
                <td>{{ $admission->surname }}</td>
                <td>{{ Expand::classes($admission->aic_id) }}</td>
                <td>{{ Expand::admission_recommendation($admission->admission_recommendation_id) }}</td>
                <td>
                    {{ HTML::link('admin/approve_admission/' . $admission->id,'Approve &amp; Notify') }}
                </td>
            </tr>
          @endforeach
        @else
            <tr>
                <td colspan="7">Admissions Lists is empty!</td>
            </tr>
        @endif
        </tbody>
    </table>

    <p>{{ HTML::link_to_route('admissions','Back') }}</p>
</div>
@endsection