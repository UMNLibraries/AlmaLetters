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

              <tr> 
                <td> 
                  <strong>@@reminder_message@@</strong> 
                  <br/><br/> 
                </td> 
              </tr> 

              <!-- New Deposits Section -->
              <xsl:if test="count(notification_data/deposit_activity_display/new_deposit_displays/deposit_data_display) > 0"> 
                <tr> 
                  <td> 
                    <h2 style="font-size: 1.2em; margin: 0.5em 0;">
                      @@new_deposits@@
                      <xsl:if test="notification_data/deposit_activity_display/last_run != ''"> 
                        <span style="font-weight: normal; font-size: 0.85em;">&#160;( @@since@@&#160;<xsl:value-of select="notification_data/deposit_activity_display/last_run"/>&#160;)</span> 
                      </xsl:if> 
                    </h2>
                  </td> 
                </tr> 
                <tr> 
                  <td> 
                    <table cellpadding="5" class="listing"> 
                      <xsl:attribute name="style"> 
                        <xsl:call-template name="mainTableStyleCss" /> 
                      </xsl:attribute> 
                      <tr> 
                        <th scope="col">@@deposit_id@@</th> 
                        <th scope="col">@@status@@</th> 
                        <th scope="col">@@title@@</th> 
                        <th scope="col">@@date_created@@</th> 
                        <th scope="col">@@date_updated@@</th> 
                      </tr> 

                      <xsl:for-each select="notification_data/deposit_activity_display/new_deposit_displays/deposit_data_display"> 
                        <tr> 
                          <td><xsl:value-of select="deposit_id"/></td> 
                          <td><xsl:value-of select="status"/></td> 
                          <td><xsl:value-of select="title"/></td> 
                          <td><xsl:value-of select="date_created"/></td> 
                          <td><xsl:value-of select="date_updated"/></td> 
                        </tr> 
                      </xsl:for-each> 
                    </table> 
                  </td> 
                </tr> 
              </xsl:if> 

              <!-- Active Deposits Section -->
              <xsl:if test="count(notification_data/deposit_activity_display/active_deposit_displays/deposit_data_display) > 0"> 
                <tr> 
                  <td> 
                    <h2 style="font-size: 1.2em; margin: 1em 0 0.5em 0;">@@active_deposits@@</h2> 
                  </td> 
                </tr> 
                <tr> 
                  <td> 
                    <table cellpadding="5" class="listing"> 
                      <xsl:attribute name="style"> 
                        <xsl:call-template name="mainTableStyleCss" /> 
                      </xsl:attribute> 
                      <tr> 
                        <th scope="col">@@deposit_id@@</th> 
                        <th scope="col">@@status@@</th> 
                        <th scope="col">@@title@@</th> 
                        <th scope="col">@@date_created@@</th> 
                        <th scope="col">@@date_updated@@</th> 
                      </tr> 

                      <xsl:for-each select="notification_data/deposit_activity_display/active_deposit_displays/deposit_data_display"> 
                        <tr> 
                          <td><xsl:value-of select="deposit_id"/></td> 
                          <td><xsl:value-of select="status"/></td> 
                          <td><xsl:value-of select="title"/></td> 
                          <td><xsl:value-of select="date_created"/></td> 
                          <td><xsl:value-of select="date_updated"/></td> 
                        </tr> 
                      </xsl:for-each> 
                    </table> 
                  </td> 
                </tr> 
              </xsl:if> 

              <!-- Deposit Access Link -->
              <xsl:if test="notification_data/deposit_activity_display/deposit_access_url != ''">
                <tr> 
                  <td style="padding-top: 1.5em;"> 
                    <xsl:variable name="depositUrl"><xsl:value-of select="notification_data/deposit_activity_display/deposit_access_url"/></xsl:variable> 
                    @@click@@&#160;<strong><a href="{$depositUrl}" target="_blank">@@here@@</a></strong>&#160;@@access_deposits@@ 
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

        <!-- footer.xsl --> 
        <xsl:call-template name="lastFooter" /> 
        <xsl:call-template name="myAccount" /> 
        <xsl:call-template name="contactUs" /> 
      </body> 
    </html> 
  </xsl:template> 
</xsl:stylesheet>
