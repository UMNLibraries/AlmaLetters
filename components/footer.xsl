<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">




<xsl:template name="salutation">

</xsl:template>
<xsl:template name="lastFooter">

	<table>
	<xsl:attribute name="style">
		<xsl:call-template name="footerTableStyleCss" /> <!-- style.xsl -->
	</xsl:attribute>

	</table>
<hr />
</xsl:template>
<xsl:template name="contactUs">
	<table align="left">
	<tr>
	<td align="left">
	<a>
                        <xsl:attribute name="href">
                          @@email_contact_us@@
                        </xsl:attribute>
						@@contact_us@@
					</a>
	</td>
</tr>
	</table>
</xsl:template>
<xsl:template name="myAccount">
	<table align="right">
	<tr>
	<td align="right">
	<a>
                        <xsl:attribute name="href">
                          @@email_my_account@@
                        </xsl:attribute>
						@@my_account@@
					</a>
	</td>
</tr>
	</table>
</xsl:template>

<xsl:template name="Disclaimer">
<p style="display: inline-block;"><b>CONFIDENTIALITY NOTICE:</b> This e-mail may include confidential information, and may be used only by the person(s) to whom it is addressed or intended. Please note that the use of any information within may be restricted by privacy laws.  If the reader of this e-mail is not the intended recipient, the reader is hereby notified that any distribution or copying of this e-mail is prohibited. If you have received this e-mail in error, please notify the sender by replying to this message and delete this e-mail immediately.</p>


</xsl:template>

</xsl:stylesheet>
