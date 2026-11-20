<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="toWhomIsConcerned">
  <table cellspacing="0" cellpadding="0" border="0" role="presentation">
    <tr>
      <td style="padding: 0.5em 0;">
        <h2 style="font-size: 1.1em; font-weight: normal; margin: 0; color: #333333;">
          <xsl:for-each select="notification_data">
            @@dear@@&#160;<xsl:value-of select="receivers/receiver/user/first_name"/>&#160;<xsl:value-of select="receivers/receiver/user/last_name"/>,
          </xsl:for-each>
        </h2>
      </td>
    </tr>
  </table>
</xsl:template>

</xsl:stylesheet>