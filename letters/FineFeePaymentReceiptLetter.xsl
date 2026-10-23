<?xml version="1.0" encoding="utf-8"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 

  <xsl:include href="header.xsl" /> 
  <xsl:include href="senderReceiver.xsl" /> 
  <xsl:include href="mailReason.xsl" /> 
  <xsl:include href="footer.xsl" /> 
  <xsl:include href="style.xsl" /> 

  <xsl:template match="/"> 
    <html lang="en"> 
      <xsl:if test="notification_data/languages/string"> 
        <xsl:attribute name="lang"> 
          <xsl:value-of select="notification_data/languages/string"/> 
        </xsl:attribute> 
      </xsl:if> 

      <head> 
        <title> 
          <xsl:value-of select="notification_data/general_data/subject"/> 
        </title> 

        <xsl:call-template name="generalStyle" /> 
      </head> 

      <body> 
        <xsl:attribute name="style"> 
          <xsl:call-template name="bodyStyleCss" /> <!-- style.xsl --> 
        </xsl:attribute> 

        <xsl:call-template name="head" /> <!-- header.xsl --> 
        <xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl --> 

        <br /> 
        <xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl --> 

        <div class="messageArea"> 
          <div class="messageBody"> 

            <xsl:if test="notification_data/transaction_id != ''"> 
              <!-- Converted h4 to semantic h2 heading -->
              <h2 style="font-size: 1.2em; margin: 0.5em 0; color: #333333;">
                @@transaction_id@@:&#160;<xsl:value-of select="/notification_data/transaction_id"/>
              </h2> 
            </xsl:if> 

            <xsl:for-each select="notification_data/labels_list"> 
              <table role="presentation" cellspacing="0" cellpadding="5" border="0"> 
                <tr> 
                  <td><xsl:value-of select="letter.fineFeePaymentReceiptLetter.message"/></td> 
                </tr> 
              </table> 
              <br /> 
            </xsl:for-each> 

            <!-- Payment Listing Table -->
            <table cellpadding="5" class="listing"> 
              <xsl:attribute name="style"> 
                <xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl --> 
              </xsl:attribute> 
              <tr> 
                <th scope="col">@@fee_type@@</th> 
                <th scope="col">@@payment_date@@</th> 
                <th scope="col" style="text-align: right;">@@paid_amount@@</th> 
                <th scope="col">@@payment_method@@</th> 
                <th scope="col">@@note@@</th> 
              </tr> 
              <xsl:for-each select="notification_data/user_fines_fees_list/user_fines_fees"> 
                <tr> 
                  <td><xsl:value-of select="fine_fee_type_display"/></td> 
                  <td><xsl:value-of select="create_date"/></td> 
                  <td align="right" style="text-align: right;">
                    <xsl:value-of select="fines_fee_transactions/fines_fee_transaction/transaction_ammount/currency"/>&#160;<xsl:value-of select="fines_fee_transactions/fines_fee_transaction/transaction_amount_display"/>
                  </td> 
                  <td><xsl:value-of select="fines_fee_transactions/fines_fee_transaction/transaction_method"/></td> 
                  <td><xsl:value-of select="fines_fee_transactions/fines_fee_transaction/transaction_note"/></td> 
                </tr> 
              </xsl:for-each> 

              <!-- Total Row with Balanced Column Count -->
              <tr> 
                <td>&#160;</td> 
                <td align="right" style="text-align: right;"><strong>@@total@@:</strong></td> 
                <td align="right" style="text-align: right;"><strong><xsl:value-of select="notification_data/total_amount_paid"/></strong></td> 
                <td colspan="2">&#160;</td> 
              </tr> 
            </table> 

            <br /> 

            <!-- Signature Table -->
            <table role="presentation" cellspacing="0" cellpadding="2" border="0"> 
              <tr><td>@@sincerely@@</td></tr> 
              <tr><td>@@department@@</td></tr> 
            </table> 

          </div> 
        </div> 

        <!-- footer.xsl --> 
        <xsl:call-template name="lastFooter" /> 
        <xsl:call-template name="contactUs" /> 
      </body> 
    </html> 
  </xsl:template> 
</xsl:stylesheet>
