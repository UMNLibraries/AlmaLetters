<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="mailReason.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />

  <xsl:variable name="conta1">0</xsl:variable>
  <xsl:variable name="stepType" select="/notification_data/request/work_flow_entity/step_type" />
  <xsl:variable name="externalRequestId" select="/notification_data/external_request_id" />
  <xsl:variable name="externalSystem" select="/notification_data/external_system" />

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

            <!-- Trial Notification Details -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  <p style="margin: 0;">
                    @@introduction_body_thanks@@:
                    <xsl:if test="notification_data/trial/title != ''">
                      <xsl:text> </xsl:text><strong><xsl:value-of select="notification_data/trial/title" /></strong>
                    </xsl:if>.
                  </p>
                </td>
              </tr>

              <xsl:if test="notification_data/participant_url != ''">
                <tr>
                  <td>
                    <p style="margin: 0;">
                      <strong>@@link@@:</strong>&#160;<a target="_blank" style="color: #23527c; font-weight: bold; text-decoration: underline;">
                        <xsl:attribute name="href">
                          <xsl:value-of select="notification_data/participant_url" />
                        </xsl:attribute>
                        <xsl:value-of select="notification_data/trial/title" />
                      </a>
                    </p>
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/trial/electronic_collection != ''">
                <tr>
                  <td>
                    <p style="margin: 0;">
                      <strong>@@linkToCollection@@:</strong>&#160;<a target="_blank" style="color: #23527c; font-weight: bold; text-decoration: underline;">
                        <xsl:attribute name="href">
                          <xsl:value-of select="notification_data/trial/electronic_collection" />
                        </xsl:attribute>
                        <xsl:value-of select="notification_data/poline_description" />
                      </a>
                    </p>
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/trial/start_date != '' or notification_data/trial/end_date != ''">
                <tr>
                  <td>
                    <p style="margin: 0;">
                      <strong>@@schedule@@</strong>&#160;<xsl:value-of select="notification_data/trial/start_date" /> - <xsl:value-of select="notification_data/trial/end_date" />.
                    </p>
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/reminder = 'true'">
                <tr>
                  <td>
                    <p style="margin: 0;">@@reminder_end_thanks@@</p>
                  </td>
                </tr>
                <tr>
                  <td>
                    <p style="margin: 0;">@@reminder_register_opinion@@</p>
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
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
