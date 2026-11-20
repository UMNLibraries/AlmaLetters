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

            <!-- Main Leganto Notification Table -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0" style="width: 100%; background-color: #f3f7f8; border-bottom: 2px solid #dce8eb; font-family: 'Source Sans Pro', sans-serif; padding: 20px 15px;">
              <tr>
                <td style="padding: 5px 10px 15px 10px; font-size: 14px;">
                  <p style="margin: 0;">@@subject@@</p>
                </td>
              </tr>

              <xsl:if test="notification_data/list_name != ''">
                <tr>
                  <td style="padding: 0 0 5px 10px;">
                    <strong>@@list@@&#160;</strong>
                    <xsl:value-of select="notification_data/list_name" />
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/item_title != ''">
                <tr>
                  <td style="padding: 0 0 5px 10px;">
                    <strong>@@item@@&#160;</strong>
                    <xsl:value-of select="notification_data/item_title" />
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/assertion/entity_id != ''">
                <tr>
                  <td style="padding: 0 0 5px 10px;">
                    <strong>@@citation_id@@&#160;</strong>
                    <xsl:value-of select="notification_data/assertion/entity_id" />
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="(notification_data/item_url != '') and (notification_data/type != 'fileDownload')">
                <tr>
                  <td style="padding: 0 0 5px 10px;">
                    <strong>@@reported_link@@&#160;</strong>
                    <a href="{notification_data/item_url}" target="_blank" style="color: #23527c; font-weight: bold; text-decoration: underline;">
                      <xsl:choose>
                        <xsl:when test="notification_data/item_url_name != ''">
                          <xsl:value-of select="notification_data/item_url_name" />
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="notification_data/item_url" />
                        </xsl:otherwise>
                      </xsl:choose>
                    </a>
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/type = 'fileDownload'">
                <tr>
                  <td style="padding: 0 0 5px 10px;">
                    <strong>@@reported_file@@&#160;</strong>
                    <xsl:value-of select="notification_data/name" />
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/item_url = ''">
                <tr>
                  <td style="padding: 0 0 5px 10px;">
                    @@no_availability@@
                  </td>
                </tr>
              </xsl:if>
            </table>

            <xsl:if test="notification_data/leganto_url != ''">
              <p style="margin: 15px 0 5px 10px;">
                <a href="{notification_data/leganto_url}" target="_blank" style="color: #23527c; font-weight: bold; text-decoration: underline;">
                  @@view_in_leganto@@
                </a>
              </p>
            </xsl:if>

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
