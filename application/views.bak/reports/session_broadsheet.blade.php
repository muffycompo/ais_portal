@layout('template.layout')

@section('content')

<div class="home">
	<h2>Broadsheet Reports - Academic Session</h2>
	@include('template.partials.notification')
    <table class="ais_table">
        <thead>
            <tr>
                <th>Academic Session</th>
                <th>Terms</th>
            </tr>
        </thead>
        <tbody>
        @if(! is_null($sessions) && is_array($sessions) )
          @foreach($sessions as $session)
            <tr>
                <td>
                @if($session->active_session == 1)
                    <strong>{{ $session->academic_session }}</strong>
                 @else
                    {{ $session->academic_session }}
                 @endif
                 </td>
                <td>
                    {{ HTML::link('reports/broadsheet/' . $session->id . '/1','1st Term') }} |
                    {{ HTML::link('reports/broadsheet/' . $session->id . '/2','2nd Term') }} |
                    {{ HTML::link('reports/broadsheet/' . $session->id . '/3','3rd Term') }}
                </td>
            </tr>
          @endforeach
        @else
            <tr>
                <td colspan="2">Academic Session has not been added!</td>
            </tr>
        @endif
        </tbody>
    </table>

    <p>{{ HTML::link_to_route('reports','Back') }}</p>
</div>
@endsection