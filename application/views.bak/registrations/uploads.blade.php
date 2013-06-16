@layout('template.layout')

@section('content')

<div class="home">
	<h2>Uploads</h2>
	@include('template.partials.notification')
    <table>
        <tbody>
            <tr>
                <td><p><strong>A - Passport Photo</strong></p></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td>
                    {{ HTML::image(Ais::passport_image() . '?id=' . md5(date('his')),'Passport Photo') }}<br>
                    {{ Form::open_for_files('registrations/upload_photo','POST') }}
                    {{ Form::file('passport_photo') }}<br>
                    {{ Form::submit('Upload') }}<br>
                    {{ $errors->first('passport_photo') }}
                    {{ Form::close() }}
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan="4"><hr></td>
            </tr>
            <tr>
                <td><p><strong>B - Supporting Documents</strong></p></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td>
                    {{ Form::open_for_files('registrations/upload_docs','POST') }}
                    {{ Form::file('supporting_docs') }}<br>
                    {{ Form::submit('Upload') }}<br>
                    {{ $errors->first('supporting_docs') }}
                    {{ Form::close() }}
                </td>
                <td>
                    <p><strong>Documents to Upload</strong></p>
                    <p>Photocopies of the following documents should be scanned and uploaded as supporting documents</p>
                    <ul>
                    	<li>Transfer letter of certificate</li>
                    	<li>Last Two (2) examination results</li>
                    	<li>Birth Certificate</li>
                    </ul>
                </td>
            </tr>
        </tbody>
    </table>
    @if(!empty($docs) && is_array($docs))
        @foreach($docs as $doc)
        <p><strong>{{ $doc }}</strong> - {{ HTML::link('registrations/delete_docs/' . $doc,'Delete') }}</p>
        @endforeach
    @endif
    <p>{{ HTML::link_to_route('user_dashboard','Back') }}</p>
</div>
@endsection