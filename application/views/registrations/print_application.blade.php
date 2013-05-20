@layout('template.layout')

@section('content')

<div class="home">
    <table class="ais_table">
        <tbody>
            <tr>
                <td>Passport Photograph</td>
                <td>{{ HTML::image(Ais::passport_image(),'Passport Photo') }}</td>
            </tr>
            <tr>
                <td>Application Type</td>
                <td><strong>{{ Expand::application_type($biodata->application_type_id) }}</strong></td>
            </tr>
            <tr>
                <td>First Name</td>
                <td><strong>{{ $user->firstname }}</strong></td>
            </tr>
            <tr>
                <td>Surname</td>
                <td><strong>{{ $user->surname }}</strong></td>
            </tr>
            <tr>
                <td>Age</td>
                <td><strong>{{ $biodata->age }} years</strong></td>
            </tr>
            <tr>
                <td>Date of Birth</td>
                <td><strong>{{ Ais::reverse_db_date($biodata->date_of_birth) }}</strong></td>
            </tr>
            <tr>
                <td>Sex</td>
                <td><strong>{{ Expand::gender($biodata->gender_id) }}</strong></td>
            </tr>
            <tr>
                <td>State of Origin</td>
                <td><strong>{{ Expand::state($biodata->state_id) }}</strong></td>
            </tr>
            <tr>
                <td>Nationality</td>
                <td><strong>{{ Expand::nationality($biodata->nationality_id) }}</strong></td>
            </tr>
            <tr>
                <td>Tribe</td>
                <td><strong>{{ $biodata->tribe }}</strong></td>
            </tr>
            <tr>
                <td>Last Class</td>
                <td><strong>{{ expand::classes($biodata->last_class_id) }}</strong></td>
            </tr>
            <tr>
                <td>Class Seeking admission into</td>
                <td><strong>{{ expand::classes($biodata->csai_id) }}</strong></td>
            </tr>
        </tbody>
    </table>


	<h3>Schools Attended</h3>
    <table class="ais_table">
        <thead>
            <tr>
                <th>Name of School</th>
                <th>Class (From)</th>
                <th>Class (To)</th>
                <th>Date (From)</th>
                <th>Date (To)</th>
            </tr>
        </thead>
        <tbody>
        @if(! is_null($schools) && is_array($schools) )
          @foreach($schools as $school)
            <tr>
                <td>{{ $school->school_name }}</td>
                <td>{{ expand::classes($school->class_from_id) }}</td>
                <td>{{ expand::classes($school->class_to_id) }}</td>
                <td>{{ $school->year_from }}</td>
                <td>{{ $school->year_to }}</td>
            </tr>
          @endforeach
        @else
            <tr>
                <td colspan="6">No Schools found!</td>
            </tr>
        @endif
        </tbody>
    </table>

    <h3>Parental Information</h3>
    <table class="ais_table">
        <tbody>
            <tr>
                <td>Father&apos;s Name</td>
                <td><strong>{{ $parent_info->father_name }}</strong></td>
            </tr>
            <tr>
                <td>Occupation</td>
                <td><strong>{{ $parent_info->father_occupation }}</strong></td>
            </tr>
            <tr>
                <td>Religion</td>
                <td><strong>{{ $parent_info->father_religion }}</strong></td>
            </tr>
            <tr>
                <td>Residential Address</td>
                <td><strong>{{ $parent_info->residential_address }}</strong></td>
            </tr>
            <tr>
                <td>Phone Number</td>
                <td><strong>{{ $parent_info->father_phone_no }}</strong></td>
            </tr>
            <tr>
                <td>Mother&apos;s Name</td>
                <td><strong>{{ $parent_info->mother_name }}</strong></td>
            </tr>
            <tr>
                <td>Occupation</td>
                <td><strong>{{ $parent_info->mother_occupation }}</strong></td>
            </tr>
            <tr>
                <td>Religion</td>
                <td><strong>{{ $parent_info->mother_religion }}</strong></td>
            </tr>
            <tr>
                <td>Phone Number</td>
                <td><strong>{{ $parent_info->mother_phone_no }}</strong></td>
            </tr>
        </tbody>
    </table>

    <h3>Medical Record</h3>
    <table class="ais_table">
        <tbody>
            <tr>
                <td>Hospital Name</td>
                <td><strong>{{ $medical->hospital_name }}</strong></td>
            </tr>
            <tr>
                <td>Hospital Address</td>
                <td><strong>{{ $medical->hospital_address }}</strong></td>
            </tr>
            <tr>
                <td>Name of Family Doctor</td>
                <td><strong>{{ $medical->doctor_name }}</strong></td>
            </tr>
            <tr>
                <td>Phone Number</td>
                <td><strong>{{ $medical->doctor_phone_no }}</strong></td>
            </tr>
            <tr>
                <td>Child File Number</td>
                <td><strong>{{ $medical->child_file_no }}</strong></td>
            </tr>
            <tr>
                <td>Blood Group</td>
                <td><strong>{{ $medical->blood_group }}</strong></td>
            </tr>
            <tr>
                <td>Genotype</td>
                <td><strong>{{ $medical->genotype }}</strong></td>
            </tr>
            <tr>
                <td>Allergic Reaction?</td>
                <td><strong>{{ $medical->allergic_reaction }}</strong></td>
            </tr>
            <tr>
                <td>Indicate if any Allergic Reaction</td>
                <td><strong>{{ $medical->allergic_details }}</strong></td>
            </tr>
            <tr>
                <td>Does your child have any mental or physical disability?</td>
                <td><strong>{{ $medical->disability }}</strong></td>
            </tr>
            <tr>
                <td>Specify if any</td>
                <td><strong>{{ $medical->disability_details }}</strong></td>
            </tr>
        </tbody>
    </table>

</div>
@endsection

