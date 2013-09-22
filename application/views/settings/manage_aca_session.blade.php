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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Manage Academic Sessions
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
                                                <span>Manage Academic Sessions</span>
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
                                                                            <th>Academic Session</th>
                                                                            <th>Active</th>
                                                                            <th>Actions</th>
                                                                        </tr>
                                                                    </thead>

                                                                    <tbody>
                                                                    @if(! is_null($academic_sessions) && is_array($academic_sessions) )
                                                                      @foreach($academic_sessions as $academic_session)
                                                                        <tr>
                                                                            <td>{{ $sn++ }}</td>
                                                                            <td>
                                                                                @if($academic_session->active_session == 1)
                                                                                    <strong>{{ $academic_session->academic_session }}</strong>
                                                                                @else
                                                                                    {{ $academic_session->academic_session }}
                                                                                @endif
                                                                            </td>

                                                                            <td>
                                                                                @if($academic_session->active_session == 1)
                                                                                    {{ HTML::decode(HTML::image('webassets/img/icons/checkmark2.png','Active Session',array('title'=>'Active Session'))) }}
                                                                                @endif
                                                                            </td>
                                                                            <td>
                                                                                @if($academic_session->active_session != 1)
                                                                                    {{ HTML::decode(HTML::link_to_route('active_session', HTML::image('webassets/img/icons/play.png','Make Active',array('title'=>'Make Active')),array($academic_session->id), array('class'=>'delete'))) }}
                                                                                @endif
                                                                                {{ HTML::decode(HTML::link_to_route('delete_aca_session', HTML::image('webassets/img/icons/trash_can.png','Delete',array('title'=>'Delete')),array($academic_session->id), array('class'=>'delete'))) }}
                                                                            </td>
                                                                        </tr>
                                                                      @endforeach
                                                                    @endif
                                                                    </tbody>

                                                                    <tfoot>
                                                                    <tr>
                                                                        <th>S/N</th>
                                                                        <th>Academic Session</th>
                                                                        <th>Active</th>
                                                                        <th>Actions</th>
                                                                    </tr>
                                                                    </tfoot>
                                                                </table>
                                                             </div>
                                                             <div class="span4 utopia-form-freeSpace">
                                                                 {{ Form::open('settings/manage_aca_session','POST',array('class'=>'form-horizontal')) }}
                                                                     <fieldset>

                                                                         {{ $errors->has('academic_session')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                             {{ Form::label('academic_session','Academic Session:',array('class'=>'control-label')) }}
                                                                             <div class="controls">
                                                                                 {{ Form::input('text','academic_session',Input::old('academic_session'),array('id'=>'academic_session','class'=>'span12 input-fluid')) }}
                                                                                 {{ $errors->first('academic_session','<span class="help-inline">:message</span>') }}
                                                                             </div>
                                                                         </div>

                                                                        <div class="control-group">
                                                                            <div class="controls inline">
                                                                            {{ Form::button('Add', array('class'=>'btn btn-info span6')) }} {{ HTML::link_to_route('user_dashboard','Cancel','',array('class'=>'btn btn-danger span6')) }}
                                                                            </div>
                                                                        </div>
                                                                     </fieldset>
                                                                 {{ Form::close() }}

                                                             </div>
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
