<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:include href="senderReceiver.xsl" />
    <xsl:include href="mailReason.xsl" />
    
    <xsl:include href="style.xsl" />
    <xsl:include href="recordTitle.xsl" />
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="generalStyle" />
                
                
            </head>
            
            <body>
                <b>@@requested_for@@ : <h1><xsl:value-of select="notification_data/user_for_printing/name"/></h1></b>
                
                <div class="messageArea">
                    <div class="messageBody">
                        <table cellspacing="0" cellpadding="5" border="0">
                           <xsl:choose>
                                    <xsl:when
                                        test="notification_data/phys_item_display/location_code = 'ILLRS'">
                                        <xsl:message terminate="yes">
                                        </xsl:message>
                                        
                                    </xsl:when>
                                    <xsl:otherwise>                            
                                        
                                        <tr>
                                            <td><xsl:call-template name="recordTitle" />
                                            </td>
                                        </tr>
                                    </xsl:otherwise>
                                </xsl:choose>
                            <xsl:if test="notification_data/phys_item_display/edition != ''">
                                <tr>
                                    <td>@@edition@@: <xsl:value-of select="notification_data/phys_item_display/edition"/></td>
                                </tr>
                            </xsl:if>
                            <xsl:if test="notification_data/phys_item_display/imprint != ''">
                                <tr>
                                    <td>@@imprint@@: <xsl:value-of select="notification_data/phys_item_display/imprint"/></td>
                                </tr>
                            </xsl:if>
                            
                            <b></b>
                            <tr>
                                <td><b>@@location@@: </b><xsl:value-of select="notification_data/phys_item_display/location_name"/></td>
                                <xsl:if test="notification_data/phys_item_display/call_number != ''">
                                    <td><b>@@call_number@@: </b><xsl:value-of select="notification_data/phys_item_display/call_number"/></td>
                                </xsl:if>
                                <xsl:if test="notification_data/phys_item_display/accession_number != ''">
                                    <td><b>@@accession_number@@: </b><xsl:value-of select="notification_data/phys_item_display/accession_number"/></td>
                                </xsl:if>
                            </tr>
                            <xsl:if  test="notification_data/phys_item_display/shelving_location/string" >
                                <xsl:if  test="notification_data/request/selected_inventory_type='ITEM'" >
                                    <tr>
                                        <td><b>@@shelving_location_for_item@@: </b>
                                            <xsl:for-each select="notification_data/phys_item_display/shelving_location/string">
                                                <xsl:value-of select="."/>
                                                &#160;
                                            </xsl:for-each>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if  test="notification_data/request/selected_inventory_type='HOLDING'" >
                                    <tr>
                                        <td><b>@@shelving_locations_for_holding@@: </b>
                                            <xsl:for-each select="notification_data/phys_item_display/shelving_location/string">
                                                <xsl:value-of select="."/>
                                                &#160;
                                            </xsl:for-each>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if  test="notification_data/request/selected_inventory_type='VIRTUAL_HOLDING'" >
                                    <tr>
                                        <td><b>@@shelving_locations_for_holding@@: </b>
                                            <xsl:for-each select="notification_data/phys_item_display/shelving_location/string">
                                                <xsl:value-of select="."/>
                                                &#160;
                                            </xsl:for-each>
                                        </td>
                                    </tr>
                                </xsl:if>
                            </xsl:if>
                            <xsl:if  test="notification_data/phys_item_display/display_alt_call_numbers/string" >
                                <xsl:if  test="notification_data/request/selected_inventory_type='ITEM'" >
                                    <tr>
                                        <td><b>@@alt_call_number@@: </b>
                                            <xsl:for-each select="notification_data/phys_item_display/display_alt_call_numbers/string">
                                                <xsl:value-of select="."/>
                                                &#160;
                                            </xsl:for-each>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if  test="notification_data/request/selected_inventory_type='HOLDING'" >
                                    <tr>
                                        <td><b>@@alt_call_number@@: </b>
                                            <xsl:for-each select="notification_data/phys_item_display/display_alt_call_numbers/string">
                                                <xsl:value-of select="."/>
                                                &#160;
                                            </xsl:for-each>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if  test="notification_data/request/selected_inventory_type='VIRTUAL_HOLDING'" >
                                    <tr>
                                        <td><b>@@alt_call_number@@: </b>
                                            <xsl:for-each select="notification_data/phys_item_display/display_alt_call_numbers/string">
                                                <xsl:value-of select="."/>
                                                &#160;
                                            </xsl:for-each>
                                        </td>
                                    </tr>
                                </xsl:if>
                            </xsl:if>
                            
                            <b></b>
                            
                            <tr>
                                <td><b>@@move_to_library@@: </b><xsl:value-of select="notification_data/destination"/></td>
                            </tr>
                            <tr>
                                <td><b>@@request_type@@: </b><xsl:value-of select="notification_data/request_type"/></td>
                            </tr>
                            
                            <xsl:if test="notification_data/request/system_notes != ''">
                                <tr>
                                    <td><b>@@system_notes@@:</b><xsl:value-of select="notification_data/request/system_notes"/></td>
                                </tr>
                            </xsl:if>
                            
                            <xsl:if test="notification_data/request/note != ''">
                                <tr>
                                    <td><b>@@request_note@@:</b> <xsl:value-of select="notification_data/request/note"/></td>
                                </tr>
                            </xsl:if>
                            
                        </table>
                    </div>
                </div>
                
                
                
                
                
            </body>
        </html>
        
        
    </xsl:template>
</xsl:stylesheet>