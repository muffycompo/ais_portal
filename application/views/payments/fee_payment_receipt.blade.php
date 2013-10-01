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
		<div id="customer">
            <table id="meta">
                <tr>
                    <td class="meta-head">Receipt #</td>
                    <td><div class="ta">{{ $payment->receipt_no }}</div></td>
                </tr>
                <tr>

                    <td class="meta-head">Date</td>
                    <td><div id="date" class="ta">{{ Ais::reverse_db_date($payment->date_of_payment) }}</div></td>
                </tr>
                <tr>
                    <td class="meta-head">Amount Paid</td>
                    <td><div class="due">N {{ Ais::format_to_currency($payment->paid_amount) }}</div></td>
                </tr>

            </table>

		</div>

		<table id="items">

		  <tr>
		      <th colspan="5">PAYMENT RECEIPT</th>
		  </tr>

		  <tr>
		      <td colspan="5">&nbsp;</td>
		  </tr>

		  <tr class="item-row">
		      <td class="item-name">Received from:</td>
		      <td class="description" colspan="4"><strong>{{ $payment->firstname . ' ' . $payment->surname }}</strong></td>
		  </tr>

		  <tr class="item-row">
		      <td class="item-name">Amount in words:</td>
		      <td class="description" colspan="4"><strong>{{ Ais::amount_to_words($payment->paid_amount) }} Naira Only.</strong></td>
		  </tr>

		  <tr class="item-row">
		      <td class="item-name">Being Payment for:</td>
		      <td class="description" colspan="4"><strong>{{ Expand::payment_category($payment->payment_category_id) }}</strong></td>
		  </tr>

		  <tr class="item-row">
		      <td class="item-name"></td>
		      <td class="description"></td>
		      <td></td>
		      <td colspan="2"></td>
		  </tr>

		  <tr id="hiderow">
		    <td colspan="5"></td>
		  </tr>

		  <tr>
		      <td colspan="2" class="blank"> </td>
		      <td colspan="2" class="total-line" nowrap>Received By:</td>
		      <td class="total-value"><strong>{{ $payment->accountant_name }}</strong></td>
		  </tr>
		  <tr>
		      <td colspan="2" class="blank"> </td>
		      <td colspan="2" class="total-line" nowrap>Signature</td>
		      <td class="total-value"><strong>{{ $payment->accountant_name }}</strong></td>
		  </tr>
		</table>

		<div id="terms">
		  <h5>Thank You</h5>
		  <p>Thank you for choosing <strong>AR-Rahman Internation School</strong>, we assure you that you have made the right descision.</p>
		</div>

	</div>

</body>

</html>
