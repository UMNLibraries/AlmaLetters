<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="head">
  <table cellspacing="0" cellpadding="5" border="0" role="presentation">
    <xsl:attribute name="style">
      <xsl:call-template name="headerTableStyleCss" />
    </xsl:attribute>
    <tr>
      <xsl:attribute name="style">
        <xsl:call-template name="headerLogoStyleCss" />
      </xsl:attribute>
      <td colspan="2">
        <div id="mailHeader">
          <div id="logoContainer" class="alignLeft">
            <img src="cid:logo.jpg" alt="University of Minnesota Libraries" />
          </div>
        </div>
      </td>
    </tr>
    <tr>
      <xsl:for-each select="notification_data/general_data">
        <td>
          <h1 style="font-size: 1.4em; margin: 0; font-weight: bold; color: #333333;">
            <xsl:value-of select="letter_name"/>
          </h1>
        </td>
        <td align="right" style="color: #333333;">
          <xsl:value-of select="current_date"/>
        </td>
      </xsl:for-each>
    </tr>
  </table>
</xsl:template>

</xsl:stylesheet>