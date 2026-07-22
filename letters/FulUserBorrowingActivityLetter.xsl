<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="mailReason.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />
  <xsl:include href="recordTitle.xsl" />

  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="generalStyle" />
      </head>
      <body>
        <xsl:attribute name="style">
          <xsl:call-template name="bodyStyleCss" /><!-- style.xsl -->
        </xsl:attribute>

        <xsl:call-template name="head" /><!-- header.xsl -->
        <xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

		<br />
		<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->


        <div class="messageArea">
          <div class="messageBody">

			<table cellspacing="0" cellpadding="3" border="0">

<!--
	              <tr>
	              	<td>
						@@reminder_message@@
						<br/><br/>
	                </td>
	              </tr>
Replacing this section due to 100 loan limit
-->

<!--
This is the start of the new section for the 100 loan limit
-->
				<tr>
					<td><br/>
						Thank you for using the resources of the University of Minnesota libraries! As a monthly courtesy, we provide a report of up to 100 loans currently checked out to you. To find your complete list of current loans, check <a href="http://www.lib.umn.edu/systemlibraries">My Account</a> online.  If you have any questions about returning, renewing items or fines assessments, <a href="https://www.lib.umn.edu/systemlibraries">please contact us at your campus library</a>.
					</td>
				</tr>
				<tr>
					<td>
						As always, your campus library staff is willing to help with your library and research needs.
						<br/><br/>
					</td>
				</tr>
<!--
This is the end of the new section for the 100 loan limit
-->


		 <xsl:if test="notification_data/item_loans/item_loan or notification_data/overdue_item_loans/item_loan">

	              <xsl:if test="notification_data/overdue_item_loans/item_loan">

		              <tr>
		              	<td>
							<b>@@overdue_loans@@</b>
		                </td>
		              </tr>

		              <tr>
		                <td>
		                	<table cellpadding="3" class="listing">
								<xsl:attribute name="style">
									<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
								</xsl:attribute>
								<tr>
									<th width="30%">@@title@@</th>
									<th width="10%">@@description@@</th>
									<th width="20%">@@author@@</th>
									<th width="10%">@@fine@@</th>
									<th width="10%">@@due_date@@</th>
									<th width="20%">@@library@@</th>
								</tr>

		                		<xsl:for-each select="notification_data/overdue_item_loans/item_loan"><xsl:sort select="due_date" order="ascending"/> 
								<tr>
									<td><xsl:value-of select="title"/></td>
									<td><xsl:value-of select="description"/></td>
									<td><xsl:value-of select="author"/></td>
									<td><xsl:value-of select="barcode"/></td>
									<td><xsl:value-of select="due_date"/></td>
									<td><xsl:value-of select="library_name"/></td>
								</tr>
								</xsl:for-each>
		                	</table>
		                	<br/>
		                </td>
	              	</tr>

	              </xsl:if>

	              <xsl:if test="notification_data/item_loans/item_loan">

		              <tr>
		              	<td>
							<b>@@loans@@</b>
		                </td>
		              </tr>

		              <tr>
		                <td>
		                	<table cellpadding="3" class="listing">
								<xsl:attribute name="style">
									<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
								</xsl:attribute>
								<tr>
									<th width="30%">@@title@@</th>
									<th width="10%">@@description@@</th>
									<th width="20%">@@author@@</th>
									<th width="10%">@@fine@@</th>
									<th width="10%">@@due_date@@</th>
									<th width="20%">@@library@@</th>
								</tr>

		                		<xsl:for-each select="notification_data/item_loans/item_loan"><xsl:sort select="due_date" order="ascending"/> 
								<tr>
									<td><xsl:value-of select="title"/></td>
									<td><xsl:value-of select="description"/></td>
									<td><xsl:value-of select="author"/></td>
									<td><xsl:value-of select="barcode"/></td>
									<td><xsl:value-of select="due_date"/></td>
									<td><xsl:value-of select="library_name"/></td>
								</tr>
								</xsl:for-each>
            </table>

		                </td>
		              </tr>

		      		</xsl:if>

			  </xsl:if>

<!--
This is the start of the section for fees-->	


			  <xsl:if test="notification_data/organization_fee_list/string">


<p><b>Library Fines and Fees</b></p>
	              <tr>
	              	<td>
						@@debt_message@@
	                </td>
	              </tr>
                      <br />
	              <xsl:for-each select="notification_data/organization_fee_list/string">
	              	<tr>
						<td><xsl:value-of select="."/></td>
					</tr>
	              </xsl:for-each>

				  <tr>
	              	<td>
						<b>
						@@total@@ <xsl:value-of select="notification_data/total_fee"/>
						</b>
	                </td>
	              </tr>

			  </xsl:if>
			 
<!--This is the end of the section for fees
-->			  
             </table>

			<br />

			<table>
				<tr><td>@@sincerely@@</td></tr>
				<tr><td>@@department@@</td></tr>
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
