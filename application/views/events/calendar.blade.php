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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Events <span class="divider">/</span> Calendar
                            <!--<span class="divider">/</span> -->
                        </li>
                    </ul>
                </div>
            </div>

                <div class="row-fluid">

                    <div class="span12">

                        <section class="utopia-widget">
                            <div class="utopia-widget-title">
                                {{ HTML::image('webassets/img/icons/calendar.png','',array('class'=>'utopia-widget-icon')) }}
                                <span>Calendar</span>
                            </div>

                            <div class="utopia-widget-content">
                                {{ HTML::link_to_route('new_event','New Event','',array('class'=>'btn btn-info')) }} {{ HTML::link('#','Event List',array('class'=>'btn btn-warning')) }}
                                <div id="ais_calendar" class="utopia-calendar-day">
                                <!-- TODO: This will eventually be replaced by the jQuery Calendar Plugin  -->
                                </div>
                            </div>
                        </section>

                    </div>

                </div>

            </div>
        <!-- Body end -->

    </div>

    <!-- Maincontent end -->


<script type="text/javascript">
$(document).ready(function(){
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();

    $('#ais_calendar').fullCalendar({
        header:{
            //left:'prev,next today',
            left:'',
            center:'title',
            right: 'month,agendaWeek,agendaDay'
        },
        editable:false,
        height:450,
        events: '{{ URL::to('events/events_feed') }}'
    });
});

</script>
@endsection
