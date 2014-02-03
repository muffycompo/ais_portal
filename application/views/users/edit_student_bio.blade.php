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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Edit User
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
                                                <span>Editing {{ $user->firstname . ' ' . $user->surname }} Bio</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <div class="row-fluid">
                                                    <div class="span9 utopia-form-freeSpace">
                                                        {{ Form::open('users/student_bio','POST',array('class'=>'form-horizontal')) }}
                                                            <fieldset>

                                                                {{ $errors->has('age')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('age','Age:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','age',$bio->age,array('id'=>'age','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('age','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>

                                                                <!--{{ $errors->has('house')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                    {{ Form::label('house','House:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Form::input('text','house','',array('id'=>'house','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('house','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div> -->

                                                                <div class="control-group">
                                                                    {{ Form::label('gender_id','Gender:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::gender_dropdown('gender_id',$bio->gender_id,array('id'=>'gender_id','class'=>'span6 input-fluid')) }}
                                                                        {{ $errors->first('gender_id','<span class="help-inline">:message</span>') }}
                                                                    </div>
                                                                </div>
                                                                <div class="control-group">
                                                                    <div class="controls inline">
                                                                    {{ Form::hidden('user_id',$user->id) }}
                                                                    {{ Form::button('Update', array('class'=>'btn btn-info span3')) }}
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
