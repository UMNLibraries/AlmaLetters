<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="senderReceiver">
  <table cellspacing="0" cellpadding="0" border="0" role="presentation" style="width: 100%; margin-bottom: 1em;">
    <tr>
      <!-- Patron Address Block -->
      <td valign="top" style="width: 100%;">
        <address style="font-style: normal; line-height: 1.4; color: #333333;">
          <xsl:if test="notification_data/user_for_printing/name != ''">
            <strong><xsl:value-of select="notification_data/user_for_printing/name"/></strong><br/>
          </xsl:if>
          
          <xsl:if test="notification_data/user_for_printing/address1 != ''">
            <xsl:value-of select="notification_data/user_for_printing/address1"/><br/>
          </xsl:if>
          
          <xsl:if test="notification_data/user_for_printing/address2 != ''">
            <xsl:value-of select="notification_data/user_for_printing/address2"/><br/>
          </xsl:if>
          
          <xsl:if test="notification_data/user_for_printing/address3 != ''">
            <xsl:value-of select="notification_data/user_for_printing/address3"/><br/>
          </xsl:if>

          <!-- City, State Postal Code Line -->
          <xsl:if test="notification_data/user_for_printing/city != ''">
            <xsl:value-of select="notification_data/user_for_printing/city"/>
            <!-- Only print comma if state or zip exists -->
            <xsl:if test="notification_data/user_for_printing/state != '' or notification_data/user_for_printing/postal_code != ''">, </xsl:if>
          </xsl:if>
          
          <xsl:if test="notification_data/user_for_printing/state != ''">
            <xsl:value-of select="notification_data/user_for_printing/state"/>&#160;
          </xsl:if>
          
          <xsl:if test="notification_data/user_for_printing/postal_code != ''">
            <xsl:value-of select="notification_data/user_for_printing/postal_code"/>
          </xsl:if>
        </address>
      </td>
    </tr>
  </table>
</xsl:template>

</xsl:stylesheet>