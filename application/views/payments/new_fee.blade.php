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
                                                <span>New Fee Payment</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <div class="row-fluid">
                                                    <div class="span10 utopia-form-freeSpace">
                                                        {{ Form::open('payments/new_fee','POST',array('class'=>'form-horizontal')) }}
                                                            <fieldset>

                                                                {{ $errors->has('admission_no')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('admission_no','Admission No.:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','admission_no',Input::old('admission_no'),array('id'=>'admission_no','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('admission_no','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('paid_amount')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('paid_amount','Amount:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','paid_amount',Input::old('paid_amount'),array('id'=>'paid_amount','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('paid_amount','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('teller_no')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('teller_no','Teller No.:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','teller_no',Input::old('teller_no'),array('id'=>'teller_no','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('teller_no','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ Form::label('payment_category_id','Payment Category:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::payment_category_dropdown('payment_category_id',Input::old('payment_category_id'),array('id'=>'payment_category_id','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('payment_category_id','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ Form::label('class_id','Class:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::class_dropdown('class_id',Input::old('class_id'),array('id'=>'class_id','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('class_id','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ Form::label('term_id','Term:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::term_dropdown('term_id',Input::old('term_id'),array('id'=>'term_id','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('term_id','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ Form::label('academic_session_id','Academic Session:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::academic_session_dropdown('academic_session_id',Input::old('academic_session_id'),array('id'=>'academic_session_id','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('academic_session_id','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    <div class="controls inline">
                                                                    {{ Form::button('Add', array('class'=>'btn btn-info span3')) }}{{ HTML::link_to_route('fee_payments','Cancel','',array('class'=>'btn btn-danger span3')) }}
                                                                    </div>
                                                                </div>

                                                            </fieldset>
                                                        {{ Form::close() }}
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

@endsection
