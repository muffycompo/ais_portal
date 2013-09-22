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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Manage Application PINs
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
                                                <span>Manage Application PINs</span>
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
                                                                            <th>PIN Number</th>
                                                                            <th>Actions</th>
                                                                        </tr>
                                                                    </thead>

                                                                    <tbody>
                                                                    @if(! is_null($pins) && is_array($pins) )
                                                                      @foreach($pins as $pin)
                                                                        <tr>
                                                                            <td>{{ $sn++ }}</td>
                                                                            <td>{{ $pin->pin_no }}</td>
                                                                            <td>
                                                                                {{ HTML::decode(HTML::link_to_route('delete_app_pin', HTML::image('webassets/img/icons/trash_can.png','Delete',array('title'=>'Delete')),array($pin->id), array('class'=>'delete'))) }}
                                                                            </td>
                                                                        </tr>
                                                                      @endforeach
                                                                    @endif
                                                                    </tbody>

                                                                    <tfoot>
                                                                    <tr>
                                                                        <th>S/N</th>
                                                                        <th>PIN Number</th>
                                                                        <th>Actions</th>
                                                                    </tr>
                                                                    </tfoot>
                                                                </table>
                                                             </div>
                                                             <div class="span4 utopia-form-freeSpace">
                                                                 {{ Form::open('settings/manage_app_pin','POST',array('class'=>'form-horizontal')) }}
                                                                     <fieldset>

                                                                         {{ $errors->has('number_to_generate')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                             {{ Form::label('number_to_generate','Number to Generate:',array('class'=>'control-label')) }}
                                                                             <div class="controls">
                                                                                 {{ Form::input('text','number_to_generate',Input::old('number_to_generate'),array('id'=>'number_to_generate','class'=>'span12 input-fluid')) }}
                                                                                 {{ $errors->first('number_to_generate','<span class="help-inline">:message</span>') }}
                                                                             </div>
                                                                         </div>

                                                                        <div class="control-group">
                                                                            <div class="controls inline">
                                                                            {{ Form::button('Generate', array('class'=>'btn btn-info span6')) }} {{ HTML::link_to_route('user_dashboard','Cancel','',array('class'=>'btn btn-danger span6')) }}
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
