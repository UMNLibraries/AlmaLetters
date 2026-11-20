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

            <!-- Introductory Notification Message -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  <p style="margin: 0;">@@notification_message@@</p>
                </td>
              </tr>
            </table>

            <br />

            <!-- Fines and Fees Listing Table -->
            <table cellpadding="5" class="listing">
              <xsl:attribute name="style">
                <xsl:call-template name="mainTableStyleCss" /><!-- style.xsl -->
              </xsl:attribute>
              <tr>
                <th scope="col">@@fee_type@@</th>
                <th scope="col">@@fee_owner@@</th>
                <th scope="col">@@fee_amount@@</th>
                <th scope="col">@@title@@</th>
                <th scope="col">@@comment@@</th>
              </tr>
              <xsl:for-each select="notification_data/fines_fees/user_fines_fees">
                <tr>
                  <td><xsl:value-of select="fine_fee_type_display"/></td>
                  <td><xsl:value-of select="owner"/></td>
                  <td>
                    <xsl:if test="fine_fee_ammount/normalized_sum != ''">
                      <xsl:value-of select="fine_fee_ammount/normalized_sum"/>
                      <xsl:if test="fine_fee_ammount/currency != ''">&#160;<xsl:value-of select="fine_fee_ammount/currency"/></xsl:if>
                    </xsl:if>
                  </td>
                  <td><xsl:value-of select="item_title"/></td>
                  <td><xsl:value-of select="fine_comment"/></td>
                </tr>
              </xsl:for-each>
            </table>

            <br />

            <!-- Signature Table -->
            <table role="presentation" cellspacing="0" cellpadding="2" border="0">
              <tr><td>@@sincerely@@</td></tr>
              <tr><td>@@department@@</td></tr>
            </table>

          </div>
        </div>

        <br />

        <!-- footer.xsl -->
        <xsl:call-template name="lastFooter" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
