<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="utf-8" />

  <xsl:template match="/">
    <html lang="en">
      <xsl:if test="notification_data/languages/string">
        <xsl:attribute name="lang">
          <xsl:value-of select="notification_data/languages/string"/>
        </xsl:attribute>
      </xsl:if>

      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>
          <xsl:choose>
            <xsl:when test="/notification_data/alert_title != ''">
              <xsl:value-of select="/notification_data/alert_title"/>
            </xsl:when>
            <xsl:when test="/notification_data/general_data/subject != ''">
              <xsl:value-of select="/notification_data/general_data/subject"/>
            </xsl:when>
            <xsl:otherwise>Library Search Alert</xsl:otherwise>
          </xsl:choose>
        </title>
      </head>

      <body style="margin: 0; padding: 16px 0; font-family: 'Source Sans Pro', 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;">
        <table role="presentation" cellpadding="0" cellspacing="0" border="0" style="margin: 0 auto; width: 100%; max-width: 600px; border-collapse: collapse;">

          <!-- Header Logo Banner -->
          <xsl:if test="/notification_data/logo_path != ''">
            <tr>
              <td style="background-color: #7a0019; border-top-left-radius: 15px; border-top-right-radius: 15px; padding: 14px 15px;">
                <img alt="Library Logo" style="height: 35px; display: block; border: 0;">
                  <xsl:attribute name="src">
                    <xsl:value-of select="/notification_data/logo_path"/>
                  </xsl:attribute>
                </img>
              </td>
            </tr>
          </xsl:if>

          <!-- Alert Title & Search Query Heading -->
          <tr>
            <td style="background-color: #7a0019; padding: 0 15px; color: #ffffff; box-shadow: inset 0 3px 10px -2px rgba(0,0,0,0.3);">
              <h1 style="font-size: 1.5em; font-weight: 600; margin: 30px 0 10px 0; line-height: 1.3; color: #ffffff;">
                <xsl:value-of select="/notification_data/alert_title"/>
              </h1>
              <p style="font-size: 1rem; margin: 0 0 30px 0; font-weight: normal; line-height: 1.4; color: #ffffff;">
                <xsl:value-of select="/notification_data/alert_heading"/>
                <xsl:if test="/notification_data/search_query != ''">
                  <xsl:text> </xsl:text>
                  <a target="_blank" style="font-style: italic; text-decoration: underline; color: #ffcc33;">
                    <xsl:attribute name="href">
                      <xsl:value-of select="/notification_data/link/node()"/>
                    </xsl:attribute>
                    <xsl:value-of select="/notification_data/search_query"/>
                  </a>
                </xsl:if>
              </p>
            </td>
          </tr>

          <!-- Alert Subtitle Bar -->
          <xsl:if test="/notification_data/alert_subtitle != ''">
            <tr>
              <td style="background-color: #f3f3f3; padding: 15px; box-shadow: inset 0 3px 10px -2px rgba(0,0,0,0.3); font-style: italic;">
                <h2 style="font-size: 15px; margin: 0; font-weight: normal; color: #333333;">
                  <xsl:value-of select="/notification_data/alert_subtitle"/>
                </h2>
              </td>
            </tr>
          </xsl:if>

          <!-- Saved Search Alert Items -->
          <tr>
            <td style="background-color: #f3f3f3; padding: 15px 0; box-shadow: inset 0 4px 5px -2px rgba(0,0,0,0.3);">
              <table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width: 100%; border-collapse: collapse;">
                <xsl:for-each select="/notification_data/items/saved_searches_letter_item">
                  <tr style="background-color: #ffffff;">
                    <td style="padding: 15px; border-bottom: 1px solid #e0e0e0;">
                      <xsl:if test="type != ''">
                        <p style="margin: 0 0 4px 0; text-transform: uppercase; letter-spacing: 0.07em; font-weight: 600; font-size: 0.8em; color: #6d6d6d;">
                          <xsl:value-of select="type" disable-output-escaping="yes"/>
                        </p>
                      </xsl:if>

                      <h3 style="margin: 4px 0 6px 0; font-size: 1.25em; font-weight: 600; line-height: 1.3;">
                        <a target="_blank" style="text-decoration: underline; color: #44707b;">
                          <xsl:attribute name="href">
                            <xsl:value-of select="url" disable-output-escaping="yes"/>
                          </xsl:attribute>
                          <xsl:value-of select="title" disable-output-escaping="yes"/>
                        </a>
                      </h3>

                      <xsl:if test="creator != ''">
                        <p style="margin: 0; color: #3a3a3a; font-weight: 400; font-size: 0.85rem; line-height: 1.4;">
                          <xsl:value-of select="creator" disable-output-escaping="yes"/>
                        </p>
                      </xsl:if>
                    </td>
                  </tr>
                </xsl:for-each>
              </table>
            </td>
          </tr>

          <!-- Footer Unsubscribe Link -->
          <xsl:if test="/notification_data/alert_unsubscribe != ''">
            <tr>
              <td style="background-color: #7a0019; text-align: center; padding: 15px; border-bottom-left-radius: 15px; border-bottom-right-radius: 15px;">
                <a target="_blank" style="color: #ffffff; text-decoration: underline; font-size: 0.95rem;">
                  <xsl:attribute name="href">
                    <xsl:value-of select="/notification_data/alert_unsubscribe_link/node()"/>
                  </xsl:attribute>
                  <xsl:value-of select="/notification_data/alert_unsubscribe"/>
                </a>
              </td>
            </tr>
          </xsl:if>

        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
