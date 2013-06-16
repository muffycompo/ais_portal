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
                                                <span>New User</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <div class="row-fluid">
                                                    <div class="span9 utopia-form-freeSpace">
                                                        {{ Form::open('users/new_user','POST',array('class'=>'form-horizontal')) }}
                                                            <fieldset>

                                                                {{ $errors->has('surname')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('surname','Surname:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','surname',Input::old('surname'),array('id'=>'surname','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('surname','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('firstname')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('firstname','First Name:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','firstname',Input::old('firstname'),array('id'=>'firstname','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('firstname','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('email')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('email','Email:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','email',Input::old('email'),array('id'=>'email','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('email','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                {{ $errors->has('password')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('password','Password:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::password('password',array('id'=>'password','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('password','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ Form::label('role_id','Role:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::role_dropdown('role_id',Input::old('role_id'),array('id'=>'role_id','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('role_id','<span class="help-inline">:message</span>') }}
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
