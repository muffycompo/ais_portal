@layout('template.layout')

@section('content')

@include('template.partials.top_header')

    <div class="row-fluid">
        <div class="span9">
            <section id="formElement" class="utopia-widget utopia-form-box section">
                <div class="utopia-widget-title">
                    {{ HTML::image('webassets/img/icons2/software24.png','',array('class'=>'utopia-widget-icon')) }}
                    <span>Signup Complete</span>
                </div>

                <div class="row-fluid">
                    <div class="utopia-widget-content">

                        <div class="alert alert-success">
                            <strong>Congratulations!</strong>
                            <p>you have successfully signed up to our portal. A welcome email has been sent to your email address <strong>{{ Session::get('email') }}</strong> and an SMS sent to your Phone number <strong>{{ Session::get('gsm') }}</strong>.</p>
                            <p>Follow the instructions in the welcome email to continue with your application process. If you already have your access credentials, {{ HTML::link_to_route('user_login','login') }}.</p>
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
