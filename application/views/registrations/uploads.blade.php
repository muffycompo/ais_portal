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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Uploads
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
                                                <span>Uploads</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <div class="row-fluid">
                                                <div class="span8">

                                                    <table class="table">
                                                        <tbody>
                                                            <tr>
                                                                <td colspan="2"><h3>Passport Photo</h3></td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    {{ Form::open_for_files('registrations/upload_photo','POST') }}

                                                                        {{ HTML::image(Ais::passport_image() . '?id=' . md5(date('his')),'Passport Photo') }}<br>
                                                                        {{ Form::file('passport_photo') }}<br>
                                                                        {{ $errors->has('passport_photo')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                         @if($errors->has('passport_photo'))
                                                                            {{ $errors->first('passport_photo','<span class="help-inline">:message</span>') }}<br>
                                                                         @endif
                                                                        </div>
                                                                        {{ Form::submit('Upload Photo', array('class'=>'btn btn-info')) }}
                                                                        @if(Ais::registration_status() == 6)
                                                                            {{ HTML::decode(HTML::link_to_route('attestation','Next <i class="icon-arrow-right"></i>','',array('class'=>'btn btn-success pull-right'))) }}
                                                                        @endif

                                                                    {{ Form::close() }}
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>

                                                    <table class="table">
                                                        <tbody>
                                                            <tr>
                                                                <td colspan="2"><h3>Supporting Document(s)</h3></td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="1">
                                                                    {{ Form::open_for_files('registrations/upload_docs','POST') }}

                                                                        {{ Form::file('supporting_docs') }}<br>
                                                                        {{ $errors->has('supporting_docs')? '<div class="control-group error">' : '<div class="control-group">' }}
                                                                         @if($errors->has('supporting_docs'))
                                                                            {{ $errors->first('supporting_docs','<span class="help-inline">:message</span>') }}<br>
                                                                         @endif
                                                                        </div>
                                                                        {{ Form::submit('Upload Document', array('class'=>'btn btn-info')) }}

                                                                    {{ Form::close() }}
                                                                </td>
                                                                <td>
                                                                    <p>Photocopies of the following documents should be scanned and uploaded as supporting documents:</p>
                                                                    <ol>
                                                                    	<li>Transfer letter of certificate</li>
                                                                    	<li>Last Two (2) examination results</li>
                                                                    	<li>Birth Certificate</li>
                                                                    </ol>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>

                                                    <table class="table">
                                                        <thead>
                                                        <?php $sn = 1; ?>
                                                            <tr>
                                                                <th>S/N</th>
                                                                <th>Document Name</th>
                                                                <th>Actions</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        @if(!empty($docs) && is_array($docs))
                                                            @foreach($docs as $doc)
                                                                <tr>
                                                                    <td>{{ $sn++ }}</td>
                                                                    <td>
                                                                       {{ $doc }}
                                                                    </td>
                                                                    <td>
                                                                        {{ HTML::decode(HTML::link('registrations/delete_docs/' . $doc, HTML::image('webassets/img/icons/trash_can.png','Delete',array('title'=>'Delete')),array('class'=>'delete'))) }}
                                                                    </td>
                                                                </tr>
                                                            @endforeach
                                                        @else
                                                             <tr>
                                                                <td colspan="3">You have not uploaded any Supporting document(s)!</td>
                                                             </tr>
                                                        @endif

                                                        </tbody>
                                                    </table>

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
