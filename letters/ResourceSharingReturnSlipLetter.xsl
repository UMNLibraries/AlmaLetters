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

        <!-- <xsl:call-template name="head" /> -->

        <div class="messageArea">
          <div class="messageBody">

            <!-- Partner Return Header & Destination Details -->
            <table role="presentation" cellspacing="0" cellpadding="2" border="0">
              <xsl:attribute name="style">
                <xsl:call-template name="listStyleCss" /><!-- style.xsl -->
              </xsl:attribute>
              <tr>
                <td style="padding-top: 8px;">
                  <h1 style="font-size: 1.4em; font-weight: bold; margin: 0 0 0.25em 0; color: #333333;">
                    @@returned_to@@: <xsl:value-of select="notification_data/alternate_symbol"/>
                  </h1>
                </td>
              </tr>
              <tr>
                <td>
                  <p style="margin: 0 0 0.5em 0;"><strong>@@returned@@</strong></p>
                </td>
              </tr>
              <tr>
                <td style="padding-top: 6px;">
                  <strong>@@returned_to@@:</strong>&#160;<xsl:value-of select="notification_data/partner_name"/>
                </td>
              </tr>
              <xsl:if test="notification_data/request/return_info != ''">
                <tr>
                  <td>
                    <xsl:value-of select="notification_data/request/return_info"/>
                  </td>
                </tr>
              </xsl:if>
              <tr>
                <td style="padding-top: 6px;">
                  <strong>@@address@@:</strong>
                  <address style="font-style: normal; line-height: 1.4; margin: 0.25em 0 0 0; color: #333333;">
                    <xsl:if test="notification_data/partner_address/line1 != ''">
                      <xsl:value-of select="notification_data/partner_address/line1"/><br />
                    </xsl:if>
                    <xsl:if test="notification_data/partner_address/line2 != ''">
                      <xsl:value-of select="notification_data/partner_address/line2"/><br />
                    </xsl:if>
                    <xsl:if test="notification_data/partner_address/line3 != ''">
                      <xsl:value-of select="notification_data/partner_address/line3"/><br />
                    </xsl:if>
                    <xsl:if test="notification_data/partner_address/line4 != ''">
                      <xsl:value-of select="notification_data/partner_address/line4"/><br />
                    </xsl:if>
                    <xsl:if test="notification_data/partner_address/line5 != ''">
                      <xsl:value-of select="notification_data/partner_address/line5"/><br />
                    </xsl:if>
                    <xsl:if test="notification_data/partner_address/city != ''">
                      <xsl:value-of select="notification_data/partner_address/city"/>
                      <xsl:if test="notification_data/partner_address/state_province != ''">, <xsl:value-of select="notification_data/partner_address/state_province"/></xsl:if>
                      <xsl:if test="notification_data/partner_address/postal_code != ''">&#160;<xsl:value-of select="notification_data/partner_address/postal_code"/></xsl:if>
                      <br />
                    </xsl:if>
                    <xsl:if test="notification_data/partner_address/country != ''">
                      <xsl:value-of select="notification_data/partner_address/country"/>
                    </xsl:if>
                  </address>
                </td>
              </tr>
              <xsl:if test="notification_data/partner_email/email != ''">
                <tr>
                  <td>
                    <strong>@@email@@:</strong>&#160;<a href="mailto:{notification_data/partner_email/email}" style="color: #23527c; text-decoration: underline;"><xsl:value-of select="notification_data/partner_email/email"/></a>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/partner_phone/phone != ''">
                <tr>
                  <td>
                    <strong>@@phone@@:</strong>&#160;<xsl:value-of select="notification_data/partner_phone/phone"/>
                  </td>
                </tr>
              </xsl:if>
            </table>

            <br />

            <!-- Returned Item Details Table -->
            <table cellpadding="3" class="listing">
              <xsl:attribute name="style">
                <xsl:call-template name="mainTableStyleCss" /><!-- style.xsl -->
              </xsl:attribute>
              <tr>
                <th scope="col" style="width: 20%;">@@title@@</th>
                <th scope="col" style="width: 20%;">@@journal_title@@</th>
                <th scope="col" style="width: 15%;">@@author@@</th>
                <th scope="col" style="width: 10%;">@@volume@@</th>
                <th scope="col" style="width: 10%;">@@issue@@</th>
                <th scope="col" style="width: 15%;">@@note_to_partner@@</th>
              </tr>
              <tr>
                <td><xsl:value-of select="notification_data/request/display/title"/></td>
                <td><xsl:value-of select="notification_data/request/display/journal_title"/></td>
                <td><xsl:value-of select="notification_data/request/display/author"/></td>
                <td><xsl:value-of select="notification_data/request/display/volume"/></td>
                <td><xsl:value-of select="notification_data/request/display/issue"/></td>
                <td><xsl:value-of select="notification_data/note_to_partner"/></td>
              </tr>
            </table>

            <br />

            <!-- Arrival, Return Date & Request Barcode -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <xsl:attribute name="style">
                <xsl:call-template name="listStyleCss" /><!-- style.xsl -->
              </xsl:attribute>
              <tr>
                <td style="padding-top: 8px;">
                  <strong>@@arrival_date@@:</strong>&#160;<xsl:value-of select="notification_data/request/item_arrival_date"/>
                </td>
              </tr>
              <tr>
                <td>
                  <strong>@@required_return_date@@:</strong>&#160;<xsl:value-of select="notification_data/request/due_date"/>
                </td>
              </tr>
              <tr>
                <td>
                  <strong>@@request_id@@:</strong>&#160;<img src="externalId.png" alt="Request ID barcode" />
                </td>
              </tr>
            </table>

            <br />

            <!-- Returning Campus Library Address Block -->
            <table role="presentation" cellspacing="0" cellpadding="2" border="0">
              <!--
              <tr>
                <td>@@signature@@</td>
              </tr>
              -->
              <tr>
                <td>
                  <address style="font-style: normal; line-height: 1.4; color: #333333;">
                    <strong>
                      <xsl:choose>
                        <xsl:when test="/notification_data/library/name = 'TC Wilson Library'">MNU - University of Minnesota, Twin Cities</xsl:when>
                        <xsl:when test="/notification_data/library/name = 'CROOKSTON Moe Library'">MCR - University of Minnesota, Crookston</xsl:when>
                        <xsl:when test="/notification_data/library/name = 'DULUTH Martin Library'">MND - University of Minnesota, Duluth</xsl:when>
                        <xsl:when test="/notification_data/library/name = 'MORRIS Briggs Library'">MNX - University of Minnesota, Morris</xsl:when>
                        <xsl:when test="/notification_data/library/name = 'TC Law Library'">MLL - University of Minnesota, Law Library</xsl:when>
                        <xsl:otherwise>University of Minnesota</xsl:otherwise>
                      </xsl:choose>
                    </strong><br />
                    <!--
                    <xsl:value-of select="notification_data/library/name"/><br />
                    -->
                    <xsl:if test="notification_data/library/address/line1 != ''">
                      <xsl:value-of select="notification_data/library/address/line1"/><br />
                    </xsl:if>
                    <xsl:if test="notification_data/library/address/line2 != ''">
                      <xsl:value-of select="notification_data/library/address/line2"/><br />
                    </xsl:if>
                    <xsl:if test="notification_data/library/address/line3 != ''">
                      <xsl:value-of select="notification_data/library/address/line3"/><br />
                    </xsl:if>
                    <xsl:if test="notification_data/library/address/line4 != ''">
                      <xsl:value-of select="notification_data/library/address/line4"/><br />
                    </xsl:if>
                    <xsl:if test="notification_data/library/address/line5 != ''">
                      <xsl:value-of select="notification_data/library/address/line5"/><br />
                    </xsl:if>
                    <xsl:if test="notification_data/library/address/city != ''">
                      <xsl:value-of select="notification_data/library/address/city"/>
                      <xsl:if test="notification_data/library/address/state_province != ''">, <xsl:value-of select="notification_data/library/address/state_province"/></xsl:if>
                      <xsl:if test="notification_data/library/address/postal_code != ''">&#160;<xsl:value-of select="notification_data/library/address/postal_code"/></xsl:if>
                      <br />
                    </xsl:if>
                    <xsl:if test="notification_data/library/address/country != ''">
                      <xsl:value-of select="notification_data/library/address/country"/>
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
