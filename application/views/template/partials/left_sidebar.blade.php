<!-- Sidebar start -->
    <div class="span2 sidebar-container">
      <div class="sidebar">

        <div class="navbar sidebar-toggle">
            <div class="container">

                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>

            </div>
        </div>

        <div class="nav-collapse collapse leftmenu">
            <ul>
                <li class="current">
                <a class="dashboard smronju" href="{{ URL::to_route('user_dashboard') }}" title="Dashboard"><span>Dashboard</span></a>
                </li>
                <!-- Navigation -->
                {{ HTML::decode(Menu::navigation_links(Session::get('role_id'))) }}
            </ul>
        </div>

    </div>
</div>

<!-- Sidebar end -->