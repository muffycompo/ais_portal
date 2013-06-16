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
                                                <span>Broadsheet Reports - Academic Session</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <table class="table table-striped table-bordered">
                                                    <thead>
                                                    <?php $sn = 1; ?>
                                                        <tr>
                                                            <th>S/N</th>
                                                            <th>Academic Session</th>
                                                            <th>Terms</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                    @if(! is_null($sessions) && is_array($sessions) )
                                                      @foreach($sessions as $session)
                                                        <tr>
                                                            <td>{{ $sn++ }}</td>
                                                            <td>
                                                            @if($session->active_session == 1)
                                                                <strong>{{ $session->academic_session }}</strong>
                                                             @else
                                                                {{ $session->academic_session }}
                                                             @endif
                                                             </td>
                                                            <td>
                                                                {{ HTML::link('reports/broadsheet/' . $session->id . '/1','1st Term',array('class'=>'btn btn-info')) }}
                                                                {{ HTML::link('reports/broadsheet/' . $session->id . '/2','2nd Term',array('class'=>'btn btn-info')) }}
                                                                {{ HTML::link('reports/broadsheet/' . $session->id . '/3','3rd Term',array('class'=>'btn btn-info')) }}
                                                            </td>
                                                        </tr>
                                                      @endforeach
                                                    @endif
                                                    </tbody>

                                                    <tfoot>
                                                    <tr>
                                                        <th>S/N</th>
                                                        <th>Academic Session</th>
                                                        <th>Terms</th>
                                                    </tr>
                                                    </tfoot>
                                                </table>

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
