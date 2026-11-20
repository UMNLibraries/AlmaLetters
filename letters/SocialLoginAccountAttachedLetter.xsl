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
        <xsl:call-template name="senderReceiver" /><!-- senderReceiver.xsl -->

        <br />
        <xsl:call-template name="toWhomIsConcerned" /><!-- mailReason.xsl -->

        <div class="messageArea">
          <div class="messageBody">

            <!-- Body Message & Social Login Link -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  <p style="margin: 0 0 0.75em 0;">@@bodyTextBeforeLink@@</p>
                  <xsl:if test="notification_data/alma_social_login_url != ''">
                    <p style="margin: 0;">
                      <a target="_blank" style="color: #23527c; font-weight: bold; text-decoration: underline;">
                        <xsl:attribute name="href">
                          <xsl:value-of select="notification_data/alma_social_login_url" />
                        </xsl:attribute>
                        @@linkLabel@@
                      </a>
                      <xsl:text> </xsl:text>@@bodyTextAfterLink@@
                    </p>
                  </xsl:if>
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
                    <xsl:if test="notification_data/institution/name != ''">
                      <strong><xsl:value-of select="notification_data/institution/name" /></strong><br />
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

        <!-- footer.xsl -->
        <xsl:call-template name="lastFooter" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
