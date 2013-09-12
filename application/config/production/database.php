<?php

return array(
	/*
	|--------------------------------------------------------------------------
	| Database Connections
	|--------------------------------------------------------------------------
	|
	| All of the database connections used by your application. Many of your
	| applications will no doubt only use one connection; however, you have
	| the freedom to specify as many connections as you can handle.
	|
	| All database work in Laravel is done through the PHP's PDO facilities,
	| so make sure you have the PDO drivers for your particular database of
	| choice installed on your machine.
	|
	*/

	'connections' => array(
		'mysql' => array(
			'driver'   => 'mysql',
			'host'     => 'mysql.ais.sch.ng',
			'database' => 'aisportaldbcore',
			'username' => 'aisportaldbuser',
			'password' => 'ais@portal',
			'charset'  => 'utf8',
			'prefix'   => '',
		),
	),

);