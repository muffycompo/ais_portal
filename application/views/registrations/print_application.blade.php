<!DOCTYPE html>

<head>
	<title>Application Form</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    {{ HTML::style('webassets/receipts/css/receipt_style.css') }}
    {{ HTML::style('webassets/receipts/css/print.css',array('media'=>'print')) }}
</head>

<body>

	<div id="page-wrap">
		<div id="identity">
            <div id="logo">
              {{ HTML::image('webassets/receipts/images/logo.png','Logo') }}
            </div>

		</div>

		<div style="clear:both"></div>
		<hr />
		<div id="customer">
            <table id="passport_meta">
                <tr>
                    <td><div class="ta">{{ HTML::image(Ais::passport_image($user->id),'Passport Photo') }}</div></td>
                </tr>
            </table>

		</div>

		<table id="items">

		  <tr>
		      <th colspan="5">BIO DATA</th>
		  </tr>

		  <tr>
		      <td colspan="5">&nbsp;</td>
		  </tr>

		  <tr class="item-row">
		      <td class="item-name">Form Number:</td>
		      <td class="description"><strong>{{ $biodata->form_no }}</strong></td>
		      <td class="item-name">Application Type</td>
		      <td class="description" colspan="2" nowrap><strong>{{ Expand::application_type($biodata->application_type_id) }}</strong></td>
		  </tr>

		  <tr class="item-row">
		      <td class="item-name">First Name:</td>
		      <td class="description"><strong>{{ $user->firstname }}</strong></td>
		      <td class="item-name">Surname</td>
		      <td class="description" colspan="2" nowrap><strong>{{ $user->surname }}</strong></td>
		  </tr>

		  <tr class="item-row">
		      <td class="item-name">Other Names:</td>
		      <td class="description"><strong>{{ $biodata->othernames }}</strong></td>
		      <td class="item-name">Age</td>
		      <td class="description" colspan="2" nowrap><strong>{{ $biodata->age }}</strong></td>
		  </tr>

		  <tr class="item-row">
		      <td class="item-name">Date of Birth:</td>
		      <td class="description"><strong>{{ Ais::reverse_db_date($biodata->date_of_birth) }}</strong></td>
		      <td class="item-name">Sex:</td>
		      <td class="description" colspan="2" nowrap><strong>{{ Expand::gender($biodata->gender_id) }}</strong></td>
		  </tr>

		  <tr class="item-row">
		      <td class="item-name">State of Origin:</td>
		      <td class="description"><strong>{{ Expand::state($biodata->state_id) }}</strong></td>
		      <td class="item-name">Nationality:</td>
		      <td class="description" colspan="2" nowrap><strong>{{ Expand::nationality($biodata->nationality_id) }}</strong></td>
		  </tr>

		  <tr class="item-row">
		      <td class="item-name">Tribe:</td>
		      <td class="description"><strong>{{ $biodata->tribe }}</strong></td>
		      <td class="item-name">Last Class:</td>
		      <td class="description" colspan="2" nowrap><strong>{{ Expand::classes($biodata->last_class_id) }}</strong></td>
		  </tr>

		  <tr class="item-row">
		      <td class="item-name">Class Applied for:</td>
		      <td class="description" colspan="4"><strong>{{ Expand::classes($biodata->csai_id) }}</strong></td>
		  </tr>

          <tr>
		      <th colspan="5">SCHOOLS ATTENDED</th>
		  </tr>
		  <tr>
		      <td colspan="5">&nbsp;</td>
		  </tr>
          <tr class="item-row">
            <th>Name of School</th>
            <th>Class (From)</th>
            <th>Class (To)</th>
            <th>Date (From)</th>
            <th>Date (To)</th>
          </tr>
        @if(! is_null($schools) && is_array($schools) )
          @foreach($schools as $school)
            <tr class="item-row">
                <td>{{ $school->school_name }}</td>
                <td>{{ expand::classes($school->class_from_id) }}</td>
                <td>{{ expand::classes($school->class_to_id) }}</td>
                <td>{{ $school->year_from }}</td>
                <td>{{ $school->year_to }}</td>
            </tr>
          @endforeach
        @endif

          <tr>
		      <th colspan="5">PARENTAL INFORMATION</th>
		  </tr>
		  <tr>
		      <td colspan="5">&nbsp;</td>
		  </tr>

		  <tr class="item-row">
		      <td class="item-name">Father&apos;s Full Name:</td>
		      <td class="description"><strong>{{ $parent_info->father_name }}</strong></td>
		      <td class="item-name">Occupation:</td>
		      <td class="description" colspan="2" nowrap><strong>{{ $parent_info->father_occupation }}</strong></td>
		  </tr>

		  <tr class="item-row">
		      <td class="item-name">Religion:</td>
		      <td class="description"><strong>{{ Expand::religion($parent_info->father_religion) }}</strong></td>
		      <td class="item-name">Phone Number:</td>
		      <td class="description" colspan="2" nowrap><strong>{{ $parent_info->father_phone_no }}</strong></td>
		  </tr>

		  <tr class="item-row">
		      <td class="item-name">Residential Address:</td>
		      <td class="description" colspan="4"><strong>{{ $parent_info->residential_address }}</strong></td>
		  </tr>

		  <tr class="item-row">
		      <td class="item-name">Mother&apos;s Full Name:</td>
		      <td class="description"><strong>{{ $parent_info->mother_name }}</strong></td>
		      <td class="item-name">Occupation:</td>
		      <td class="description" colspan="2" nowrap><strong>{{ $parent_info->mother_occupation }}</strong></td>
		  </tr>

		  <tr class="item-row">
		      <td class="item-name">Religion:</td>
		      <td class="description"><strong>{{ Expand::religion($parent_info->mother_religion) }}</strong></td>
		      <td class="item-name">Phone Number:</td>
		      <td class="description" colspan="2" nowrap><strong>{{ $parent_info->mother_phone_no }}</strong></td>
		  </tr>

          <tr>
		      <th colspan="5">MEDICAL RECORD</th>
		  </tr>
		  <tr>
		      <td colspan="5">&nbsp;</td>
		  </tr>

		  <tr class="item-row">
		      <td class="item-name">Hospital Name:</td>
		      <td class="description" colspan="4"><strong>{{ $medical->hospital_name }}</strong></td>
		  </tr>

		  <tr class="item-row">
		      <td class="item-name">Hospital Address:</td>
		      <td class="description" colspan="4"><strong>{{ $medical->hospital_address }}</strong></td>
		  </tr>

		  <tr class="item-row">
		      <td class="item-name">Name of Family Doctor:</td>
		      <td class="description"><strong>{{ $medical->doctor_name }}</strong></td>
		      <td class="item-name">Phone Number:</td>
		      <td class="description" colspan="2" nowrap><strong>{{ $medical->doctor_phone_no }}</strong></td>
		  </tr>

		  <tr class="item-row">
		      <td class="item-name">Child File Number:</td>
		      <td class="description"><strong>{{ $medical->child_file_no }}</strong></td>
		      <td class="item-name">Blood Group:</td>
		      <td class="description" colspan="2" nowrap><strong>{{ $medical->blood_group }}</strong></td>
		  </tr>

		  <tr class="item-row">
		      <td class="item-name">Genotype:</td>
		      <td class="description"><strong>{{ $medical->genotype }}</strong></td>
		      <td class="item-name">Allergic Reaction?:</td>
		      <td class="description" colspan="2" nowrap><strong>{{ $medical->allergic_reaction }}</strong></td>
		  </tr>

		  <tr class="item-row">
		      <td class="item-name">Indicate if any Allergic Reaction:</td>
		      <td class="description" colspan="4"><strong>{{ !empty($medical->allergic_details)? $medical->allergic_details : 'N/A' }}</strong></td>
		  </tr>

		  <tr class="item-row">
		      <td class="item-name">Does your child have any mental or physical disability?:</td>
		      <td class="description"><strong>{{ $medical->disability }}</strong></td>
		      <td class="item-name">Specify Any:</td>
		      <td class="description" colspan="2" nowrap><strong>{{ !empty($medical->disability_details)? $medical->disability_details : 'N/A' }}</strong></td>
		  </tr>


	</div>

</body>

</html>
