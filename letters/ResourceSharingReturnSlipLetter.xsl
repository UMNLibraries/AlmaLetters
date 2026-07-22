<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="mailReason.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="style.xsl"/>
	<xsl:include href="recordTitle.xsl"/>
	<xsl:template match="/">
		<html>
			<xsl:if test="notification_data/languages/string">
				<xsl:attribute name="lang">
					<xsl:value-of select="notification_data/languages/string"/>
				</xsl:attribute>
			</xsl:if>

			<head>
				<title>
					<xsl:value-of select="notification_data/general_data/subject"/>
				</title>

				<xsl:call-template name="generalStyle"/>
			</head>
			<body>
				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss"/>
					<!-- style.xsl -->
				</xsl:attribute>
<!--
				<xsl:call-template name="head"/>
-->
				<div class="messageArea">
					<div class="messageBody">
						<table role='presentation'  cellspacing="0" cellpadding="1" border="0">
							<xsl:attribute name="style">
								<xsl:call-template name="listStyleCss"/>
								<!-- style.xsl -->
							</xsl:attribute>
							<tr>
								<td>
								<br/>
									<strong><h1> @@returned_to@@: <xsl:value-of select="notification_data/alternate_symbol"/></h1></strong>
								</td>
							</tr>
							<tr>
								<td>
									<strong>@@returned@@</strong>
								</td>
							</tr>
							<tr>
								<td>
								<br/>
									<strong> @@returned_to@@: </strong>
									<xsl:value-of select="notification_data/partner_name"/>
								</td>
							</tr>
							<xsl:if test="notification_data/request/return_info !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/request/return_info"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<strong> @@address@@: </strong>
								</td>
							</tr>
							<xsl:if test="notification_data/partner_address/line1 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/partner_address/line1"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/partner_address/line2 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/partner_address/line2"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/partner_address/line3 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/partner_address/line3"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/partner_address/line4 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/partner_address/line4"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/partner_address/line5 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/partner_address/line5"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/partner_address/city !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/partner_address/city"/>, <xsl:value-of select="notification_data/partner_address/state_province"/> <xsl:text> </xsl:text><xsl:value-of select="notification_data/partner_address/postal_code"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/partner_address/country !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/partner_address/country"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<strong> @@email@@: </strong>
									<xsl:value-of select="notification_data/partner_email/email"/>
								</td>
							</tr>
							<tr>
								<td>
									<strong> @@phone@@: </strong>
									<xsl:value-of select="notification_data/partner_phone/phone"/>
								</td>
							</tr>
						</table>
						<br/>
						<br/>
		                	<table cellpadding="3" class="listing">
								<xsl:attribute name="style">
									<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
								</xsl:attribute>
								<tr>
									<th width="20%">@@title@@</th>
									<th width="20%">@@journal_title@@</th>
									<th width="15%">@@author@@</th>
									<th width="10%">@@volume@@</th>
									<th width="10%">@@issue@@</th>
									<th width="15%">@@note_to_partner@@</th>
								</tr>

								<tr>
									<td><xsl:value-of select="notification_data/request/display/title"/></td>
									<td><xsl:value-of select="notification_data/request/display/journal_title"/></td>
									<td><xsl:value-of select="notification_data/request/display/author"/></td>
									<td><xsl:value-of select="notification_data/request/display/volume"/></td>
									<td><xsl:value-of select="notification_data/request/display/issue"/></td>
									<td><xsl:value-of select="notification_data/note_to_partner"/></td>
								</tr>
							</table>
						<br/>
						<br/>
						
						<table role='presentation'  cellspacing="0" cellpadding="5" border="0">
							<xsl:attribute name="style">
								<xsl:call-template name="listStyleCss"/>
								<!-- style.xsl -->
							</xsl:attribute>
							<tr>
								<td>
									<br/>
									<strong> @@arrival_date@@: </strong>
									<xsl:value-of select="notification_data/request/item_arrival_date"/>
								</td>
							</tr>
							<tr>
								<td>
									<strong> @@required_return_date@@: </strong>
									<xsl:value-of select="notification_data/request/due_date"/>
								</td>
							</tr>
														<tr>
								<td><strong> @@request_id@@: </strong><img src="externalId.png" alt="externalId"/></td>
							</tr>
						</table>

						<br/><br/>


						<table role='presentation' >
<!--
                            <tr>
							<td>@@signature@@</td>
							</tr>
-->

                            <xsl:choose>
                                <xsl:when
                                    test="/notification_data/library/name = 'TC Wilson Library'">
                                    <tr>
                                        <td>MNU - University of Minnesota, Twin Cities</td></tr>
                                    
                                </xsl:when>
                                <xsl:when
                                    test="/notification_data/library/name = 'CROOKSTON Moe Library'">
                                    <tr>
                                        <td>MCR - University of Minnesota, Crookston</td></tr>
                                    
                                </xsl:when>
                                <xsl:when
                                    test="/notification_data/library/name = 'DULUTH Martin Library'">
                                    <tr>
                                        <td>MND - University of Minnesota, Duluth</td></tr>
                                    
                                </xsl:when>
                                <xsl:when
                                    test="/notification_data/library/name = 'MORRIS Briggs Library'">
                                    <tr>
                                        <td>MNX - University of Minnesota, Morris</td></tr>
                                    
                                </xsl:when>
                                <xsl:when
                                    test="/notification_data/library/name = 'TC Law Library'">
                                    <tr>
                                        <td>MLL - University of Minnesota, Law Library</td></tr>
                                    
                                </xsl:when>
                                <xsl:otherwise>                            

                                <tr>
                                    <td><text>University of Minnesota</text></td>
                                </tr>
                                </xsl:otherwise>
                            </xsl:choose>

<!--
							<tr>
								<td>
									<xsl:value-of select="notification_data/library/name"/>
								</td>
							</tr>
-->
							<xsl:if test="notification_data/library/address/line1 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line1"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/line2 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line2"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/line3 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line3"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/line4 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line4"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/line5 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line5"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/city !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/city"/>, <xsl:value-of select="notification_data/library/address/state_province"/> <xsl:text> </xsl:text><xsl:value-of select="notification_data/library/address/postal_code"/>
									</td>
								</tr>
							</xsl:if>
<!--
							<xsl:if test="notification_data/library/address/city !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/city"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/state_province !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/state_province"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/postal_code !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/postal_code"/>
									</td>
								</tr>
							</xsl:if>
-->
							<xsl:if test="notification_data/library/address/country !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/country"/>
									</td>
								</tr>

							</xsl:if>
						</table>
					</div>
				</div>
                <xsl:call-template name="lastFooter"/>
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
