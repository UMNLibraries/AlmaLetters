<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
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

        <div class="messageArea">
          <div class="messageBody">

            <!-- Notification Intro Table -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  <p style="margin: 0 0 0.5em 0;">@@inform_you_item_below@@</p>
                  <p style="margin: 0;">@@borrowed_by_you@@&#160;@@decalred_as_lost@@</p>
                </td>
              </tr>
            </table>

            <!-- Lost Item Listing Table -->
            <table cellpadding="5" class="listing">
              <xsl:attribute name="style">
                <xsl:call-template name="mainTableStyleCss" /><!-- style.xsl -->
              </xsl:attribute>
              <tr>
                <th scope="col" width="20%">@@lost_item@@</th>
                <th scope="col" width="10%">@@description@@</th>
                <th scope="col" width="15%">@@by@@</th>
                <th scope="col" width="20%">@@barcode@@</th>
                <th scope="col" width="10%">@@loan_date@@</th>
                <th scope="col" width="10%">@@due_date@@</th>
                <th scope="col" width="15%">@@library@@</th>
              </tr>

              <xsl:for-each select="notification_data">
                <tr>
                  <td><xsl:value-of select="item_loan/title"/></td>
                  <td><xsl:value-of select="item_loan/description"/></td>
                  <td><xsl:value-of select="item_loan/author"/></td>
                  <td><xsl:value-of select="item_loan/barcode"/></td>
                  <td><xsl:value-of select="item_loan/loan_date"/></td>
                  <td><xsl:value-of select="item_loan/due_date"/></td>
                  <td><xsl:value-of select="organization_unit/name"/></td>
                </tr>
              </xsl:for-each>
            </table>

            <br />

            <!-- Additional Info & Contact Section -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  @@additional_info_1@@
                  <br />
                  @@additional_info_2@@
                </td>
              </tr>
              <tr>
                <td style="padding-top: 1em;">
                  If you have any questions or if we can assist you further, <a href="https://www.lib.umn.edu/systemlibraries" target="_blank">please contact us at your campus library.</a>
                </td>
              </tr>
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
        <xsl:call-template name="myAccount" />
        <xsl:call-template name="contactUs" />
        <xsl:call-template name="Disclaimer" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
