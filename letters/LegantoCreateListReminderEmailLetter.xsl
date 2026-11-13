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

            <!-- Main Leganto Notification Table -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0" style="width: 100%; background-color: #f3f7f8; border-bottom: 2px solid #dce8eb; font-family: 'Source Sans Pro', sans-serif; padding: 20px 15px;">
              <tr>
                <td style="padding: 5px 10px 12px 10px;">
                  <p style="margin: 0 0 1em 0;">
                    @@create_resource_list@@
                    <xsl:if test="notification_data/course/code != '' or notification_data/course/name != ''">
                      <xsl:text> "</xsl:text>
                      <xsl:value-of select="notification_data/course/code" />
                      <xsl:if test="notification_data/course/code != '' and notification_data/course/name != ''"> - </xsl:if>
                      <xsl:value-of select="notification_data/course/name" />
                      <xsl:text>".</xsl:text>
                    </xsl:if>
                  </p>
                  <p style="margin: 0;">@@additional_info_1@@</p>
                </td>
              </tr>

              <xsl:if test="notification_data/leganto_url != ''">
                <tr>
                  <td style="padding: 5px 10px 15px 10px;">
                    <a href="{notification_data/leganto_url}" target="_blank" style="color: #23527c; font-weight: bold; text-decoration: underline;">
                      @@update_now@@
                    </a>
                  </td>
                </tr>
              </xsl:if>

              <tr>
                <td style="padding: 5px 10px;">
                  <p style="margin: 0 0 1em 0;">@@share_with_students@@</p>
                  <p style="margin: 0 0 1em 0;">
                    Please contact <a href="mailto:coursematerials@umn.edu">coursematerials@umn.edu</a> for assistance or submit your reading list using the <a href="http://z.umn.edu/coursematerialrequest" target="_blank">Course Materials request form</a>.
                  </p>
                  <p style="margin: 0;">
                    @@latest_date_submission@@&#160;@@ensure_access@@
                    You can also learn how to manage your own list by visiting the <a href="https://libguides.umn.edu/library-course-materials" target="_blank">Library Course Materials guide</a>.
                  </p>
                </td>
              </tr>
            </table>

            <br />

            <!-- Signature Table -->
            <table role="presentation" cellspacing="0" cellpadding="2" border="0">
              <xsl:attribute name="style">
                <xsl:call-template name="listStyleCss" /><!-- style.xsl -->
              </xsl:attribute>
              <tr><td>@@sincerely@@,</td></tr>
              <tr><td>@@department@@</td></tr>
            </table>

          </div>
        </div>

        <!-- footer.xsl -->
        <xsl:call-template name="lastFooter" />
        <xsl:call-template name="myAccount" />
        <xsl:call-template name="contactUs" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
