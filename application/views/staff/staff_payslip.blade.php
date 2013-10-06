@layout('template.layout')

@section('content')

        @include('template.partials.top_header')
        <div class="row-fluid">

        <!--  Left Sidebar -->
        @include('template.partials.left_sidebar')

        <!-- Body start -->
            <div class="span10 body-container">

            <div class="row-fluid print-top-breadcrumb">
                <div class="span12">
                    <ul class="breadcrumb">
                        Navigator <span class="divider">/</span>
                        <li>
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Staff Payslip
                            <!--<span class="divider">/</span> -->
                        </li>
                    </ul>
                </div>
            </div>

            <div class="row-fluid print-only-div" style="display: none;">
                <div class="span12">
                    <div id="print-identity">
                        <div id="logo">
                          {{ HTML::image('webassets/receipts/images/logo.png','Logo') }}
                        </div>
                    </div>
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
                                                <span>Staff Payslip - {{ $details->name . ' [' . $details->staff_no . ']' }}</span>
                                            </div>
                                            <div class="utopia-widget-content">
                                                <div class="row-fluid">
                                                    <div class="span12 utopia-form-freeSpace">
                                                         <div class="row-fluid">
                                                             <div class="span5 utopia-form-freeSpace">
                                                                 <p>Staff Number: <strong>{{ $details->staff_no }}</strong></p>
                                                                 <p>Full Name: <strong>{{ $details->name }}</strong></p>
                                                                 <p>Designation: <strong>{{ Expand::designation($details->designation_id) }}</strong></p>
                                                                 <p>Bank: <strong>{{ Expand::bank($details->bank_id) }}</strong></p>
                                                             </div>
                                                             <div class="span7 utopia-form-freeSpace">
                                                                <p>
                                                                    {{ HTML::image('uploads/staff/' . $details->passport .'?' . time(),'Passport',array('class'=>'passport-image-border print-img')) }}
                                                                </p>
                                                             </div>
                                                         </div>
                                                    </div>
                                                    <div class="span7 utopia-form-freeSpace" style="margin-left: 0; margin-top: 0;">
                                                         <div class="row-fluid">
                                                             <div class="span12 utopia-form-freeSpace">
                                                                 <h3>Salary</h3>
                                                                  <table class="table">
                                                                     <tr>
                                                                         <td>Basic Salary</td>
                                                                         <td style="text-align: right;"><strong>{{ Ais::format_to_currency($salary_amount['basic_salary']) }}</strong></td>
                                                                     </tr>
                                                                     <tr>
                                                                         <td>Medical</td>
                                                                         <td style="text-align: right;"><strong>{{ Ais::format_to_currency($salary_amount['Medical']) }}</strong></td>
                                                                     </tr>
                                                                     <tr>
                                                                         <td>Transport</td>
                                                                         <td style="text-align: right;"><strong>{{ Ais::format_to_currency($salary_amount['Transport']) }}</strong></td>
                                                                     </tr>
                                                                     <tr>
                                                                         <td>Housing</td>
                                                                         <td style="text-align: right;"><strong>{{ Ais::format_to_currency($salary_amount['Housing']) }}</strong></td>
                                                                     </tr>
                                                                     <tr>
                                                                         <td>Pension</td>
                                                                         <td style="text-align: right;"><strong>{{ Ais::format_to_currency($salary_amount['Pension']) }}</strong></td>
                                                                     </tr>
                                                                     <tr>
                                                                         <td>Designation Allowance</td>
                                                                         <td style="text-align: right;"><strong>{{ Ais::format_to_currency($salary_amount['designation_incentive']) }}</strong></td>
                                                                     </tr>
                                                                     <tr>
                                                                         <td>Bonus</td>
                                                                         <td style="text-align: right;"><strong>{{ Ais::format_to_currency($salary_amount['bonus']) }}</strong></td>
                                                                     </tr>
                                                                  </table>

                                                                  <h3>Deductions</h3>
                                                                  <table class="table">
                                                                  @foreach($salary_amount['deductions'] as $k => $v)
                                                                     <tr>
                                                                         <td>{{ $k }}</td>
                                                                         <td style="text-align: right;"><strong>{{ Ais::format_to_currency($v) }}</strong></td>
                                                                     </tr>
                                                                  @endforeach
                                                                     <tr>
                                                                          <td><strong>TOTAL</strong></td>
                                                                          <td style="text-align: right;"><strong>{{ Ais::format_to_currency($salary_amount['total_pay']) }}</strong></td>
                                                                      </tr>
                                                                      <tr><td colspan="2">&nbsp;</td></tr>
                                                                  </table>
                                                                 <p>{{ HTML::link_to_route('staff_salary','Back',array($details->id),array('class'=>'btn btn-danger print-btn')) }} <a href="javascript:window.print();" class="btn btn-info print-btn">Print</a></p>
                                                             </div>
                                                         </div>
                                                    </div>
                                                </div>
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

<script type="text/javascript">
$(document).ready(function(){
 // Datetime Picker Related
    $('#date_of_birth').datetimepicker({
        format: 'yyyy-mm-dd',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1
    });

    $('#employment_date').datetimepicker({
        format: 'yyyy-mm-dd',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1,
        pickTime: false
    });
});
</script>
@endsection
