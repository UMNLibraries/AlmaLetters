<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:include href="header.xsl" />
    <xsl:include href="mailReason.xsl" />
    <xsl:include href="footer.xsl" />
    <xsl:include href="style.xsl" />
    
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="generalStyle" />
            </head>
            <body>
                <xsl:attribute name="style">
                    <xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
                </xsl:attribute>
                <xsl:call-template name="head" /> <!-- header.xsl -->
                <br />
                <xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
                <br />
                <table>
                    <tr><td>
                        @@You_were_specify@@
                    </td></tr>
                </table>
                <br />
                <table cellspacing="0" cellpadding="5" border="0">
                    <tr><td>
                        <br />
                        @@title@@ :
                        <br />
                    </td>
                        <td>
                            <br />
                            <xsl:value-of  select="notification_data/title"/>
                            <br />
                        </td></tr>
                    <tr><td>
                        <br />
                        @@callNumber@@	:
                        <br />
                    </td>
                        <td>
                            <br />
                            <xsl:value-of  select="notification_data/poline_inventory/call_number"/>
                            <br />
                        </td>
                    </tr>
                </table>
                <br />
                <table>
                    <tr><td>Please check catalog for availability using the following link:</td></tr>
                    <br />
                    <xsl:variable name="campus" select="notification_data/receivers/receiver/user/campus_code"/>
                    
<xsl:choose>
  <xsl:when test="$campus = 'Crookston'">
    https://primo.lib.umn.edu/discovery/fulldisplay?vid=01UMN_INST:CROOKSTON&amp;context=L&amp;lang=en&amp;docid=alma<xsl:value-of select="notification_data/mms_id" />
  </xsl:when>
  <xsl:when test="$campus = 'Morris'">
    https://primo.lib.umn.edu/discovery/fulldisplay?vid=01UMN_INST:MORRIS&amp;context=L&amp;lang=en&amp;docid=alma<xsl:value-of select="notification_data/mms_id" />
  </xsl:when>
  <xsl:when test="$campus = 'Duluth'">
    https://primo.lib.umn.edu/discovery/fulldisplay?vid=01UMN_INST:DULUTH&amp;context=L&amp;lang=en&amp;docid=alma<xsl:value-of select="notification_data/mms_id" />
  </xsl:when>
  <xsl:otherwise>
    https://primo.lib.umn.edu/discovery/fulldisplay?vid=01UMN_INST:TWINCITIES&amp;context=L&amp;lang=en&amp;docid=alma<xsl:value-of select="notification_data/mms_id" />
  </xsl:otherwise>
</xsl:choose>
                    <br />
                    <br />
                    <tr><td>Please note that e-books, e-journals and databases may take up to 6 hours to appear in Libraries Search.</td></tr>
                    <br />
                    <br />
                </table>
                <table>
                    <tr><td>@@sincerely@@,</td></tr>
                    <tr><td>@@department@@</td></tr>
                    <tr><td>https://www.lib.umn.edu/systemlibraries</td></tr>
                </table>
                <xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>