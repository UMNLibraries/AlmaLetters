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

        <!-- Header Line Banner -->
        <table role="presentation" cellspacing="0" cellpadding="5" border="0"> 
          <tr> 
            <td> 
              <!-- Converted h3 to semantic h2 heading -->
              <h2 style="font-size: 1.3em; margin: 0.5em 0; color: #333333;">@@header_line@@</h2> 
            </td> 
          </tr> 
        </table> 

        <div class="messageArea"> 
          <div class="messageBody"> 

            <table role="presentation" cellspacing="0" cellpadding="5" border="0"> 
              <tr> 
                <td> 
                  <strong>@@first_line@@</strong> 
                </td> 
              </tr> 
            </table> 

            <!-- Request Details Table -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0"> 
              <xsl:attribute name="style"> 
                <xsl:call-template name="listStyleCss" /> <!-- style.xsl --> 
              </xsl:attribute> 

              <xsl:if test="notification_data/request/external_request_id != ''">
                <tr> 
                  <td> 
                    <strong>@@request_id@@:&#160;</strong> 
                    <xsl:value-of select="notification_data/request/external_request_id" /> 
                  </td> 
                </tr> 
              </xsl:if>

              <xsl:if test="notification_data/request/display/title != ''">
                <tr> 
                  <td> 
                    <strong>@@title@@:&#160;</strong> 
                    <xsl:value-of select="notification_data/request/display/title" /> 
                  </td> 
                </tr> 
              </xsl:if>

              <xsl:if test="notification_data/request/display/author != ''">
                <tr> 
                  <td> 
                    <strong>@@author@@:&#160;</strong> 
                    <xsl:value-of select="notification_data/request/display/author" /> 
                  </td> 
                </tr> 
              </xsl:if>

              <xsl:if test="notification_data/request/create_date != ''">
                <tr> 
                  <td> 
                    <strong>@@request_date@@:&#160;</strong> 
                    <xsl:value-of select="notification_data/request/create_date" /> 
                  </td> 
                </tr> 
              </xsl:if>
            </table> 

            <br /> 

            <!-- External URL & Patron Note Block -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0"> 
              <xsl:if test="notification_data/external_url != ''"> 
                <tr> 
                  <td> 
                    <strong>@@url_message@@:&#160;</strong> 
                  </td> 
                </tr> 
                <tr> 
                  <td> 
                    <a href="{notification_data/external_url}" target="_blank">
                      <xsl:value-of select="notification_data/external_url" />
                    </a> 
                  </td> 
                </tr> 
              </xsl:if> 

              <xsl:if test="notification_data/note_to_patron != ''">
                <tr> 
                  <td> 
                    <strong><xsl:value-of select="notification_data/note_to_patron" /></strong> 
                  </td> 
                </tr> 
              </xsl:if>
            </table> 

            <br />

            <!-- Signature & Library Address Block -->
            <table role="presentation" cellspacing="0" cellpadding="2" border="0"> 
              <tr> 
                <td>@@signature@@</td> 
              </tr> 
              <tr> 
                <td> 
                  <address style="font-style: normal; line-height: 1.4; color: #333333;"> 
                    <strong><xsl:value-of select="notification_data/library/name" /></strong><br/> 
                    <xsl:if test="notification_data/library/address/line1 != ''"> 
                      <xsl:value-of select="notification_data/library/address/line1" /><br/> 
                    </xsl:if> 
                    <xsl:if test="notification_data/library/address/line2 != ''"> 
                      <xsl:value-of select="notification_data/library/address/line2" /><br/> 
                    </xsl:if> 
                    <xsl:if test="notification_data/library/address/line3 != ''"> 
                      <xsl:value-of select="notification_data/library/address/line3" /><br/> 
                    </xsl:if> 
                    <xsl:if test="notification_data/library/address/line4 != ''"> 
                      <xsl:value-of select="notification_data/library/address/line4" /><br/> 
                    </xsl:if> 
                    <xsl:if test="notification_data/library/address/line5 != ''"> 
                      <xsl:value-of select="notification_data/library/address/line5" /><br/> 
                    </xsl:if> 
                    <xsl:if test="notification_data/library/address/city != ''"> 
                      <xsl:value-of select="notification_data/library/address/city" /> 
                      <xsl:if test="notification_data/library/address/country != ''">, </xsl:if> 
                    </xsl:if> 
                    <xsl:if test="notification_data/library/address/country != ''"> 
                      <xsl:value-of select="notification_data/library/address/country" /><br/> 
                    </xsl:if> 
                    <xsl:if test="notification_data/signature_email != ''"> 
                      <a href="mailto:{notification_data/signature_email}" style="color: #0056b3; text-decoration: underline;">
                        <xsl:value-of select="notification_data/signature_email" />
                      </a> 
                    </xsl:if> 
                  </address> 
                </td> 
              </tr> 
            </table> 

          </div> 
        </div> 

        <xsl:call-template name="lastFooter" /><!-- footer.xsl --> 
      </body> 
    </html> 
  </xsl:template> 
</xsl:stylesheet>
