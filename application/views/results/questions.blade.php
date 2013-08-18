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
                            {{ HTML::image('webassets/img/icons/monitor.png') .'  '. HTML::link_to_route('user_dashboard','Dashboard') }} <span class="divider">/</span> Questions Bank
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
                                                <span>Questions Bank</span>
                                            </div>
                                            @include('template.partials.notification')
                                            <div class="utopia-widget-content">
                                                <p>{{ HTML::link_to_route('new_question','Upload New Question','',array('class'=>'btn btn-info')) }}</p>
                                                <table class="table datatable-nosort table-striped table-bordered">
                                                    <thead>
                                                    <?php $sn = 1; ?>
                                                        <tr>
                                                            <th>S/N</th>
                                                            <th>Title</th>
                                                            <th>Subject</th>
                                                            <th>Class</th>
                                                            <th>Author</th>
                                                            <th>Actions</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                    @if(! is_null($questions) && is_array($questions) )
                                                      @foreach($questions as $question)
                                                        <tr>
                                                            <td>{{ $sn++ }}</td>
                                                            <td>{{ $question->question_title }}</td>
                                                            <td>{{ Expand::subject($question->subject_id) }}</td>
                                                            <td>{{ Expand::classes($question->class_id) }}</td>
                                                            <td>{{ Ais::resolve_name($question->user_id) }}</td>
                                                            <td>
                                                                {{ HTML::decode(HTML::link($question->question_file_path, HTML::image('webassets/img/icons/download2.png','Download',array('title'=>'Download')),array('class'=>'edit','target'=>'_blank'))) }}
                                                                <?php $file = explode('/',$question->question_file_path); ?>
                                                                {{ HTML::decode(HTML::link('results/delete_question/' .$question->id .'/'. base64_encode($file[3]), HTML::image('webassets/img/icons/trash_can.png','Delete',array('title'=>'Delete')),array('class'=>'delete'))) }}
                                                            </td>
                                                        </tr>
                                                      @endforeach
                                                    @endif
                                                    </tbody>

                                                    <tfoot>
                                                    <tr>
                                                        <th>S/N</th>
                                                        <th>Title</th>
                                                        <th>Subject</th>
                                                        <th>Class</th>
                                                        <th>Author</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                    </tfoot>
                                                </table>

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
