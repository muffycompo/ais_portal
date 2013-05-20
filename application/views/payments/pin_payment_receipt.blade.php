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
          <span>PAYMENT RECEIPT</span>
        </div>

        <div class="receipt_meta cf">
          <div class="fl receipt_no">{{ $payment->receipt_no }}</div>
          <div class="fr receipt_date">DATE:<span class="lines ddate">{{ Ais::reverse_db_date($payment->payment_date) }}</span></div>
        </div>

        <div class="receipt_amount cf">
          <div class="fl received">RECEIVED FROM:<span class="lines dpaymentby">&nbsp;&nbsp;&nbsp;{{ $payment->applicant_firstname . ' ' . $payment->applicant_surname }}&nbsp;&nbsp;&nbsp;</span></div>
          <div class="fr amount_digit"><strong>N</strong>&nbsp;<span class="amount_badge">{{ Ais::format_to_currency($payment->amount) }}</span></div>
        </div>

        <div class="receipt_payment">
          <span class="lines amount_words">&nbsp;&nbsp;&nbsp;{{ Ais::amount_to_words($payment->amount) }} NAIRA&nbsp;&nbsp;&nbsp;</span>
        </div>
        <div class="payment_for">BEING PAYMENT FOR:<span class="lines receipt_payment_for">&nbsp;&nbsp;&nbsp;Application PIN Slip&nbsp;&nbsp;&nbsp;</span></div>
      </div>

      <div class="footer">
        <div class="accountant">RECEIVED BY:<span class="lines received_by">{{ $payment->accountant }}</span></div>
      </div>
    </div>
  </body>
</html>