<?xml version="1.0" encoding="utf-8"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 

  <xsl:include href="header.xsl" /> 
  <xsl:include href="senderReceiver.xsl" /> 
  <xsl:include href="mailReason.xsl" /> 
  <xsl:include href="footer.xsl" /> 
  <xsl:include href="style.xsl" /> 
  <xsl:include href="recordTitle.xsl" /> 

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
          <xsl:call-template name="bodyStyleCss" /><!-- style.xsl --> 
        </xsl:attribute> 

        <xsl:call-template name="head" /><!-- header.xsl --> 
        <xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl --> 

        <br /> 
        <xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl --> 

        <div class="messageArea"> 
          <div class="messageBody"> 

            <table role="presentation" cellspacing="0" cellpadding="5" border="0"> 
              <xsl:variable name="depositStatus"><xsl:value-of select="notification_data/deposit/status"/></xsl:variable> 
              
              <tr><td>@@your_deposit@@&#160;&#34;<xsl:value-of select="notification_data/deposit/title"/>&#34;</td></tr> 
              <tr><td>@@has_been@@&#160;<xsl:value-of select="$depositStatus"/></td></tr> 
              <tr><td>@@deposit_id@@&#160;<xsl:value-of select="notification_data/deposit/deposit_id"/></td></tr> 

              <xsl:choose> 
                <xsl:when test="$depositStatus = 'APPROVED'"> 
                  <xsl:variable name="deliveryUrl"><xsl:value-of select="notification_data/deposit/delivery_url"/></xsl:variable> 
                  <xsl:if test="$deliveryUrl != ''">
                    <tr><td>@@view_deposit@@&#160;<a href="{$deliveryUrl}" target="_blank"><xsl:value-of select="notification_data/deposit/title"/></a></td></tr> 
                  </xsl:if>
                  
                  <xsl:variable name="note"><xsl:value-of select="notification_data/deposit/status_update/note"/></xsl:variable> 
                  <xsl:if test="$note != ''"> 
                    <tr><td>@@note@@&#160;<xsl:value-of select="$note"/></td></tr> 
                  </xsl:if> 
                </xsl:when> 

                <xsl:when test="$depositStatus = 'RETURNED' or $depositStatus = 'DECLINED'"> 
                  <xsl:variable name="reason"><xsl:value-of select="notification_data/deposit/status_update/reason"/></xsl:variable> 
                  <xsl:variable name="note"><xsl:value-of select="notification_data/deposit/status_update/note"/></xsl:variable> 
                  <xsl:if test="$reason != ''"> 
                    <tr><td>@@reason@@&#160;<xsl:value-of select="$reason"/></td></tr> 
                  </xsl:if> 
                  <xsl:if test="$note != ''"> 
                    <tr><td>@@note@@&#160;<xsl:value-of select="$note"/></td></tr> 
                  </xsl:if> 
                </xsl:when> 
              </xsl:choose> 
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
        <xsl:call-template name="myAccount" /> 
        <xsl:call-template name="contactUs" /> 
      </body> 
    </html> 
  </xsl:template> 
</xsl:stylesheet>
