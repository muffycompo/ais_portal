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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Manage Academic Terms
                            <!--<span class="divider">/</span> -->
                        </li>
                    </ul>
                </div>
            </div>

                <div class="row-fluid">

                    <div class="span12">

                        <div class="row-fluid">

                            <div class="span12">
                                <div class="row-fluid">

                                    <div class="span12">
                                        <section class="utopia-widget">
                                            <div class="utopia-widget-title">
                                                {{ HTML::image('webassets/img/icons/paragraph_justify.png','',array('class'=>'utopia-widget-icon')) }}
                                                <span>Manage Academic Terms</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <div class="row-fluid">
                                                    <div class="span12 utopia-form-freeSpace">
                                                         <div class="row-fluid">
                                                             <div class="span8 utopia-form-freeSpace">
                                                                <table class="table datatable-nosort table-striped table-bordered">
                                                                    <thead>
                                                                    <?php $sn = 1; ?>
                                                                        <tr>
                                                                            <th>S/N</th>
                                                                            <th>Academic Term</th>
                                                                            <th>Active</th>
                                                                            <th>Actions</th>
                                                                        </tr>
                                                                    </thead>

                                                                    <tbody>
                                                                    @if(! is_null($terms) && is_array($terms) )
                                                                      @foreach($terms as $term)
                                                                        <tr>
                                                                            <td>{{ $sn++ }}</td>
                                                                            <td>
                                                                                @if($term->active_term == 1)
                                                                                    <strong>{{ $term->term }}</strong>
                                                                                @else
                                                                                    {{ $term->term }}
                                                                                @endif
                                                                            </td>

                                                                            <td>
                                                                                @if($term->active_term == 1)
                                                                                    {{ HTML::decode(HTML::image('webassets/img/icons/checkmark2.png','Active Term',array('title'=>'Active Term'))) }}
                                                                                @endif
                                                                            </td>
                                                                            <td>
                                                                                @if($term->active_term != 1)
                                                                                    {{ HTML::decode(HTML::link_to_route('active_term', HTML::image('webassets/img/icons/play.png','Make Active',array('title'=>'Make Active')),array($term->id), array('class'=>'delete'))) }}
                                                                                @endif
                                                                            </td>
                                                                        </tr>
                                                                      @endforeach
                                                                    @endif
                                                                    </tbody>

                                                                    <tfoot>
                                                                    <tr>
                                                                        <th>S/N</th>
                                                                        <th>Academic Term</th>
                                                                        <th>Active</th>
                                                                        <th>Actions</th>
                                                                    </tr>
                                                                    </tfoot>
                                                                </table>
                                                             </div>
                                                             <div class="span4 utopia-form-freeSpace">
                                                                <p>{{ HTML::link_to_route('user_dashboard','Cancel','',array('class'=>'btn btn-danger span6')) }}</p>
                                                         </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>

                                    </div>

                                </div>

                            </div><!-- Mid panel -->
                        </div>

                    </div>

                </div>

            </div>
        <!-- Body end -->

    </div>

    <!-- Maincontent end -->

@endsection
