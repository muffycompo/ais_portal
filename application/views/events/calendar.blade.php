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
        events:[
            {
                title:'All Day Event',
                start:new Date(y, m, 1)
            },
            {
                title:'Long Event',
                start:new Date(y, m, d - 5),
                end:new Date(y, m, d - 2)
            },
            {
                id:999,
                title:'Repeating Event',
                start:new Date(y, m, d - 3, 16, 0),
                allDay:false
            },
            {
                id:999,
                title:'Repeating Event',
                start:new Date(y, m, d + 4, 16, 0),
                allDay:false
            },
            {
                title:'Meeting',
                start:new Date(y, m, d, 10, 30),
                allDay:false
            },
            {
                title:'Lunch',
                start:new Date(y, m, d, 12, 0),
                end:new Date(y, m, d, 14, 0),
                allDay:false
            },
            {
                title:'Birthday Party',
                start:new Date(y, m, d + 1, 19, 0),
                end:new Date(y, m, d + 1, 22, 30),
                allDay:false,
                url:''
            },
            {
                title:'Click for Google',
                start:new Date(y, m, 28),
                end:new Date(y, m, 29),
                url:'http://google.com/'
            }
        ]
    });
});

</script>
@endsection
