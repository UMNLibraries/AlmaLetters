<?xml version="1.0" encoding="utf-8"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 

  <xsl:include href="header.xsl" /> 
  <xsl:include href="senderReceiver.xsl" /> 
  <xsl:include href="mailReason.xsl" /> 
  <xsl:include href="footer.xsl" /> 
  <xsl:include href="style.xsl" /> 
  <xsl:include href="recordTitle.xsl" /> 

  <xsl:template match="/"> 
    <!-- Suppress letter generation if request was converted to resource sharing -->
    <xsl:if test="notification_data/request/status_note_display = 'Converted to resource sharing request'"> 
      <xsl:message terminate="yes">Do not send</xsl:message> 
    </xsl:if> 

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
          <xsl:call-template name="bodyStyleCss" /><!-- style.xsl --> 
        </xsl:attribute> 

        <xsl:call-template name="head" /><!-- header.xsl --> 
        <xsl:call-template name="senderReceiver" /><!-- senderReceiver.xsl --> 

        <br /> 
        <xsl:call-template name="toWhomIsConcerned" /><!-- mailReason.xsl --> 

        <div class="messageArea"> 
          <div class="messageBody"> 
            
            <!-- Cancellation Details Table -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0"> 
              <tr> 
                <td>
                  @@on@@&#160;<xsl:value-of select="notification_data/general_data/current_date"/>&#160;@@we_cancel_y_req_of@@&#160;<xsl:value-of select="notification_data/request/create_date"/>&#160;@@detailed_below@@:
                </td>
              </tr> 
              <tr> 
                <td>
                  <xsl:call-template name="recordTitle" /><!-- recordTitle.xsl -->
                </td> 
              </tr> 

              <!-- Request note hidden per institutional preference -->

              <tr> 
                <td>
                  <strong>@@reason_deleting_request@@:&#160;</strong>
                  <xsl:value-of select="notification_data/request/status_note_display"/>
                </td> 
              </tr> 

              <xsl:if test="notification_data/request/cancel_reason != ''"> 
                <tr> 
                  <td>
                    <strong>@@request_cancellation_note@@:&#160;</strong>
                    <xsl:value-of select="notification_data/request/cancel_reason"/>
                  </td> 
                </tr> 
              </xsl:if> 
            </table> 

            <br /> 

            <!-- Signature Table -->
            <table role="presentation" cellspacing="0" cellpadding="2" border="0"> 
              <tr><td>@@sincerely@@</td></tr> 
              <tr><td>@@department@@</td></tr> 
            </table> 

          </div> 
        </div> 

        <xsl:call-template name="lastFooter" /><!-- footer.xsl --> 
      </body> 
    </html> 
  </xsl:template> 
</xsl:stylesheet>
