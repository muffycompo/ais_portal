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
                                                <span>Assign Subject to {{ $teacher->firstname . ' ' . $teacher->surname }}</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <div class="row-fluid">
                                                    <div class="span9 utopia-form-freeSpace">
                                                        {{ Form::open('settings/assign_subject','POST',array('class'=>'form-horizontal')) }}
                                                            <fieldset>

                                                                <div class="control-group">
                                                                    {{ Form::label('subject_id','Subject:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::subject_dropdown('subject_id',Input::old('subject_id'),array('id'=>'subject_id','class'=>'span6 input-fluid')) }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ Form::label('class_id','Class:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::class_dropdown('class_id',Input::old('class_id'),array('id'=>'class_id','class'=>'span6 input-fluid')) }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    {{ Form::label('term_id','Term:',array('class'=>'control-label')) }}
                                                                    <div class="controls">
                                                                        {{ Ais::term_dropdown('term_id',Input::old('term_id'),array('id'=>'term_id','class'=>'span6 input-fluid')) }}
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    <div class="controls inline">
                                                                    {{ Form::button('Assign', array('class'=>'btn btn-info span3')) }} {{ HTML::link_to_route('teachers','Cancel','',array('class'=>'btn btn-danger span3')) }}
                                                                    </div>
                                                                </div>

                                                            </fieldset>
                                                        {{ Form::close() }}
                                                    </div>
                                                </div>
                                            </div>
                                        </section>

                                    </div>

                                <div class="row-fluid">
                                    <div class="span12">
                                        <section class="utopia-widget">
                                            <div class="utopia-widget-title">
                                                {{ HTML::image('webassets/img/icons/paragraph_justify.png','',array('class'=>'utopia-widget-icon')) }}
                                                <span>Assigned Subjects for {{ $teacher->firstname . ' ' . $teacher->surname }}</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <table class="table">
                                                    <thead>
                                                    <?php $sn = 1; ?>
                                                        <tr>
                                                            <th>S/N</th>
                                                            <th>Subject</th>
                                                            <th>Class</th>
                                                            <th>Term</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                    @if(! is_null($subjects) && is_array($subjects) )
                                                      @foreach($subjects as $subject)
                                                        <tr>
                                                            <td>{{ $sn++ }}</td>
                                                            <td>{{ Expand::subject($subject->subject_id) }}</td>
                                                            <td>{{ Expand::classes($subject->class_id) }}</td>
                                                            <td>{{ Expand::term($subject->term_id) }}</td>
                                                            <td>
                                                                {{ HTML::decode(HTML::link('settings/unassign_subject/' . $subject->user_id .'/' . $subject->subject_id. '/' .$subject->class_id . '/' . $subject->term_id, HTML::image('webassets/img/icons/pencil.png','Unassign',array('title'=>'Unassign')),array('class'=>'edit'))) }}
                                                            </td>
                                                        </tr>
                                                      @endforeach
                                                    @endif
                                                    </tbody>

                                                </table>
                                            </div>
                                        </section>

                                    </div>
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

