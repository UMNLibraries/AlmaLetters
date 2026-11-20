<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />
  <xsl:include href="mailReason.xsl" />
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
        <xsl:call-template name="toWhomIsConcerned" /><!-- mailReason.xsl -->

        <div class="messageArea">
          <div class="messageBody">

            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  Thank you for requesting materials through our mail delivery service. The item below has been loaned to your account, and we are in the process of shipping it to you.
                </td>
              </tr>
              <tr>
                <td>
                  <xsl:call-template name="recordTitle" /><!-- recordTitle.xsl -->
                </td>
              </tr>
              <xsl:if test="notification_data/phys_item_display/available_items/available_item/barcode != ''">
                <tr>
                  <td>
                    <xsl:value-of select="notification_data/phys_item_display/available_items/available_item/barcode"/>
                  </td>
                </tr>
              </xsl:if>
              <tr>
                <td>
                  We anticipate your item should arrive within 5–10 business days.
                </td>
              </tr>
              <tr>
                <td style="padding-top: 1em;">
                  If you have any questions or if we can assist you further, <a href="https://www.lib.umn.edu/systemlibraries" target="_blank">please contact us at your campus library.</a>
                </td>
              </tr>
              <tr>
                <td style="padding-top: 1em;">
                  @@sincerely@@<br />
                  @@department@@
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
