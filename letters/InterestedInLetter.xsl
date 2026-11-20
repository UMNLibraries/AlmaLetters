<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="header.xsl" />
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

        <br />
        <xsl:call-template name="toWhomIsConcerned" /><!-- mailReason.xsl -->

        <div class="messageArea">
          <div class="messageBody">

            <!-- Notification Intro -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  @@You_were_specify@@
                </td>
              </tr>
            </table>

            <br />

            <!-- Item Details Key-Value Table -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <xsl:if test="notification_data/title != ''">
                <tr>
                  <td style="vertical-align: top; width: 15%;">
                    <strong>@@title@@:&#160;</strong>
                  </td>
                  <td>
                    <xsl:value-of select="notification_data/title"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/poline_inventory/call_number != ''">
                <tr>
                  <td style="vertical-align: top; width: 15%;">
                    <strong>@@callNumber@@:&#160;</strong>
                  </td>
                  <td>
                    <xsl:value-of select="notification_data/poline_inventory/call_number"/>
                  </td>
                </tr>
              </xsl:if>
            </table>

            <br />

            <!-- Catalog Availability Link & Search Note -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  Please check catalog for availability using the following link:
                </td>
              </tr>
              <tr>
                <td>
                  <xsl:variable name="campus" select="notification_data/receivers/receiver/user/campus_code"/>
                  <xsl:variable name="catalog_url">
                    <xsl:choose>
                      <xsl:when test="$campus = 'Crookston'">
                        <xsl:text>https://primo.lib.umn.edu/discovery/fulldisplay?vid=01UMN_INST:CROOKSTON&amp;context=L&amp;lang=en&amp;docid=alma</xsl:text><xsl:value-of select="notification_data/mms_id" />
                      </xsl:when>
                      <xsl:when test="$campus = 'Morris'">
                        <xsl:text>https://primo.lib.umn.edu/discovery/fulldisplay?vid=01UMN_INST:MORRIS&amp;context=L&amp;lang=en&amp;docid=alma</xsl:text><xsl:value-of select="notification_data/mms_id" />
                      </xsl:when>
                      <xsl:when test="$campus = 'Duluth'">
                        <xsl:text>https://primo.lib.umn.edu/discovery/fulldisplay?vid=01UMN_INST:DULUTH&amp;context=L&amp;lang=en&amp;docid=alma</xsl:text><xsl:value-of select="notification_data/mms_id" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>https://primo.lib.umn.edu/discovery/fulldisplay?vid=01UMN_INST:TWINCITIES&amp;context=L&amp;lang=en&amp;docid=alma</xsl:text><xsl:value-of select="notification_data/mms_id" />
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>
                  <a href="{$catalog_url}" target="_blank">
                    <xsl:value-of select="$catalog_url"/>
                  </a>
                </td>
              </tr>
              <tr>
                <td style="padding-top: 1em;">
                  Please note that e-books, e-journals and databases may take up to 6 hours to appear in Libraries Search.
                </td>
              </tr>
            </table>

            <br />

            <!-- Signature Table -->
            <table role="presentation" cellspacing="0" cellpadding="2" border="0">
              <tr><td>@@sincerely@@,</td></tr>
              <tr><td>@@department@@</td></tr>
              <tr>
                <td>
                  <a href="https://www.lib.umn.edu/systemlibraries" target="_blank">https://www.lib.umn.edu/systemlibraries</a>
                </td>
              </tr>
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
