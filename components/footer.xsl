<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="lastFooter">
  <table cellspacing="0" cellpadding="5" border="0" role="presentation">
    <xsl:attribute name="style">
      <xsl:call-template name="footerTableStyleCss" />
    </xsl:attribute>
    <tr>
      <td style="color: #333333; font-size: 0.9em; padding-top: 1em;">
        <p style="margin: 0;">University of Minnesota Libraries</p>
      </td>
    </tr>
  </table>
</xsl:template>

<xsl:template name="myAccount">
  <table cellspacing="0" cellpadding="2" border="0" role="presentation">
    <tr>
      <td>
        <a href="https://primo.lib.umn.edu" target="_blank" style="color: #0056b3; text-decoration: underline;">
          Log in to My Library Account to view loans and renewals
        </a>
      </td>
    </tr>
  </table>
</xsl:template>

<xsl:template name="contactUs">
  <table cellspacing="0" cellpadding="2" border="0" role="presentation">
    <tr>
      <td>
        <a href="https://www.lib.umn.edu/contact" target="_blank" style="color: #0056b3; text-decoration: underline;">
          Contact University of Minnesota Libraries for assistance
        </a>
      </td>
    </tr>
  </table>
</xsl:template>

<xsl:template name="Disclaimer">
  <!-- Decorative/informational block; wrapped in presentation table -->
  <table cellspacing="0" cellpadding="2" border="0" role="presentation">
    <tr>
      <td style="font-size: 0.85em; color: #555555;">
        <xsl:value-of select="notification_data/legal_note"/>
      </td>
    </tr>
  </table>
</xsl:template>

</xsl:stylesheet>