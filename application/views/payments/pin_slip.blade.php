<!DOCTYPE html>

<head>
	<title>PIN Slip Receipt</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    {{ HTML::style('webassets/receipts/css/receipt_style.css') }}
    {{ HTML::style('webassets/receipts/css/print.css',array('media'=>'print')) }}
</head>

<body>

	<div id="page-wrap">
		<div id="identity">
            <div id="logo">
              {{ HTML::image('webassets/receipts/images/logo.png','Logo') }}
            </div>
		</div>

		<div style="clear:both"></div>
		<hr />


		<table id="items">

		  <tr>
		      <th colspan="5">PIN SLIP</th>
		  </tr>

		  <tr class="item-row">
		      <td class="description" colspan="5" style="text-align: center;"><h1>{{ $pin->pin_no }}</h1></td>
		  </tr>

		  <tr id="hiderow">
		    <td colspan="5"></td>
		  </tr>
		</table>

		<div id="terms">
            <h5>USAGE INSTRUCTIONS</h5>
        </div>
        <p>
            <ol id="instructions">
                <li>Visit the AR-Rahman International School Portal using this URL: &nbsp;<strong>{{ URL::base() }}</strong></li>
                <li>On the portal login page, click the <strong>SIGNUP</strong> link to register by providing some details including this <strong>PIN Number</strong>.</li>
                <li>After you have successfully signed up, use your email address and the password selected during signup to login.</li>
            <ol>
        </p>

        <p><br><strong>NOTE:</strong> If you encounter any difficulties while completing your application, send an email to <strong>support@ais.sch.ng</strong> or call our support line <strong>08012341234</strong>.</p>


	</div>

</body>

</html>
