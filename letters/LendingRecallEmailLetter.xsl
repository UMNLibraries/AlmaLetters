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
              <h2 style="font-size: 1.3em; margin: 0.5em 0; color: #333333;">@@header@@</h2>
            </td>
          </tr>
        </table>

        <div class="messageArea">
          <div class="messageBody">

            <!-- Recall Status Message -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <xsl:choose>
                  <xsl:when test="notification_data/recall_cancelled = 'true'">
                    <td>
                      <strong>@@recall_cancel_message@@</strong>
                    </td>
                  </xsl:when>
                  <xsl:otherwise>
                    <td>
                      <strong>@@recall_message@@</strong>
                    </td>
                  </xsl:otherwise>
                </xsl:choose>
              </tr>
            </table>

            <!-- Recalled Item Listing Table -->
            <table cellpadding="5" class="listing">
              <xsl:attribute name="style">
                <xsl:call-template name="mainTableStyleCss" /><!-- style.xsl -->
              </xsl:attribute>
              <tr>
                <th scope="col">@@title@@</th>
                <th scope="col">@@author@@</th>
                <th scope="col">@@old_due_date@@</th>
                <th scope="col">@@due_date@@</th>
              </tr>
              <tr>
                <td><xsl:value-of select="notification_data/request/display/title"/></td>
                <td><xsl:value-of select="notification_data/request/display/author"/></td>
                <td><xsl:value-of select="notification_data/original_due_date"/></td>
                <td><xsl:value-of select="notification_data/request/due_date"/></td>
              </tr>
            </table>

            <br />

            <!-- External Request ID -->
            <xsl:if test="notification_data/request/external_request_id != ''">
              <table role="presentation" cellspacing="0" cellpadding="5" border="0">
                <tr>
                  <td><strong>@@request_id@@:&#160;</strong></td>
                  <td>
                    <strong><xsl:value-of select="notification_data/request/external_request_id" /></strong>
                  </td>
                </tr>
              </table>
              <br />
            </xsl:if>

            <!-- Signature & Library Address Block -->
            <table role="presentation" cellspacing="0" cellpadding="2" border="0">
              <tr>
                <td>@@signature@@</td>
              </tr>
              <tr>
                <td>
                  <address style="font-style: normal; line-height: 1.4; color: #333333;">
                    <strong><xsl:value-of select="notification_data/library/name" /></strong><br />
                    <xsl:if test="notification_data/library/address/line1 != ''">
                      <xsl:value-of select="notification_data/library/address/line1" /><br />
                    </xsl:if>
                    <xsl:if test="notification_data/library/address/line2 != ''">
                      <xsl:value-of select="notification_data/library/address/line2" /><br />
                    </xsl:if>
                    <xsl:if test="notification_data/library/address/line3 != ''">
                      <xsl:value-of select="notification_data/library/address/line3" /><br />
                    </xsl:if>
                    <xsl:if test="notification_data/library/address/line4 != ''">
                      <xsl:value-of select="notification_data/library/address/line4" /><br />
                    </xsl:if>
                    <xsl:if test="notification_data/library/address/line5 != ''">
                      <xsl:value-of select="notification_data/library/address/line5" /><br />
                    </xsl:if>
                    <xsl:if test="notification_data/library/address/city != ''">
                      <xsl:value-of select="notification_data/library/address/city" />
                      <xsl:if test="notification_data/library/address/country != ''">, </xsl:if>
                    </xsl:if>
                    <xsl:if test="notification_data/library/address/country != ''">
                      <xsl:value-of select="notification_data/library/address/country" />
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
