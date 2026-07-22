<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="recordTitle">
  <div class="recordDetails" style="margin: 0.5em 0; line-height: 1.4; color: #333333;">
    <p style="margin: 0.2em 0;">
      <strong>Title:</strong>&#160;<xsl:value-of select="notification_data/item_loan/title"/>
    </p>
    <xsl:if select="notification_data/item_loan/author">
      <p style="margin: 0.2em 0;">
        <strong>Author:</strong>&#160;<xsl:value-of select="notification_data/item_loan/author"/>
      </p>
    </xsl:if>
    <xsl:if select="notification_data/item_loan/barcode">
      <p style="margin: 0.2em 0;">
        <strong>Barcode:</strong>&#160;<xsl:value-of select="notification_data/item_loan/barcode"/>
      </p>
    </xsl:if>
  </div>
</xsl:template>

</xsl:stylesheet>