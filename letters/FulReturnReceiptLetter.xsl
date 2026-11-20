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

            <!-- Introductory Returned Items Message -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  <p style="margin: 0;">
                    @@inform_returned_items@@ <xsl:value-of select="notification_data/organization_unit/name"/><xsl:if test="notification_data/circ_desk_name != ''">&#44;&#160;<xsl:value-of select="notification_data/circ_desk_name"/></xsl:if>
                  </p>
                </td>
              </tr>
            </table>

            <!-- Loans Section Heading -->
            <h2 style="font-size: 1.2em; margin: 1em 0 0.5em 0; color: #333333;">@@loans@@</h2>

            <!-- Returned Items Listing Table -->
            <table cellpadding="5" class="listing">
              <xsl:attribute name="style">
                <xsl:call-template name="mainTableStyleCss" /><!-- style.xsl -->
              </xsl:attribute>
              <tr>
                <th scope="col">@@title@@</th>
                <th scope="col">@@description@@</th>
                <th scope="col">@@author@@</th>
                <th scope="col">@@due_date@@</th>
                <th scope="col">@@return_date@@</th>
                <th scope="col">@@fine@@</th>
                <th scope="col">@@library@@</th>
              </tr>

              <xsl:for-each select="notification_data/items/item_loan">
                <tr>
                  <td><xsl:value-of select="title"/></td>
                  <td><xsl:value-of select="description"/></td>
                  <td><xsl:value-of select="author"/></td>
                  <td><xsl:value-of select="new_due_date_str"/></td>
                  <td><xsl:value-of select="return_date_str"/></td>
                  <td><xsl:value-of select="fine"/></td>
                  <td><xsl:value-of select="library_name"/></td>
                </tr>
              </xsl:for-each>
            </table>

            <br />

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
