@layout('template.layout')

@section('content')

<div class="home">
	<h2>Admin Users</h2>
	@include('template.partials.notification')

    <p>{{ HTML::link_to_route('new_user','New User') }}</p>

    <table class="ais_table">
        <thead>
            <tr>
                <th>Email</th>
                <th>First Name</th>
                <th>Surname</th>
                <th>Role</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        @if(! is_null($users) && is_array($users) )
          @foreach($users as $user)
            <tr>
                <td>{{ $user->email }}</td>
                <td>{{ $user->firstname }}</td>
                <td>{{ $user->surname }}</td>
                <td>{{ Expand::role($user->role_id) }}</td>
                <td>
                    {{ HTML::link('users/edit_user/' . $user->id,'Edit') }}
                    @if($user->id != Session::get('user_id'))
                    {{ '| ' . HTML::link('users/delete_user/' . $user->id,'Delete') }}
                    @endif
                </td>
            </tr>
          @endforeach
        @else
            <tr>
                <td colspan="5">No Users found!</td>
            </tr>
        @endif
        </tbody>
    </table>

    <p>{{ HTML::link_to_route('user_dashboard','Back') }}</p>
</div>
@endsection