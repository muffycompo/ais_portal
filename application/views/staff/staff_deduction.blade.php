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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Staff Deduction
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
                                                <span>Staff Deduction - {{ $staff->name .' [' .$staff->staff_no. ']' }}</span>
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
                                                                            <th>Deduction Type</th>
                                                                            <th>Deduction Date</th>
                                                                            <th>Actions</th>
                                                                        </tr>
                                                                    </thead>

                                                                    <tbody>
                                                                    @if(! is_null($deductions) && is_array($deductions) )
                                                                      @foreach($deductions as $deduction)
                                                                        <tr>
                                                                            <td>{{ $sn++ }}</td>
                                                                            <td>{{ Expand::deduction($deduction->deduction_type_id) }}</td>
                                                                            <td>{{ Ais::reverse_db_date($deduction->deduction_date) }}</td>
                                                                            <td>
                                                                                {{ HTML::decode(HTML::link_to_route('delete_deduction', HTML::image('webassets/img/icons/trash_can.png','Delete',array('title'=>'Delete')),array($deduction->id), array('class'=>'delete'))) }}
                                                                            </td>
                                                                        </tr>
                                                                      @endforeach
                                                                    @endif
                                                                    </tbody>

                                                                    <tfoot>
                                                                    <tr>
                                                                        <th>S/N</th>
                                                                        <th>Deduction Type</th>
                                                                        <th>Deduction Date</th>
                                                                        <th>Actions</th>
                                                                    </tr>
                                                                    </tfoot>
                                                                </table>
                                                             </div>
                                                             <div class="span4 utopia-form-freeSpace">
                                                                 {{ Form::open('staff/staff_deduction','POST',array('class'=>'form-horizontal')) }}
                                                                     <fieldset>

                                                                         <div class="control-group">
                                                                             {{ Form::label('deduction_type_id','Deduction Type:',array('class'=>'control-label')) }}
                                                                             <div class="controls">
                                                                                 {{ Ais::deduction_type_dropdown('deduction_type_id',Input::old('deduction_type_id'),array('id'=>'deduction_type_id','class'=>'span12 input-fluid')) }}
                                                                             </div>
                                                                         </div>

                                                                         {{ $errors->has('deduction_date')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                             {{ Form::label('deduction_date','Deduction Date:',array('class'=>'control-label')) }}
                                                                             <div class="controls">
                                                                                 {{ Form::input('text','deduction_date',Input::old('deduction_date'),array('id'=>'deduction_date','class'=>'span12 input-fluid ais_dateonly')) }}
                                                                                 {{ $errors->first('deduction_date','<span class="help-inline">:message</span>') }}
                                                                             </div>
                                                                         </div>
                                                                         {{ Form::hidden('staff_id',$staff->id) }}
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

    <script type="text/javascript">
    $(document).ready(function(){
     // Datetime Picker Related
        $('#deduction_date').maodatepicker({
            format: 'yyyy-mm-dd',
            weekStart: 1,
            autoclose: true,
            todayHighlight: 1,
            startView: 2,
            forceParse: 0,
        });
    });
    </script>

@endsection
