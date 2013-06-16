    <!-- Header starts -->
    <div class="row-fluid">
        <div class="span12">

            <div class="header-top">

                <div class="header-wrapper">

                    <a href="#" class="utopia-logo">
                    {{ HTML::image('webassets/img/utopia-logo.png','AIS Portal') }}
                    </a>

                    @if(Auth::check())
                    <div class="header-right">
                        <div class="header-divider">&nbsp;</div>

                        <div class="user-panel header-divider">
                            <div class="user-info">
                                {{ HTML::image('webassets/img/icons/user.png','Avatar') }}
                                <a href="javascript:void(0)">Portal User</a>
                            </div>

                            <div class="user-dropbox">
                                <ul>
                                    <li class="user">{{ HTML::link_to_route('user_profile','Profile') }}</li>
                                    <li class="logout">{{ HTML::link_to_route('user_logout','Logout') }}</li>
                                </ul>
                            </div>

                        </div><!-- User panel end -->

                    </div><!-- End header right -->
                    @endif
                </div><!-- End header wrapper -->

            </div><!-- End header -->

        </div>

    </div>

    <!-- Header ends -->
