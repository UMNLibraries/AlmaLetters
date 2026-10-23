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

            <!-- Salutation & Notice Text Table -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  <p style="margin: 0 0 1em 0;">
                    <xsl:text>Dear </xsl:text>
                    <xsl:value-of select="notification_data/receivers/receiver/user/first_name"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="notification_data/receivers/receiver/user/last_name"/>
                    <xsl:text>,</xsl:text>
                  </p>

                  <xsl:choose>
                    <xsl:when test="/notification_data/profile_name = 'student-t2b-14day' or /notification_data/profile_name = 'student-t2b-14day-first-transfer'">
                      <p>Your library account has accrued the amounts listed below and can be paid at your campus library. These amounts will be transferred to your University of Minnesota Student account if they are not paid within the next two weeks.</p>
                    </xsl:when>
                    <xsl:when test="/notification_data/profile_name = 'student-t2b-3day' or /notification_data/profile_name = 'student-t2b-3day-first-transfer'">
                      <p>Your library account has accrued the amounts listed below and can be paid at your campus library. These amounts will be transferred to your University of Minnesota Student account if they are not paid within the next three days.</p>
                    </xsl:when>
                    <xsl:when test="/notification_data/profile_name = 'efs-transfer-first-notice'">
                      <p>Your library account has accrued the amounts listed below and can be paid at your campus library. These amounts will be transferred to your University of Minnesota account if they are not paid within the next two weeks.</p>
                    </xsl:when>
                    <xsl:when test="/notification_data/profile_name = 'efs-transfer-second-notice'">
                      <p>Your library account has accrued the amounts listed below and can be paid at your campus library. These amounts will be transferred to your University of Minnesota account if they are not paid within the next three days.</p>
                    </xsl:when>
                  </xsl:choose>
                </td>
              </tr>
            </table>

            <!-- Fines/Fees Listing Table -->
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
            <p>If you have any questions or need assistance, please contact your <a href="https://www.lib.umn.edu/systemlibraries" target="_blank">campus library</a>.</p>
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
