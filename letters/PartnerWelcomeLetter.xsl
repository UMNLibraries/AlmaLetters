<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />
  <xsl:include href="mailReason.xsl" />

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
        <br />
        <xsl:call-template name="toWhomIsConcerned" /><!-- mailReason.xsl -->

        <div class="messageArea">
          <div class="messageBody">

            <!-- Welcome & Account Credentials Table -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  <p style="margin: 0;">@@welcome_message@@</p>
                </td>
              </tr>
              <tr>
                <td>
                  <p style="margin: 0;">@@additional_info_1@@</p>
                </td>
              </tr>

              <xsl:if test="notification_data/user/user_name != ''">
                <tr>
                  <td>
                    @@user_id@@: <strong><xsl:value-of select="notification_data/user/user_name"/></strong>
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/user_password != ''">
                <tr>
                  <td>
                    @@user_password@@: <strong><xsl:value-of select="notification_data/user_password"/></strong>
                  </td>
                </tr>
              </xsl:if>

              <tr>
                <td>
                  <p style="margin: 0;">
                    @@additional_info_2@@&#160;
                    <a href="@@library_homepage_link@@" target="_blank" style="color: #23527c; font-weight: bold; text-decoration: underline;">
                      @@library_homepage@@
                    </a>
                  </p>
                </td>
              </tr>
              <tr>
                <td>
                  <p style="margin: 0;">@@additional_info_3@@</p>
                </td>
              </tr>
              <tr>
                <td>
                  <p style="margin: 0;">@@closing_message@@</p>
                </td>
              </tr>
            </table>

            <br />

            <!-- Signature Table -->
            <table role="presentation" cellspacing="0" cellpadding="2" border="0">
              <tr>
                <td>@@sincerely@@</td>
              </tr>
              <tr>
                <td>@@department@@</td>
              </tr>
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
