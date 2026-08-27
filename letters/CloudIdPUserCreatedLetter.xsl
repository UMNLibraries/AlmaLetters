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

        <xsl:call-template name="head" /> <!-- header.xsl --> 
        <xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl --> 
        <br /> 
        <xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl --> 

        <div class="messageArea"> 
          <div class="messageBody"> 
            
            <!-- Account Credentials Table -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0"> 
              <tr> 
                <td> 
                  @@text1@@ 
                </td> 
              </tr> 
              <tr> 
                <td> 
                  @@username@@&#160;<xsl:value-of select="notification_data/username" /> 
                </td> 
              </tr> 
              <tr> 
                <td> 
                  @@password@@&#160;<span id="DO_NOT_REMOVE_OR_MOVE_PASSWORD"><xsl:value-of select="notification_data/password" /></span> 
                </td> 
              </tr> 
              <tr> 
                <td> 
                  @@text2@@ 
                </td> 
              </tr> 
            </table> 

            <br /> 

            <!-- Signature & Institution Address Block -->
            <table role="presentation" cellspacing="0" cellpadding="2" border="0"> 
              <tr> 
                <td>@@signature@@</td> 
              </tr> 
              <tr> 
                <td> 
                  <address style="font-style: normal; line-height: 1.4; color: #333333;"> 
                    <strong><xsl:value-of select="notification_data/institution/name" /></strong><br/> 
                    <xsl:if test="notification_data/institution/address/line1 != ''"> 
                      <xsl:value-of select="notification_data/institution/address/line1" /><br/> 
                    </xsl:if> 
                    <xsl:if test="notification_data/institution/address/line2 != ''"> 
                      <xsl:value-of select="notification_data/institution/address/line2" /><br/> 
                    </xsl:if> 
                    <xsl:if test="notification_data/institution/address/line3 != ''"> 
                      <xsl:value-of select="notification_data/institution/address/line3" /><br/> 
                    </xsl:if> 
                    <xsl:if test="notification_data/institution/address/line4 != ''"> 
                      <xsl:value-of select="notification_data/institution/address/line4" /><br/> 
                    </xsl:if> 
                    <xsl:if test="notification_data/institution/address/line5 != ''"> 
                      <xsl:value-of select="notification_data/institution/address/line5" /><br/> 
                    </xsl:if> 
                    <xsl:if test="notification_data/institution/address/city != ''"> 
                      <xsl:value-of select="notification_data/institution/address/city" /> 
                      <xsl:if test="notification_data/institution/address/country != ''">, </xsl:if> 
                    </xsl:if> 
                    <xsl:if test="notification_data/institution/address/country != ''"> 
                      <xsl:value-of select="notification_data/institution/address/country" /> 
                    </xsl:if> 
                  </address> 
                </td> 
              </tr> 
            </table> 
          </div> 
        </div> 

        <xsl:call-template name="lastFooter" /> <!-- footer.xsl --> 
      </body> 
    </html> 
  </xsl:template> 
</xsl:stylesheet>
