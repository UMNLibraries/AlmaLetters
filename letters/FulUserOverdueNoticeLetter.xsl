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

            <!-- Introductory Message -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  <p style="margin: 0;">@@message@@</p>
                </td>
              </tr>
            </table>

            <!-- Loans Section Heading -->
            <h2 style="font-size: 1.2em; margin: 1em 0 0.5em 0; color: #333333;">@@loans@@</h2>

            <!-- Loaned Items Listing Table -->
            <table cellpadding="5" class="listing">
              <xsl:attribute name="style">
                <xsl:call-template name="mainTableStyleCss" /><!-- style.xsl -->
              </xsl:attribute>
              <tr>
                <th scope="col">@@title@@</th>
                <th scope="col">@@description@@</th>
                <th scope="col">@@author@@</th>
                <th scope="col">@@due_date@@</th>
                <th scope="col">@@library@@</th>
                <th scope="col">Barcode</th>
              </tr>

              <xsl:for-each select="notification_data/item_loans/item_loan">
                <tr>
                  <td><xsl:value-of select="title"/></td>
                  <td><xsl:value-of select="description"/></td>
                  <td><xsl:value-of select="author"/></td>
                  <td><xsl:value-of select="due_date"/></td>
                  <td><xsl:value-of select="library_name"/></td>
                  <td><xsl:value-of select="barcode"/></td>
                </tr>
              </xsl:for-each>
            </table>

            <br />

            <!-- Additional Information -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  <p style="margin: 0 0 0.5em 0;">@@additional_info_1@@</p>
                  <p style="margin: 0;">@@additional_info_2@@</p>
                </td>
              </tr>
            </table>

            <!-- Campus Library Assistance Link -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0" style="margin: 1em 0;">
              <tr>
                <td>
                  If you have any questions or if we can assist you further, <a href="https://www.lib.umn.edu/systemlibraries" target="_blank">please contact us at your campus library.</a>
                </td>
              </tr>
            </table>

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
