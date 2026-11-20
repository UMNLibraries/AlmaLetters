<?xml version="1.0" encoding="utf-8"?> 
<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 

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

                <!-- Header Banner -->
                <table role="presentation" cellspacing="0" cellpadding="5" border="0"> 
                    <tr> 
                        <td> 
                            <!-- Converted h3 to a semantic h2 heading -->
                            <h2 style="font-size: 1.3em; margin: 0.5em 0; color: #333333;">@@header@@</h2> 
                        </td> 
                    </tr> 
                </table> 

                <div class="messageArea"> 
                    <div class="messageBody"> 
                        <table role="presentation" cellspacing="0" cellpadding="5" border="0"> 
                            <tr> 
                                <td> 
                                    <strong>@@requested@@:&#160;<xsl:value-of select="notification_data/request/last_send_date" /></strong> 
                                </td> 
                            </tr> 
                        </table> 

                        <table role="presentation" cellspacing="0" cellpadding="5" border="0"> 
                            <xsl:attribute name="style"> 
                                <xsl:call-template name="listStyleCss" /> <!-- style.xsl --> 
                            </xsl:attribute> 

                            <tr> 
                                <td> 
                                    <strong>@@format@@:&#160;</strong> 
                                    <xsl:value-of select="notification_data/request/display/material_type" /> 
                                </td> 
                            </tr> 

                            <xsl:if test="notification_data/request/display/title != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@title@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/title" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/journal_title != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@journal_title@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/journal_title" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/author != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@author@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/author" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/autho_initials != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@author_initials@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/autho_initials" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/publisher != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@publisher@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/publisher" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/place_of_publication != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@place_of_publication@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/place_of_publication" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/publication_date != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@publication_date@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/publication_date" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/year != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@year@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/year" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/edition != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@edition@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/edition" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/call_number != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@call_number@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/call_number" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/volume != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@volume@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/volume" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/issue != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@issue@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/issue" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/additional_person_name != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@additional_person_name@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/additional_person_name" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/source != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@source@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/source" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/series_title_number != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@series_title_number@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/series_title_number" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/isbn != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@isbn@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/isbn" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/issn != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@issn@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/issn" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/doi != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@doi@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/doi" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/pmid != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@pmid@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/pmid" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/note != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@note@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/note" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/chapter != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@chapter@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/chapter" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/volume_bk != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@volume@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/volume_bk" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/part != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@part@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/part" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/pages != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@pages@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/pages" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/start_page != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@start_page@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/start_page" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/display/end_page != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@end_page@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/display/end_page" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/request/note != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@request_note@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/note" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <tr> 
                                <td> 
                                    <strong>@@date@@:&#160;</strong> 
                                    <xsl:value-of select="notification_data/general_data/current_date" /> 
                                </td> 
                            </tr> 

                            <xsl:if test="notification_data/request/external_request_id != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@request_id@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/external_request_id" /> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <tr> 
                                <td> 
                                    <strong>@@request_format@@:&#160;</strong> 
                                    <xsl:value-of select="notification_data/request/format_display" /> 
                                </td> 
                            </tr> 

                            <xsl:if test="notification_data/request/max_fee != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@maximum_fee@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/max_fee"/> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <xsl:if test="notification_data/level_of_service != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@level_of_service@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/level_of_service"/> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                        </table> 

                        <br /> 

                        <!-- Signature & Library Address Section -->
                        <table role="presentation" cellspacing="0" cellpadding="2" border="0"> 
                            <xsl:if test="notification_data/request/needed_by != ''"> 
                                <tr> 
                                    <td> 
                                        <strong>@@requested_by@@:&#160;</strong> 
                                        <xsl:value-of select="notification_data/request/needed_by"/> 
                                    </td> 
                                </tr> 
                            </xsl:if> 

                            <tr> 
                                <td>@@please_advise@@.</td> 
                            </tr> 
                            <tr> 
                                <td>@@signature@@</td> 
                            </tr> 
                            <tr> 
                                <td> 
                                    <address style="font-style: normal; line-height: 1.4; color: #333333;"> 
                                        <strong><xsl:value-of select="notification_data/library/name" /></strong><br/> 
                                        <xsl:if test="notification_data/library/address/line1 != ''"> 
                                            <xsl:value-of select="notification_data/library/address/line1" /><br/> 
                                        </xsl:if> 
                                        <xsl:if test="notification_data/library/address/line2 != ''"> 
                                            <xsl:value-of select="notification_data/library/address/line2" /><br/> 
                                        </xsl:if> 
                                        <xsl:if test="notification_data/library/address/line3 != ''"> 
                                            <xsl:value-of select="notification_data/library/address/line3" /><br/> 
                                        </xsl:if> 
                                        <xsl:if test="notification_data/library/address/line4 != ''"> 
                                            <xsl:value-of select="notification_data/library/address/line4" /><br/> 
                                        </xsl:if> 
                                        <xsl:if test="notification_data/library/address/line5 != ''"> 
                                            <xsl:value-of select="notification_data/library/address/line5" /><br/> 
                                        </xsl:if> 
                                        <xsl:if test="notification_data/library/address/city != ''"> 
                                            <xsl:value-of select="notification_data/library/address/city" /> 
                                            <xsl:if test="notification_data/library/address/country != ''">, </xsl:if> 
                                        </xsl:if> 
                                        <xsl:if test="notification_data/library/address/country != ''"> 
                                            <xsl:value-of select="notification_data/library/address/country" /> 
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
