<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />

<xsl:template match="/">
	<html>
		<head>
		<xsl:call-template name="generalStyle" />
		</head>

			<body>
			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>

				<xsl:call-template name="head" /> <!-- header.xsl -->
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

				<br />

				<table cellspacing="0" cellpadding="5" border="0">
				<tr>
				<td>
					<h>@@inform_you_item_below@@ </h>
					<h>@@borrowed_by_you@@ @@decalred_as_lost@@</h>
				</td>
				</tr>
				</table>

				<table cellpadding="5" class="listing">
				<xsl:attribute name="style">
					<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>


		              <tr>
		                <td>
		                	<table cellpadding="3" class="listing">
								<xsl:attribute name="style">
									<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
								</xsl:attribute>
								<tr>
									<th width="20%">@@lost_item@@</th>
									<th width="10%">@@description@@</th>
									<th width="15%">@@by@@</th>
									<th width="20%">@@barcode@@</th>
									<th width="10%">@@loan_date@@</th>
									<th width="10%">@@due_date@@</th>
									<th width="15%">@@library@@</th>
								</tr>

		                		<xsl:for-each select="notification_data"> 
								<tr>
									<td><xsl:value-of select="item_loan/title"/></td>
									<td><xsl:value-of select="item_loan/description"/></td>
									<td><xsl:value-of select="item_loan/author"/></td>
									<td><xsl:value-of select="item_loan/barcode"/></td>
									<td><xsl:value-of select="item_loan/loan_date"/></td>
									<td><xsl:value-of select="item_loan/due_date"/></td>
									<td><xsl:value-of select="organization_unit/name"/></td>
								</tr>
								</xsl:for-each>
		                	</table>
		                	<br/>
		                </td>
	              	</tr>

				
				<br />
				<br />
				@@additional_info_1@@
				<br />
				@@additional_info_2@@
				<br />

<table style="margin:1em 0 1em 0">
  <tbody><tr>
    <td>
      If you have any questions or if we can assist you further, <a href="https://www.lib.umn.edu/systemlibraries" target="_blank">please contact us at your campus library.</a>
    </td>
  </tr>
 </tbody>
</table>

				<table>

						<tr><td>@@sincerely@@</td></tr>
						<tr><td>@@department@@</td></tr>

				</table>
				</table>
				<br />

				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
        <xsl:call-template name="myAccount" />
		<xsl:call-template name="contactUs" />
        <xsl:call-template name="Disclaimer" />
			</body>
	</html>
</xsl:template>

</xsl:stylesheet>