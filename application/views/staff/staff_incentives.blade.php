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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Staff Incentives
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
                                                <span>Staff Incentives</span>
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
                                                                            <th>Incentive</th>
                                                                            <th>Percentage(%)</th>
                                                                            <th>Incentive Type</th>
                                                                            <th>Actions</th>
                                                                        </tr>
                                                                    </thead>

                                                                    <tbody>
                                                                    @if(! is_null($incentives) && is_array($incentives) )
                                                                      @foreach($incentives as $incentive)
                                                                        <tr>
                                                                            <td>{{ $sn++ }}</td>
                                                                            <td>{{ $incentive->incentive_name }}</td>
                                                                            <td>{{ $incentive->incentive_percentage }}</td>
                                                                            <td>{{ Expand::incentive($incentive->incentive_type_id) }}</td>
                                                                            <td>
                                                                                {{ HTML::decode(HTML::link_to_route('delete_incentive', HTML::image('webassets/img/icons/trash_can.png','Delete',array('title'=>'Delete')),array($incentive->id), array('class'=>'delete'))) }}
                                                                            </td>
                                                                        </tr>
                                                                      @endforeach
                                                                    @endif
                                                                    </tbody>

                                                                    <tfoot>
                                                                    <tr>
                                                                        <th>S/N</th>
                                                                        <th>Incentive</th>
                                                                        <th>Percentage(%)</th>
                                                                        <th>Incentive Type</th>
                                                                        <th>Actions</th>
                                                                    </tr>
                                                                    </tfoot>
                                                                </table>
                                                             </div>
                                                             <div class="span4 utopia-form-freeSpace">
                                                                 {{ Form::open('staff/incentives','POST',array('class'=>'form-horizontal')) }}
                                                                     <fieldset>

                                                                         {{ $errors->has('incentive_name')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                             {{ Form::label('incentive_name','Incentive Name:',array('class'=>'control-label')) }}
                                                                             <div class="controls">
                                                                                 {{ Form::input('text','incentive_name',Input::old('incentive_name'),array('id'=>'incentive_name','class'=>'span12 input-fluid')) }}
                                                                                 {{ $errors->first('incentive_name','<span class="help-inline">:message</span>') }}
                                                                             </div>
                                                                         </div>

                                                                         {{ $errors->has('incentive_percentage')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                             {{ Form::label('incentive_percentage','Percentage(%):',array('class'=>'control-label')) }}
                                                                             <div class="controls">
                                                                                 {{ Form::input('text','incentive_percentage',Input::old('incentive_percentage'),array('id'=>'incentive_percentage','class'=>'span12 input-fluid')) }}
                                                                                 {{ $errors->first('incentive_percentage','<span class="help-inline">:message</span>') }}
                                                                             </div>
                                                                         </div>

                                                                         <div class="control-group">
                                                                             {{ Form::label('incentive_type','Incentive Type:',array('class'=>'control-label')) }}
                                                                             <div class="controls">
                                                                                 {{ Ais::incentive_type_dropdown('incentive_type',Input::old('incentive_type'),array('id'=>'incentive_type','class'=>'span12 input-fluid')) }}
                                                                             </div>
                                                                         </div>
                                                                        <div class="control-group">
                                                                            <div class="controls inline">
                                                                            {{ Form::button('Add', array('class'=>'btn btn-info span6')) }} {{ HTML::link_to_route('payroll','Cancel','',array('class'=>'btn btn-danger span6')) }}
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
