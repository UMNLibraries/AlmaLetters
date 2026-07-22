<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl" />
	<xsl:include href="senderReceiver.xsl" />
	<xsl:include href="footer.xsl" />
	<xsl:include href="style.xsl" />
	<xsl:include href="mailReason.xsl" />
	<xsl:include href="recordTitle.xsl" />

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
				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->

				<div class="messageArea">
					<div class="messageBody">
						<table cellspacing="0" cellpadding="5" border="0">
<!--							<tr>
								<td>
									@@we_sent@@
									<b>
										<xsl:value-of select="notification_data/request/create_date" />
									</b>
									.
								</td>
							</tr>
							<tr>
								<td>@@following_details@@ : </td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="recordTitle" />
								</td>
							</tr>

							<tr>
								<td>
									<b>@@delivered_to@@ : </b>
									<xsl:value-of select="notification_data/delivery_address" />
								</td>
							</tr>

							<tr>
								<td>
									<b>@@due_date@@ : </b>
									<xsl:value-of select="notification_data/due_date" />
								</td>
							</tr>-->
						</table>
						<br />
						<table>

<!--
This is the start of the new section for the new language
-->
				<tr>
					<td><br/>
						Thank you for requesting materials through our mail delivery service. The item below has been loaned to your account, and we are in the process of shipping it to you.
					</td>
				</tr>
				<tr>								<td><br/>
									<xsl:call-template name="recordTitle" />
								</td>
				<tr>								<td><br/>
									<xsl:value-of select="notification_data/phys_item_display/available_items/available_item/barcode"/>
								</td>
							</tr>
			       </tr>
					<td><br/>
						We anticipate your item should arrive within 5–10 business days.
					</td>

<!--
This is the end of the new section for the new language
-->

><tr>
    <td><br/>
      If you have any questions or if we can assist you further, <a href="https://www.lib.umn.edu/systemlibraries" target="_blank">please contact us at your campus library.</a>
    </td>
  </tr>


							<tr><br/><br/>
								<td>@@sincerely@@</td>
							</tr>
							<tr><br/>
								<td>@@department@@</td>
							</tr>

						</table>
					</div>
				</div>
        <!-- footer.xsl -->
        <xsl:call-template name="lastFooter" />
        <xsl:call-template name="myAccount" />
		<xsl:call-template name="contactUs" />
        <xsl:call-template name="Disclaimer" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
