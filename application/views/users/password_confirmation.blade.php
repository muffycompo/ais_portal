@layout('template.layout')

@section('content')

@include('template.partials.top_header')

    <div class="row-fluid">
        <div class="span9">
            <section id="formElement" class="utopia-widget utopia-form-box section">
                <div class="utopia-widget-title">
                    {{ HTML::image('webassets/img/icons2/software24.png','',array('class'=>'utopia-widget-icon')) }}
                    <span>Password Reset Complete</span>
                </div>

                <div class="row-fluid">
                    <div class="utopia-widget-content">

                        <div class="alert alert-success">
                            <strong>Congratulations!</strong>
                            <p>Your new password has been sent to your email address: <strong>{{ Session::has('email') ? Str::lower(Session::get('email')) : '' }}</strong></p>
                            <p><strong>Note:</strong> You are required to change the password IMMEDIATELY to something you can remember by editing your profile.</p>
                            <p>Click {{ HTML::link_to_route('user_login','here') }} to login</p>
                        </div>

                    </div>
                </div>
            </section>

       </div>
       <!--  Right Panel -->
        @include('template.partials.right_panel')
    </div>
    <!-- Maincontent end -->

@endsection
