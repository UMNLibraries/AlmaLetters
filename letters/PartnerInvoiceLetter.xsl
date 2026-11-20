<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="mailReason.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />

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

            <!-- Invoice Number Heading -->
            <xsl:if test="notification_data/invoice_id != ''">
              <h2 style="font-size: 1.2em; margin: 0.8em 0 0.5em 0; color: #333333;">
                @@invoiceNumber@@: <xsl:value-of select="/notification_data/invoice_id"/>
              </h2>
            </xsl:if>

            <!-- Introductory Fee Assessment Notice -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  <p style="margin: 0 0 0.5em 0;">
                    We have assessed the following fees for the overdue/lost resource sharing item listed below.
                  </p>
                </td>
              </tr>
            </table>

            <!-- Assessed Fees Listing Table -->
            <table cellpadding="5" class="listing">
              <xsl:attribute name="style">
                <xsl:call-template name="mainTableStyleCss" /><!-- style.xsl -->
              </xsl:attribute>
              <tr>
                <th scope="col">@@externalIdentifier@@</th>
                <th scope="col">@@title@@</th>
                <th scope="col">@@feeType@@</th>
                <th scope="col" style="text-align: right;">@@chargeAmount@@</th>
              </tr>
              <xsl:for-each select="notification_data/lending_request_fee_list/lending_request_fee">
                <tr>
                  <xsl:choose>
                    <xsl:when test="external_identifier = '0' or external_identifier = '1'">
                      <td></td>
                      <td><xsl:value-of select="title"/></td>
                      <td><strong><xsl:value-of select="fee_type"/></strong></td>
                      <td style="text-align: right;">
                        <strong><xsl:value-of select="charge_amount"/>&#160;<xsl:value-of select="currency"/></strong>
                      </td>
                    </xsl:when>
                    <xsl:otherwise>
                      <td><xsl:value-of select="external_identifier"/></td>
                      <td><xsl:value-of select="title"/></td>
                      <td><xsl:value-of select="fee_type"/></td>
                      <td style="text-align: right;">
                        <xsl:value-of select="charge_amount"/>&#160;<xsl:value-of select="currency"/>
                      </td>
                    </xsl:otherwise>
                  </xsl:choose>
                </tr>
                <xsl:if test="external_identifier = '0'">
                  <tr>
                    <td colspan="4">
                      <div style="border-top: 3px solid black; margin: 0;"></div>
                    </td>
                  </tr>
                </xsl:if>
              </xsl:for-each>
            </table>

            <br />

            <!-- Signature Table -->
            <table role="presentation" cellspacing="0" cellpadding="2" border="0">
              <tr><td>@@signature@@</td></tr>
              <tr><td>@@department@@</td></tr>
            </table>

          </div>
        </div>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
