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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> New Fee
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
                                                <span>New Fee</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <div class="row-fluid">
                                                    <div class="span9 utopia-form-freeSpace">
                                                        {{ Form::open('payments/add_new_fee','POST',array('class'=>'form-horizontal')) }}
                                                            <fieldset>
                                                                <div class="control-group">
                                                                    {{ Form::label('payment_category_id','Payment Type:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::payment_category_dropdown('payment_category_id',Input::old('payment_category_id'),array('id'=>'payment_category_id','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('payment_category_id','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('paid_amount')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('paid_amount','Amount:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','paid_amount',Input::old('paid_amount'),array('id'=>'paid_amount','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('paid_amount','<span class="help-inline">:message</span>') }}
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
                                                                    {{ Form::label('recurring_payment','Recurring Period:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::recurring_dropdown('recurring_payment',Input::old('recurring_payment'),array('id'=>'recurring_payment','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('recurring_payment','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    <div class="controls inline">
                                                                    {{ Form::button('Add', array('class'=>'btn btn-info span3')) }}
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
