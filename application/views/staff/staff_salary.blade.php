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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Staff Salary
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
                                                <span>Staff Salary - {{ $staff->name .' [' .$staff->staff_no. ']' }}</span>
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
                                                                            <th>Basic Salary(N)</th>
                                                                            <th>Bonus(N)</th>
                                                                            <th>Payment Date</th>
                                                                            <th>Actions</th>
                                                                        </tr>
                                                                    </thead>

                                                                    <tbody>
                                                                    @if(! is_null($salaries) && is_array($salaries) )
                                                                      @foreach($salaries as $salary)
                                                                        <tr>
                                                                            <td>{{ $sn++ }}</td>
                                                                            <td>{{ Ais::format_to_currency($salary->basic_monthly_salary) }}</td>
                                                                            <td>{{ Ais::format_to_currency($salary->bonus) }}</td>
                                                                            <td>{{ Ais::reverse_db_date($salary->payment_date) }}</td>
                                                                            <td>
                                                                                {{ HTML::decode(HTML::link_to_route('salary_payslip', HTML::image('webassets/img/icons/bill.png','Payslip',array('title'=>'Payslip')),array($salary->id, $staff->id, strtotime($salary->payment_date)), array('class'=>'edit'))) }}
                                                                                {{ HTML::decode(HTML::link_to_route('delete_salary', HTML::image('webassets/img/icons/trash_can.png','Delete',array('title'=>'Delete')),array($salary->id), array('class'=>'delete'))) }}
                                                                            </td>
                                                                        </tr>
                                                                      @endforeach
                                                                    @endif
                                                                    </tbody>

                                                                    <tfoot>
                                                                    <tr>
                                                                        <th>S/N</th>
                                                                        <th>Basic Salary(N)</th>
                                                                        <th>Bonus(N)</th>
                                                                        <th>Payment Date</th>
                                                                        <th>Actions</th>
                                                                    </tr>
                                                                    </tfoot>
                                                                </table>
                                                             </div>
                                                             <div class="span4 utopia-form-freeSpace">
                                                                 {{ Form::open('staff/staff_salary','POST',array('class'=>'form-horizontal')) }}
                                                                     <fieldset>

                                                                         {{ $errors->has('basic_monthly_salary')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                             {{ Form::label('basic_monthly_salary','Basic Salary:',array('class'=>'control-label')) }}
                                                                             <div class="controls">
                                                                                 {{ Form::input('text','basic_monthly_salary',Input::old('basic_monthly_salary'),array('id'=>'basic_monthly_salary','class'=>'span12 input-fluid')) }}
                                                                                 {{ $errors->first('basic_monthly_salary','<span class="help-inline">:message</span>') }}
                                                                             </div>
                                                                         </div>

                                                                         {{ $errors->has('bonus')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                             {{ Form::label('bonus','Bonus:',array('class'=>'control-label')) }}
                                                                             <div class="controls">
                                                                                 {{ Form::input('text','bonus',Input::old('bonus'),array('id'=>'bonus','class'=>'span12 input-fluid')) }}
                                                                                 {{ $errors->first('bonus','<span class="help-inline">:message</span>') }}
                                                                             </div>
                                                                         </div>

                                                                         {{ $errors->has('payment_date')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                             {{ Form::label('payment_date','Payment Date:',array('class'=>'control-label')) }}
                                                                             <div class="controls">
                                                                                 {{ Form::input('text','payment_date',Input::old('payment_date'),array('id'=>'payment_date','class'=>'span12 input-fluid ais_dateonly')) }}
                                                                                 {{ $errors->first('payment_date','<span class="help-inline">:message</span>') }}
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
        $('#payment_date').maodatepicker({
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
