<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>AR-RAHMAN Portal - v0.1</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Ah-Rahman International School Portal">
    <meta name="author" content="Mfawa Alfred Onen">

    <!-- styles -->
    {{ HTML::style('webassets/css/utopia-white.css') }}
    {{ HTML::style('webassets/css/utopia-responsive.css') }}
    {{ HTML::style('webassets/css/ui-lightness/jquery-ui.css') }}
    {{ HTML::style('webassets/css/weather.css') }}
    {{ HTML::style('webassets/gallery/modal.css') }}
    {{ HTML::style('webassets/css/validationEngine.jquery.css') }}
    {{ HTML::style('webassets/css/chosen.css') }}
    {{ HTML::style('webassets/css/datepicker.css') }}
    {{ HTML::style('webassets/css/wizard_form.css') }}
    {{ HTML::style('webassets/css/ie.css') }}
    {{ HTML::style('webassets/css/fullcalendar.css') }}
    {{ HTML::style('webassets/css/calendarPicker.css') }}

    {{ HTML::script('webassets/js/jquery.min.js') }}

    <!--[if IE 8]>
    {{ HTML::style('webassets/css/ie8.css') }}
    <![endif]-->

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!--[if gte IE 9]>
      <style type="text/css">
        .gradient {
           filter: none;
        }
      </style>
    <![endif]-->
    {{ HTML::style('webassets/css/custom.css') }}
    <!-- TODO: Is there a better way? -->
    {{ HTML::script('webassets/js/fullcalendar.js') }}
</head>

<body>

<div class="container-fluid">

@yield('content')

</div> <!-- end of container -->

<!-- javascript placed at the end of the document so the pages load faster -->
{{ HTML::script('webassets/js/utopia.js') }}
{{ HTML::script('webassets/js/jquery.hoverIntent.min.js') }}
{{ HTML::script('webassets/js/jquery.easing.1.3.js') }}
{{ HTML::script('webassets/js/jquery.datatable.js') }}
{{ HTML::script('webassets/js/tables.js') }}
{{ HTML::script('webassets/js/jquery.sparkline.js') }}
{{ HTML::script('webassets/js/jquery.vticker-min.js') }}
{{ HTML::script('webassets/js/calendarPicker.js') }}
{{ HTML::script('webassets/js/ui/datepicker.js') }}
{{ HTML::script('webassets/js/upload/load-image.min.js') }}
{{ HTML::script('webassets/js/upload/image-gallery.min.js') }}
{{ HTML::script('webassets/js/jquery.simpleWeather.js') }}
{{ HTML::script('webassets/js/jquery.validationEngine.js"') }}
{{ HTML::script('webassets/js/jquery.validationEngine-en.js') }}
{{ HTML::script('webassets/js/maskedinput.js') }}
{{ HTML::script('webassets/js/chosen.jquery.js') }}
{{ HTML::script('webassets/js/gmap3.js') }}
{{ HTML::script('webassets/js/header.js?v1') }}
{{ HTML::script('webassets/js/sidebar.js') }}
{{ HTML::script('webassets/js/custom.js') }}
</body>
</html>