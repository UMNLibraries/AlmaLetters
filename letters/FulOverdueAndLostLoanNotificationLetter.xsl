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

            <!-- Intro Notice Table -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  <p style="margin: 0 0 0.5em 0;">@@inform_you_item_below@@</p>
                  <p style="margin: 0;">@@borrowed_by_you@@&#160;@@decalred_as_lost@@</p>
                </td>
              </tr>
            </table>

            <br />

            <!-- Loans Grouped by Library -->
            <xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">
              <table cellpadding="5" class="listing">
                <xsl:attribute name="style">
                  <xsl:call-template name="mainTableStyleCss" /><!-- style.xsl -->
                </xsl:attribute>
                <tr align="center" bgcolor="#f5f5f5">
                  <td colspan="8">
                    <h3 style="margin: 0.25em 0;"><xsl:value-of select="organization_unit/name" /></h3>
                  </td>
                </tr>
                <tr>
                  <th scope="col">@@lost_item@@</th>
                  <th scope="col">@@description@@</th>
                  <th scope="col">@@library@@</th>
                  <th scope="col">@@loan_date@@</th>
                  <th scope="col">@@due_date@@</th>
                  <th scope="col">@@barcode@@</th>
                  <th scope="col">@@call_number@@</th>
                  <th scope="col">@@charged_with_fines_fees@@</th>
                </tr>

                <xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display">
                  <tr>
                    <td><xsl:value-of select="item_loan/title"/></td>
                    <td><xsl:value-of select="item_loan/description"/></td>
                    <td><xsl:value-of select="physical_item_display_for_printing/library_name"/></td>
                    <td><xsl:value-of select="item_loan/loan_date"/></td>
                    <td><xsl:value-of select="item_loan/due_date"/></td>
                    <td><xsl:value-of select="item_loan/barcode"/></td>
                    <td><xsl:value-of select="physical_item_display_for_printing/call_number"/></td>
                    <td>
                      <xsl:for-each select="fines_fees_list/user_fines_fees">
                        <strong><xsl:value-of select="fine_fee_type_display"/>:&#160;</strong>
                        <xsl:value-of select="fine_fee_ammount/normalized_sum"/>&#160;<xsl:value-of select="fine_fee_ammount/currency"/>
                        <br />
                      </xsl:for-each>
                    </td>
                  </tr>
                </xsl:for-each>
              </table>
              <br />
            </xsl:for-each>

            <!-- Overdue Notification Fee -->
            <xsl:if test="notification_data/overdue_notification_fee_amount/sum != ''">
              <table role="presentation" cellspacing="0" cellpadding="5" border="0">
                <tr>
                  <td>
                    <strong>@@overdue_notification_fee@@&#160;</strong>
                    <xsl:value-of select="notification_data/overdue_notification_fee_amount/normalized_sum"/>&#160;<xsl:value-of select="notification_data/overdue_notification_fee_amount/currency"/>
                  </td>
                </tr>
              </table>
              <br />
            </xsl:if>

            <!-- Additional Information Section -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  @@additional_info_1@@
                  <br />
                  @@additional_info_2@@
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
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
