<!DOCTYPE html>
<html>
  <head>
    <title>PIN Slip Receipt</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    {{ HTML::style('css/reset.css') }}
    {{ HTML::style('css/pin_receipt_style.css') }}
  </head>
  <body>
    <div id="container">
      <div class="header">
        <div class="logo">
          {{ HTML::image('img/logo.jpg','logo') }}
        </div>
        <div class="company_name">
          <h1>AR-RAHMAN INTERNATIONAL SCHOOL</h1>
          <h5><span>Motto:</span> IQRA&apos;A BISMIRABBIKAL LAZI KHALAQ</h5>
          <p>Plot 177, R. B. Dikko, Zone A-4, Asokoro, Abuja</p>
        </div>
      </div>
      <hr>
      <div class="content">
        <div class="receipt_badge">
          <span>PIN SLIP</span>
        </div>

        <div class="pin_area">
            <h1><span>{{ $pin->pin_no }}</span></h1>
        </div>

        <div class="instructions">
            <h5>USAGE INSTRUCTIONS</h5>
            <p>Go to the AIS Portal by visiting this URL: {{ HTML::link(URL::base(),URL::base()) }}</p>
            <p>On the portal login page, click the <strong>SIGNUP</strong> link to register by providing some details including this PIN no.</p>
            <p>After you have successfully registered, use your email address and the password you selected during signup to login.<br><br></p>
            <p>Thank you for choosing <strong>AR-RAHMAN INTERNATION SCHOOL.</strong></p>
        </div>
    </div>
  </body>
</html>