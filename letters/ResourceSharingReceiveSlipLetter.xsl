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

        <div class="messageArea">
          <div class="messageBody">

            <!-- Item, Patron & Pickup Details -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <xsl:attribute name="style">
                <xsl:call-template name="listStyleCss" /><!-- style.xsl -->
              </xsl:attribute>

              <xsl:if test="notification_data/barcode != ''">
                <tr>
                  <td style="padding-top: 10px;">
                    <strong>@@item_barcode@@</strong>&#160;<img src="Barcode.png" alt="Item barcode" />
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/patron_name != ''">
                <tr>
                  <td style="padding-top: 10px;">
                    <strong>@@patron_name@@</strong>&#160;<xsl:value-of select="notification_data/patron_name" />
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/request/display/normalized_title != ''">
                <tr>
                  <td style="padding-top: 10px;">
                    <strong>@@title@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/normalized_title" />
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/request/display/author != ''">
                <tr>
                  <td>
                    <strong>@@author@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/author" />
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/request/pickup_location_str != ''">
                <tr>
                  <td style="padding-top: 10px;">
                    <strong>@@pickup_location@@:</strong>&#160;<xsl:value-of select="notification_data/request/pickup_location_str" />
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/due_date_str != ''">
                <tr>
                  <td>
                    <strong>@@bib_auth@@:</strong>&#160;<xsl:value-of select="notification_data/due_date_str" />
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/circulation_note != ''">
                <tr>
                  <td>
                    <strong>@@circulation_note@@:</strong>&#160;<xsl:value-of select="notification_data/circulation_note" />
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/citation_id != ''">
                <tr>
                  <td style="padding-top: 10px;">
                    <strong>@@reading_list@@:</strong>&#160;<xsl:value-of select="notification_data/reading_list_name" />
                    <xsl:if test="notification_data/reading_list_code != ''">
                      <xsl:text> (</xsl:text><xsl:value-of select="notification_data/reading_list_code" /><xsl:text>)</xsl:text>
                    </xsl:if>
                  </td>
                </tr>
                <tr>
                  <td>
                    <strong>@@citation_id@@:</strong>&#160;<xsl:value-of select="notification_data/citation_id" />
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
                    <xsl:if test="notification_data/library/name != ''">
                      <strong><xsl:value-of select="notification_data/library/name" /></strong><br />
                    </xsl:if>
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
