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

            <br />

            <!-- Requests Grouped by Library -->
            <xsl:for-each select="notification_data/requests_by_library/library_requests_for_display">
              <table cellpadding="5" class="listing">
                <xsl:attribute name="style">
                  <xsl:call-template name="mainTableStyleCss" /><!-- style.xsl -->
                </xsl:attribute>
                <tr>
                  <th scope="col">@@title@@</th>
                  <th scope="col">@@author@@</th>
                  <th scope="col">@@call_number@@</th>
                  <th scope="col">@@can_picked_at@@</th>
                  <th scope="col">@@note_item_held_until@@</th>
                </tr>

                <xsl:for-each select="requests/request_for_display">
                  <tr>
                    <td><xsl:value-of select="phys_item_display/title"/></td>
                    <td><xsl:value-of select="phys_item_display/author"/></td>
                    <td><xsl:value-of select="phys_item_display/barcode"/></td>
                    <td><xsl:value-of select="request/assigned_unit_name"/></td>
                    <td><xsl:value-of select="request/work_flow_entity/expiration_date"/></td>
                  </tr>
                </xsl:for-each>
              </table>
              <br />
            </xsl:for-each>

            <!-- Out of Institution Requests -->
            <xsl:if test="notification_data/out_of_institution_requests/request_for_display">
              <h2 style="font-size: 1.2em; margin: 1em 0 0.5em 0; color: #333333;">@@other_institutions@@</h2>
              <table cellpadding="5" class="listing">
                <xsl:attribute name="style">
                  <xsl:call-template name="mainTableStyleCss" /><!-- style.xsl -->
                </xsl:attribute>
                <tr>
                  <th scope="col">@@title@@</th>
                  <th scope="col">@@author@@</th>
                  <th scope="col">@@can_picked_at@@</th>
                  <th scope="col">@@note_item_held_until@@</th>
                </tr>

                <xsl:for-each select="notification_data/out_of_institution_requests/request_for_display">
                  <tr>
                    <td><xsl:value-of select="phys_item_display/title"/></td>
                    <td><xsl:value-of select="phys_item_display/author"/></td>
                    <td><xsl:value-of select="request/assigned_unit_name"/></td>
                    <td><xsl:value-of select="request/work_flow_entity/expiration_date"/></td>
                  </tr>
                </xsl:for-each>
              </table>
              <br />
            </xsl:if>

            <!-- Campus Library Assistance Link -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0" style="margin: 1em 0;">
              <tr>
                <td>
                  If you have any questions or if we can assist you further, <a href="https://www.lib.umn.edu/systemlibraries" target="_blank">please contact us at your campus library</a>.
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
