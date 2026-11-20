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

            <!-- Opening Statement -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  <p style="margin: 0 0 1em 0;">@@user_ requested_accessible_file.statment@@</p>
                </td>
              </tr>
            </table>

            <!-- Item Details Section -->
            <h2 style="font-size: 1.2em; margin: 1em 0 0.4em 0; color: #333333;">@@Item_details_header@@</h2>
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <xsl:if test="notification_data/item_title != ''">
                <tr>
                  <td>
                    <strong>@@Item_title@@&#160;</strong>
                    <xsl:value-of select="notification_data/item_title" />
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/item_author != ''">
                <tr>
                  <td>
                    <strong>@@Item_author@@&#160;</strong>
                    <xsl:value-of select="notification_data/item_author" />
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/citation_id != ''">
                <tr>
                  <td>
                    <strong>@@Item_identifier@@&#160;</strong>
                    <xsl:value-of select="notification_data/citation_id" />
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/user_feedback != ''">
                <tr>
                  <td style="padding-top: 8px;">
                    <strong>@@Request_comment@@&#160;</strong>
                    <xsl:value-of select="notification_data/user_feedback" />
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/item_url != ''">
                <tr>
                  <td style="padding-top: 8px;">
                    <a href="{notification_data/item_url}" target="_blank" style="color: #23527c; font-weight: bold; text-decoration: underline;">
                      @@View_in_leganto@@
                    </a>
                  </td>
                </tr>
              </xsl:if>
            </table>

            <!-- Course Details Section -->
            <h2 style="font-size: 1.2em; margin: 1.2em 0 0.4em 0; color: #333333;">@@Course_details_header@@</h2>
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <xsl:if test="notification_data/course_name != ''">
                <tr>
                  <td>
                    <strong>@@Course_name@@&#160;</strong>
                    <xsl:value-of select="notification_data/course_name" />
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/course_code != ''">
                <tr>
                  <td>
                    <strong>@@Course_code@@&#160;</strong>
                    <xsl:value-of select="notification_data/course_code" />
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/course_instructors != ''">
                <tr>
                  <td>
                    <strong>@@Course_instructor@@&#160;</strong>
                    <xsl:value-of select="notification_data/course_instructors" />
                  </td>
                </tr>
              </xsl:if>
            </table>

            <!-- Requester Details Section -->
            <h2 style="font-size: 1.2em; margin: 1.2em 0 0.4em 0; color: #333333;">@@User_details_header@@</h2>
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <xsl:if test="notification_data/user_full_name != ''">
                <tr>
                  <td>
                    <xsl:value-of select="notification_data/user_full_name" />
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/user_email_address != ''">
                <tr>
                  <td>
                    <strong>@@User_email@@&#160;</strong>
                    <a href="mailto:{notification_data/user_email_address}" style="color: #23527c; text-decoration: underline;">
                      <xsl:value-of select="notification_data/user_email_address" />
                    </a>
                  </td>
                </tr>
              </xsl:if>

              <xsl:if test="notification_data/additional_email_addresses/string">
                <tr>
                  <td>
                    <strong>@@Additional_email_address@@&#160;</strong>
                    <xsl:for-each select="notification_data/additional_email_addresses/string">
                      <xsl:value-of select="." />
                      <xsl:if test="position() != last()">, </xsl:if>
                    </xsl:for-each>
                  </td>
                </tr>
              </xsl:if>
            </table>

            <br />

            <!-- Signature Table -->
            <table role="presentation" cellspacing="0" cellpadding="2" border="0">
              <tr>
                <td>@@Signature@@</td>
              </tr>
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
