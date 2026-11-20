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

            <!-- Salutation & Lead Notice Table -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  <p style="margin: 0 0 1em 0;">@@dear@@</p>
                  <p style="margin: 0;">@@inform_you_item_below@@</p>
                </td>
              </tr>
            </table>

            <!-- Lost Item Details Key-Value Table -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <xsl:attribute name="style">
                <xsl:call-template name="listStyleCss" /><!-- style.xsl -->
              </xsl:attribute>

              <xsl:if test="notification_data/item_loan/title != ''">
                <tr>
                  <td>
                    <strong>@@lost_item@@:&#160;</strong>
                    <xsl:value-of select="notification_data/item_loan/title"/>
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/item_loan/description != ''">
                <tr>
                  <td>
                    <strong>@@description@@:&#160;</strong>
                    <xsl:value-of select="notification_data/item_loan/description"/>
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/item_loan/author != ''">
                <tr>
                  <td>
                    <strong>@@by@@:&#160;</strong>
                    <xsl:value-of select="notification_data/item_loan/author"/>
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/organization_unit/name != ''">
                <tr>
                  <td>
                    <strong>@@library@@:&#160;</strong>
                    <xsl:value-of select="notification_data/organization_unit/name"/>
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/item_loan/loan_date != ''">
                <tr>
                  <td>
                    <strong>@@loan_date@@:&#160;</strong>
                    <xsl:value-of select="notification_data/item_loan/loan_date"/>
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/item_loan/due_date != ''">
                <tr>
                  <td>
                    <strong>@@due_date@@:&#160;</strong>
                    <xsl:value-of select="notification_data/item_loan/due_date"/>
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/item_loan/barcode != ''">
                <tr>
                  <td>
                    <strong>@@barcode@@:&#160;</strong>
                    <xsl:value-of select="notification_data/item_loan/barcode"/>
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/phys_item_display/call_number != ''">
                <tr>
                  <td>
                    <strong>@@call_number@@:&#160;</strong>
                    <xsl:value-of select="notification_data/phys_item_display/call_number"/>
                  </td>
                </tr>
              </xsl:if>
            </table>

            <br />

            <!-- Fines & Fees Listing Table -->
            <xsl:if test="count(notification_data/fines_fees_list/user_fines_fees) > 0">
              <table cellpadding="5" class="listing">
                <xsl:attribute name="style">
                  <xsl:call-template name="mainTableStyleCss" /><!-- style.xsl -->
                </xsl:attribute>
                <tr>
                  <th scope="col">@@fee_type@@</th>
                  <th scope="col">@@fee_amount@@</th>
                  <th scope="col">@@note@@</th>
                </tr>
                <xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
                  <tr>
                    <td><xsl:value-of select="fine_fee_type_display"/></td>
                    <td><xsl:value-of select="fine_fee_ammount/sum"/>&#160;<xsl:value-of select="fine_fee_ammount/currency"/></td>
                    <td><xsl:value-of select="fine_comment"/></td>
                  </tr>
                </xsl:for-each>
              </table>
              <br />
            </xsl:if>

            <!-- Additional Information & Help Links -->
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
                  If you have any questions or if we can assist you further, <a href="https://www.lib.umn.edu/systemlibraries" target="_blank">please contact us at your campus library</a>.
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

        <!-- footer.xsl -->
        <xsl:call-template name="lastFooter" />
        <xsl:call-template name="myAccount" />
        <xsl:call-template name="contactUs" />
        <xsl:call-template name="Disclaimer" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
