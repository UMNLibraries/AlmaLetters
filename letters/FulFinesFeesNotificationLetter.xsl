<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
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
<!--					<h>@@dear@@ </h>-->
					<!--<h3>-->
						<xsl:text>Dear </xsl:text>
						<xsl:value-of select="notification_data/receivers/receiver/user/first_name"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="notification_data/receivers/receiver/user/last_name"/>
						<xsl:text>,</xsl:text>
					<!--</h3>-->

					<br />
					<br />
					
					<xsl:if test="/notification_data/profile_name='student-t2b-14day'">
						<p>Your library account has accrued the amounts listed below and can be paid at your campus library. These amounts will be transferred to your University of Minnesota Student account if they are not paid within the next two weeks.</p>
					</xsl:if>
					
					<xsl:if test="/notification_data/profile_name='student-t2b-14day-first-transfer'">
						<p>Your library account has accrued the amounts listed below and can be paid at your campus library. These amounts will be transferred to your University of Minnesota Student account if they are not paid within the next two weeks.</p>
					</xsl:if>
					
					<xsl:if test="/notification_data/profile_name='student-t2b-3day'">
						<p>Your library account has accrued the amounts listed below and can be paid at your campus library. These amounts will be transferred to your University of Minnesota Student account if they are not paid within the next three days. </p>
					</xsl:if>					
					<xsl:if test="/notification_data/profile_name='student-t2b-3day-first-transfer'">
						<p>Your library account has accrued the amounts listed below and can be paid at your campus library. These amounts will be transferred to your University of Minnesota Student account if they are not paid within the next three days. </p>
					</xsl:if>
					<xsl:if test="/notification_data/profile_name='efs-transfer-first-notice'">
						<p>Your library account has accrued the amounts listed below and can be paid at your campus library. These amounts will be transferred to your University of Minnesota account if they are not paid within the next two weeks. </p>
					</xsl:if>
					<xsl:if test="/notification_data/profile_name='efs-transfer-second-notice'">
						<p>Your library account has accrued the amounts listed below and can be paid at your campus library. These amounts will be transferred to your University of Minnesota account if they are not paid within the next three days. </p>
					</xsl:if>					
			
					
					
					
<!--					<h>@@we_would_like@@ <xsl:value-of select="notification_data/organization_unit/name"/> @@debt_of@@ <b><xsl:value-of select="notification_data/total_fines_amount"/>
					&#160;<xsl:value-of select="notification_data/total_fines_currency"/></b></h>-->
				</td>
				</tr>
				</table>

				<table cellpadding="5" class="listing">
				<xsl:attribute name="style">
					<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>

				<table cellpadding="5" class="listing">
				<xsl:attribute name="style">
					<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>
					<tr>
						<th>@@fee_type@@</th>
						<th>@@fee_amount@@</th>
						<th>@@note@@</th>
					</tr>
					<xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
					<tr>
						<td><xsl:value-of select="fine_fee_type_display"/></td>
						<td><xsl:value-of select="fine_fee_ammount/sum"/>&#160;<xsl:value-of select="fine_fee_ammount/currency"/></td>
						<td><xsl:value-of select="fine_comment"/></td>
					</tr>
					</xsl:for-each>

<!--					<table style="margin:1em 0 1em 0">
						<tbody><tr>
							<td>
								If you have any questions or need assistance, please contact your <a href="https://www.lib.umn.edu/systemlibraries" target="_blank">campus library.</a>
							</td>
						</tr>
						</tbody>
					</table>-->
				</table>
				</table>
				<br></br>
					<p>If you have any questions or need assistance, please contact your <a href="https://www.lib.umn.edu/systemlibraries" target="_blank">campus library.</a></p>
					<br></br>
						<p>@@sincerely@@</p>
						<p>@@department@@</p>
				<br />

				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
				<xsl:call-template name="myAccount" />
				<xsl:call-template name="contactUs" />
				<xsl:call-template name="Disclaimer" />
			</body>
	</html>
</xsl:template>

</xsl:stylesheet>

