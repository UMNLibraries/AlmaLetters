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

        <!-- Query Type Header Banner -->
        <table role="presentation" cellspacing="0" cellpadding="5" border="0">
          <tr>
            <td>
              <h2 style="font-size: 1.3em; margin: 0.5em 0; color: #333333;">
                <xsl:choose>
                  <xsl:when test="notification_data/query_type = 'Type_1_query_name'">@@Type_1_header@@</xsl:when>
                  <xsl:when test="notification_data/query_type = 'Type_2_query_name'">@@Type_2_header@@</xsl:when>
                  <xsl:when test="notification_data/query_type = 'Type_3_query_name'">@@Type_3_header@@</xsl:when>
                  <xsl:when test="notification_data/query_type = 'Type_4_query_name'">@@Type_4_header@@</xsl:when>
                  <xsl:when test="notification_data/query_type = 'Type_5_query_name'">@@Type_5_header@@</xsl:when>
                  <xsl:when test="notification_data/query_type = 'Type_6_query_name'">@@Type_1_header@@</xsl:when>
                  <xsl:otherwise>@@Type_1_header@@</xsl:otherwise>
                </xsl:choose>
              </h2>
            </td>
          </tr>
        </table>

        <div class="messageArea">
          <div class="messageBody">

            <!-- Requested Item Intro -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  <p style="margin: 0;"><strong>@@requested@@:</strong></p>
                </td>
              </tr>
            </table>

            <br />

            <!-- Requested Item Details -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <xsl:attribute name="style">
                <xsl:call-template name="listStyleCss" /><!-- style.xsl -->
              </xsl:attribute>

              <xsl:if test="notification_data/request/display/material_type != ''">
                <tr>
                  <td>
                    <strong>@@format@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/material_type" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/title != ''">
                <tr>
                  <td>
                    <strong>@@title@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/title" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/journal_title != ''">
                <tr>
                  <td>
                    <strong>@@journal_title@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/journal_title" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/author != ''">
                <tr>
                  <td>
                    <strong>@@author@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/author" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/autho_initials != ''">
                <tr>
                  <td>
                    <strong>@@author_initials@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/autho_initials" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/publisher != ''">
                <tr>
                  <td>
                    <strong>@@publisher@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/publisher" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/place_of_publication != ''">
                <tr>
                  <td>
                    <strong>@@place_of_publication@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/place_of_publication" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/publication_date != ''">
                <tr>
                  <td>
                    <strong>@@publication_date@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/publication_date" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/year != ''">
                <tr>
                  <td>
                    <strong>@@year@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/year" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/edition != ''">
                <tr>
                  <td>
                    <strong>@@edition@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/edition" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/call_number != ''">
                <tr>
                  <td>
                    <strong>@@call_number@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/call_number" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/volume != ''">
                <tr>
                  <td>
                    <strong>@@volume@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/volume" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/issue != ''">
                <tr>
                  <td>
                    <strong>@@issue@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/issue" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/additional_person_name != ''">
                <tr>
                  <td>
                    <strong>@@additional_person_name@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/additional_person_name" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/source != ''">
                <tr>
                  <td>
                    <strong>@@source@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/source" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/series_title_number != ''">
                <tr>
                  <td>
                    <strong>@@series_title_number@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/series_title_number" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/isbn != ''">
                <tr>
                  <td>
                    <strong>@@isbn@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/isbn" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/issn != ''">
                <tr>
                  <td>
                    <strong>@@issn@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/issn" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/doi != ''">
                <tr>
                  <td>
                    <strong>@@doi@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/doi" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/pmid != ''">
                <tr>
                  <td>
                    <strong>@@pmid@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/pmid" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/chapter != ''">
                <tr>
                  <td>
                    <strong>@@chapter@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/chapter" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/volume_bk != ''">
                <tr>
                  <td>
                    <strong>@@volume@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/volume_bk" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/part != ''">
                <tr>
                  <td>
                    <strong>@@part@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/part" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/pages != ''">
                <tr>
                  <td>
                    <strong>@@pages@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/pages" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/start_page != ''">
                <tr>
                  <td>
                    <strong>@@start_page@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/start_page" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/display/end_page != ''">
                <tr>
                  <td>
                    <strong>@@end_page@@:</strong>&#160;<xsl:value-of select="notification_data/request/display/end_page" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/general_data/current_date != ''">
                <tr>
                  <td>
                    <strong>@@date@@:</strong>&#160;<xsl:value-of select="notification_data/general_data/current_date" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/external_request_id != ''">
                <tr>
                  <td>
                    <strong>@@request_id@@:</strong>&#160;<xsl:value-of select="notification_data/request/external_request_id" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/format_display != ''">
                <tr>
                  <td>
                    <strong>@@request_format@@:</strong>&#160;<xsl:value-of select="notification_data/request/format_display" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/max_fee != ''">
                <tr>
                  <td>
                    <strong>@@maximum_fee@@:</strong>&#160;<xsl:value-of select="notification_data/request/max_fee" />
                  </td>
                </tr>
              </xsl:if>
            </table>

            <br />

            <!-- Query to Patron Message -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  <p style="margin: 0;">@@query_to_patron@@</p>
                </td>
              </tr>
              <xsl:choose>
                <xsl:when test="notification_data/query_type = 'Type_1_query_name'">
                  <tr>
                    <td>@@Type_1_query_line_1@@ @@Type_1_query_line_2@@</td>
                  </tr>
                  <tr>
                    <td>@@Type_1_query_line_3@@</td>
                  </tr>
                </xsl:when>
                <xsl:when test="notification_data/query_type = 'Type_2_query_name'">
                  <tr>
                    <td>@@Type_2_query_line_1@@ @@Type_2_query_line_2@@</td>
                  </tr>
                  <tr>
                    <td>@@Type_2_query_line_3@@</td>
                  </tr>
                </xsl:when>
                <xsl:when test="notification_data/query_type = 'Type_3_query_name'">
                  <tr>
                    <td>@@Type_3_query_line_1@@ @@Type_3_query_line_2@@</td>
                  </tr>
                  <tr>
                    <td>@@Type_3_query_line_3@@</td>
                  </tr>
                </xsl:when>
                <xsl:when test="notification_data/query_type = 'Type_4_query_name'">
                  <tr>
                    <td>@@Type_4_query_line_1@@ @@Type_4_query_line_2@@</td>
                  </tr>
                  <tr>
                    <td>@@Type_4_query_line_3@@</td>
                  </tr>
                </xsl:when>
                <xsl:when test="notification_data/query_type = 'Type_5_query_name'">
                  <tr>
                    <td>@@Type_5_query_line_1@@</td>
                  </tr>
                </xsl:when>
                <xsl:when test="notification_data/query_type = 'Type_6_query_name'">
                  <tr>
                    <td>@@Type_6_query_line_1@@</td>
                  </tr>
                </xsl:when>
                <xsl:otherwise>
                  <tr>
                    <td>@@Type_1_query_line_1@@ @@Type_1_query_line_2@@</td>
                  </tr>
                  <tr>
                    <td>@@Type_1_query_line_3@@</td>
                  </tr>
                </xsl:otherwise>
              </xsl:choose>
            </table>

            <br />

            <!-- Query Note -->
            <xsl:if test="notification_data/query_note != ''">
              <table role="presentation" cellspacing="0" cellpadding="5" border="0">
                <tr>
                  <td>
                    <strong>@@query_note@@:</strong>&#160;<xsl:value-of select="notification_data/query_note" />
                  </td>
                </tr>
              </table>
              <br />
            </xsl:if>

            <!-- Campus Library Assistance Link -->
            <table role="presentation" cellspacing="0" cellpadding="5" border="0" style="margin: 0.5em 0;">
              <tr>
                <td>
                  If you have any questions or if we can assist you further, <a href="http://www.lib.umn.edu/ill-system-libraries" target="_blank" style="color: #23527c; text-decoration: underline;">please contact us at your campus library</a>.
                </td>
              </tr>
            </table>

            <!-- Signature & Library Address Block -->
            <table role="presentation" cellspacing="0" cellpadding="2" border="0">
              <tr>
                <td>@@Type_1_Sincerely@@</td>
              </tr>
              <tr>
                <td>
                  <address style="font-style: normal; line-height: 1.4; color: #333333;">
                    <xsl:if test="notification_data/library/name != ''">
                      <strong><xsl:value-of select="notification_data/library/name" /></strong><br />
                    </xsl:if>
                    <xsl:if test="notification_data/library/address/line1 != ''">
                      <xsl:value-of select="notification_data/library/address/line1" /><br />
                    </xsl:if>
                    <xsl:if test="notification_data/library/address/line2 != ''">
                      <xsl:value-of select="notification_data/library/address/line2" /><br />
                    </xsl:if>
                    <xsl:if test="notification_data/library/address/line3 != ''">
                      <xsl:value-of select="notification_data/library/address/line3" /><br />
                    </xsl:if>
                    <xsl:if test="notification_data/library/address/line4 != ''">
                      <xsl:value-of select="notification_data/library/address/line4" /><br />
                    </xsl:if>
                    <xsl:if test="notification_data/library/address/line5 != ''">
                      <xsl:value-of select="notification_data/library/address/line5" /><br />
                    </xsl:if>
                    <xsl:if test="notification_data/library/address/city != ''">
                      <xsl:value-of select="notification_data/library/address/city" />
                      <xsl:if test="notification_data/library/address/country != ''">, </xsl:if>
                    </xsl:if>
                    <xsl:if test="notification_data/library/address/country != ''">
                      <xsl:value-of select="notification_data/library/address/country" /><br />
                    </xsl:if>
                    <xsl:if test="notification_data/signature_email != ''">
                      <a href="mailto:{notification_data/signature_email}" style="color: #23527c; text-decoration: underline;">
                        <xsl:value-of select="notification_data/signature_email" />
                      </a>
                    </xsl:if>
                  </address>
                </td>
              </tr>
            </table>

          </div>
        </div>

        <!-- footer.xsl -->
        <xsl:call-template name="lastFooter" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
