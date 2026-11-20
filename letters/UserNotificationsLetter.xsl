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

        <!-- Greeting Salutation -->
        <table role="presentation" cellspacing="0" cellpadding="5" border="0">
          <tr>
            <td>
              <p style="margin: 0;">@@Dear@@</p>
            </td>
          </tr>
        </table>

        <div class="messageArea">
          <div class="messageBody">

            <!-- Password Change Notification Body -->
            <xsl:if test="notification_data/notification_type = 'NOTIFY_PASSWORD_CHANGE'">
              <table role="presentation" cellspacing="0" cellpadding="5" border="0">
                <tr>
                  <td>
                    <p style="margin: 0;">
                      @@Line_1@@
                      <xsl:if test="notification_data/temp_password != ''">
                        <xsl:text> </xsl:text><strong><xsl:value-of select="notification_data/temp_password" /></strong>
                      </xsl:if>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td>
                    <p style="margin: 0;">@@Line_2@@</p>
                  </td>
                </tr>
              </table>
            </xsl:if>

            <br />

            <!-- Signature & Organization Unit Address Block -->
            <table role="presentation" cellspacing="0" cellpadding="2" border="0">
              <tr>
                <td>@@Sincerely@@</td>
              </tr>
              <tr>
                <td>
                  <address style="font-style: normal; line-height: 1.4; color: #333333;">
                    <xsl:if test="notification_data/organization_unit/name != ''">
                      <strong><xsl:value-of select="notification_data/organization_unit/name" /></strong><br />
                    </xsl:if>
                    <xsl:if test="notification_data/organization_unit/address/line1 != ''">
                      <xsl:value-of select="notification_data/organization_unit/address/line1" /><br />
                    </xsl:if>
                    <xsl:if test="notification_data/organization_unit/address/line2 != ''">
                      <xsl:value-of select="notification_data/organization_unit/address/line2" /><br />
                    </xsl:if>
                    <xsl:if test="notification_data/organization_unit/address/line3 != ''">
                      <xsl:value-of select="notification_data/organization_unit/address/line3" /><br />
                    </xsl:if>
                    <xsl:if test="notification_data/organization_unit/address/line4 != ''">
                      <xsl:value-of select="notification_data/organization_unit/address/line4" /><br />
                    </xsl:if>
                    <xsl:if test="notification_data/organization_unit/address/line5 != ''">
                      <xsl:value-of select="notification_data/organization_unit/address/line5" /><br />
                    </xsl:if>
                    <xsl:if test="notification_data/organization_unit/address/city != ''">
                      <xsl:value-of select="notification_data/organization_unit/address/city" />
                      <xsl:if test="notification_data/organization_unit/address/country != ''">, </xsl:if>
                    </xsl:if>
                    <xsl:if test="notification_data/organization_unit/address/country != ''">
                      <xsl:value-of select="notification_data/organization_unit/address/country" />
                    </xsl:if>
                  </address>
                </td>
              </tr>
            </table>

          </div>
        </div>

        <!-- footer.xsl -->
        <xsl:call-template name="lastFooter" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
