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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }}
                            <!--<span class="divider">/</span> -->
                        </li>
                    </ul>

                    {{ Ais::payment_balance() }}
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
                                                <span>Welcome, {{ Session::get('firstname') . ' ' . Session::get('surname') }}</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                @if((Ais::registration_status() == 1 || Ais::registration_status() <= 6)  && Session::get('role_id') == 1)
                                                {{ Menu::registration_instructions() }}
                                                @elseif(((Ais::registration_status() == 7) || (Ais::registration_status() == 8)) && (Session::get('role_id') == 1 ))
                                                {{ Menu::entrance_exam_instructions() }}
                                                @else
                                                <p>This is your Dashboard, a landing page that shows related content based on your access role and level.</p>
                                                @endif
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
