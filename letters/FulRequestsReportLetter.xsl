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

            <!-- Lead Notice Text -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  <p style="margin: 0;">@@please_find_below@@</p>
                </td>
              </tr>
            </table>

            <br />

            <!-- Not Active Requests -->
            <xsl:if test="notification_data/non_active_requests/ful_request_interpated">
              <table role="presentation" cellspacing="0" cellpadding="0" border="0" style="margin-top: 1em;">
                <tr>
                  <td>
                    <h2 style="font-size: 1.2em; margin: 0 0 0.25em 0; color: #333333;">@@not_active@@</h2>
                    <p style="margin: 0 0 0.5em 0;">@@not_active_description@@</p>
                  </td>
                </tr>
              </table>

              <table cellpadding="5" class="listing">
                <xsl:attribute name="style">
                  <xsl:call-template name="mainTableStyleCss" /><!-- style.xsl -->
                </xsl:attribute>
                <tr>
                  <xsl:attribute name="style">
                    <xsl:call-template name="headerTableStyleCss" /><!-- style.xsl -->
                  </xsl:attribute>
                  <th scope="col">@@type@@</th>
                  <th scope="col">@@title@@</th>
                  <th scope="col">@@place_in_queue@@</th>
                </tr>
                <xsl:for-each select="notification_data/non_active_requests/ful_request_interpated">
                  <tr>
                    <td><xsl:value-of select="request_type_display"/></td>
                    <td><xsl:value-of select="title_display"/></td>
                    <td><xsl:value-of select="place_in_queue"/></td>
                  </tr>
                </xsl:for-each>
              </table>
              <br />
            </xsl:if>

            <!-- In Process Requests -->
            <xsl:if test="notification_data/process_requests/ful_request_interpated">
              <table role="presentation" cellspacing="0" cellpadding="0" border="0" style="margin-top: 1em;">
                <tr>
                  <td>
                    <h2 style="font-size: 1.2em; margin: 0 0 0.25em 0; color: #333333;">@@in_process@@</h2>
                    <p style="margin: 0 0 0.5em 0;">@@in_process_description@@</p>
                  </td>
                </tr>
              </table>

              <table cellpadding="5" class="listing">
                <xsl:attribute name="style">
                  <xsl:call-template name="mainTableStyleCss" /><!-- style.xsl -->
                </xsl:attribute>
                <tr>
                  <xsl:attribute name="style">
                    <xsl:call-template name="headerTableStyleCss" /><!-- style.xsl -->
                  </xsl:attribute>
                  <th scope="col">@@type@@</th>
                  <th scope="col">@@title@@</th>
                </tr>
                <xsl:for-each select="notification_data/process_requests/ful_request_interpated">
                  <tr>
                    <td><xsl:value-of select="request_type_display"/></td>
                    <td><xsl:value-of select="title_display"/></td>
                  </tr>
                </xsl:for-each>
              </table>
              <br />
            </xsl:if>

            <!-- On Hold Shelf Requests -->
            <xsl:if test="notification_data/hold_shelf_requests/ful_request_interpated">
              <table role="presentation" cellspacing="0" cellpadding="0" border="0" style="margin-top: 1em;">
                <tr>
                  <td>
                    <h2 style="font-size: 1.2em; margin: 0 0 0.25em 0; color: #333333;">@@on_hold_shelf@@</h2>
                    <p style="margin: 0 0 0.5em 0;">@@on_hold_shelf_description@@</p>
                  </td>
                </tr>
              </table>

              <table cellpadding="5" class="listing">
                <xsl:attribute name="style">
                  <xsl:call-template name="mainTableStyleCss" /><!-- style.xsl -->
                </xsl:attribute>
                <tr>
                  <xsl:attribute name="style">
                    <xsl:call-template name="headerTableStyleCss" /><!-- style.xsl -->
                  </xsl:attribute>
                  <th scope="col">@@type@@</th>
                  <th scope="col">@@title@@</th>
                  <th scope="col">@@status@@</th>
                  <th scope="col">@@pickup_location@@</th>
                </tr>
                <xsl:for-each select="notification_data/hold_shelf_requests/ful_request_interpated">
                  <tr>
                    <td><xsl:value-of select="request_type_display"/></td>
                    <td><xsl:value-of select="title_display"/></td>
                    <td><xsl:value-of select="request_status_display"/></td>
                    <td><xsl:value-of select="pickup_location_display"/></td>
                  </tr>
                </xsl:for-each>
              </table>
              <br />
            </xsl:if>

            <!-- Assistance / Help Contact Block -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  If you have any questions or if we can assist you further, <a href="https://www.lib.umn.edu/systemlibraries" target="_blank">please contact us at your campus library.</a>
                </td>
              </tr>
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
