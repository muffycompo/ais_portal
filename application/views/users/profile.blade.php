@layout('template.layout')

@section('content')

        @include('template.partials.top_header')
        <div class="row-fluid">

        <!--  Left Sidebar -->
        @include('template.partials.left_sidebar')

        <!-- Body start -->
            <div class="span10 body-container">

            <div class="row-fluid">
                <div class="span12">
                    <ul class="breadcrumb">
                        Navigator <span class="divider">/</span>
                        <li>
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> {{ HTML::link_to_route('fee_payments','Fees Payments') }}
                            <!--<span class="divider">/</span> -->
                        </li>
                    </ul>
                </div>
            </div>

                <div class="row-fluid">

                    <div class="span12">

                        <div class="row-fluid">

                            <div class="span9">
                                <div class="row-fluid">

                                    <div class="span12">
                                        <section class="utopia-widget">
                                            <div class="utopia-widget-title">
                                                {{ HTML::image('webassets/img/icons/paragraph_justify.png','',array('class'=>'utopia-widget-icon')) }}
                                                <span>Profile</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <div class="row-fluid">
                                                <div class="span8">
                                                @if(!is_null($user))
                                                    <table class="table">
                                                      {{ Form::open_for_files('users/upload_photo','POST') }}
                                                        <tbody>
                                                            <tr>
                                                                <td colspan="2">
                                                                    {{ HTML::image(Ais::passport_image() . '?id=' . md5(date('his')),'Passport Photo') }}<br>
                                                                    {{ Form::file('passport_photo') }}<br>
                                                                    {{ $errors->has('passport_photo')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                     @if($errors->has('passport_photo'))
                                                                        {{ $errors->first('passport_photo','<span class="help-inline">:message</span>') }}<br>
                                                                     @endif
                                                                    </div>
                                                                    {{ Form::submit('Upload Photo', array('class'=>'btn btn-info')) }}
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>First Name:</td>
                                                                <td><strong>{{ $user->firstname }}</strong></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Surname:</td>
                                                                <td><strong>{{ $user->surname }}</strong></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Email Address:</td>
                                                                <td><strong>{{ $user->email }}</strong></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Role:</td>
                                                                <td><strong>{{ Expand::role($user->role_id) }}</strong></td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2"> {{ HTML::link('users/edit_profile/' . $user->id,'Edit Profile',array('class'=>'btn btn-primary'))}}</td>
                                                            </tr>
                                                        </tbody>
                                                       {{ Form::close() }}
                                                    </table>
                                                @else
                                                    <p>We could not load your profile information...try to {{ HTML::link('users/logout','login') }} again to the portal.</p>
                                                @endif
                                                </div>
                                                </div>
                                            </div>
                                        </section>

                                    </div>

                                </div>

                            </div><!-- Mid panel -->
                            <!--  Right Panel -->
                            @include('template.partials.right_panel')
                        </div>

                    </div>

                </div>

            </div>
        <!-- Body end -->

    </div>

    <!-- Maincontent end -->

@endsection
