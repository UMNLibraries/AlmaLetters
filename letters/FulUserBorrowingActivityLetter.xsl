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
      <head> 
        <title><xsl:value-of select="notification_data/general_data/subject"/></title>
        <xsl:call-template name="generalStyle" /> 
      </head> 
      <body> 
        <xsl:attribute name="style"> 
          <xsl:call-template name="bodyStyleCss" /><!-- style.xsl --> 
        </xsl:attribute> 
 
        <xsl:call-template name="head" /><!-- header.xsl --> 
        <xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl --> 
 
        <br /> 
        <xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl --> 
 
        <div class="messageArea"> 
          <div class="messageBody"> 
 
            <!-- Added role="presentation" to layout table -->
            <table cellspacing="0" cellpadding="3" border="0" role="presentation"> 
 
                <tr> 
                    <td><br/> 
                        Thank you for using the resources of the University of Minnesota libraries! As a monthly courtesy, we provide a report of up to 100 loans currently checked out to you. To find your complete list of current loans, check <a href="http://www.lib.umn.edu/systemlibraries">My Account</a> online. If you have any questions about returning, renewing items or fines assessments, <a href="https://www.lib.umn.edu/systemlibraries">please contact us at your campus library</a>. 
                    </td> 
                </tr> 
                <tr> 
                    <td> 
                        As always, your campus library staff is willing to help with your library and research needs. 
                        <br/><br/> 
                    </td> 
                </tr> 
 
         <xsl:if test="notification_data/item_loans/item_loan or notification_data/overdue_item_loans/item_loan"> 
 
                  <xsl:if test="notification_data/overdue_item_loans/item_loan"> 
 
                      <tr> 
                          <td> 
                            <!-- Converted bold text to a semantic h2 heading -->
                            <h2 style="font-size: 1.2em; margin: 0.5em 0;">@@overdue_loans@@</h2> 
                        </td> 
                      </tr> 
 
                      <tr> 
                        <td> 
                            <table cellpadding="3" class="listing"> 
                                <xsl:attribute name="style"> 
                                    <xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl --> 
                                </xsl:attribute> 
                                <tr> 
                                    <!-- Added scope="col" and fixed column 4 header mismatch -->
                                    <th scope="col" width="30%">@@title@@</th> 
                                    <th scope="col" width="10%">@@description@@</th> 
                                    <th scope="col" width="20%">@@author@@</th> 
                                    <th scope="col" width="10%">Barcode</th> 
                                    <th scope="col" width="10%">@@due_date@@</th> 
                                    <th scope="col" width="20%">@@library@@</th> 
                                </tr> 
 
                                <xsl:for-each select="notification_data/overdue_item_loans/item_loan"><xsl:sort select="due_date" order="ascending"/>  
                                <tr> 
                                    <td><xsl:value-of select="title"/></td> 
                                    <td><xsl:value-of select="description"/></td> 
                                    <td><xsl:value-of select="author"/></td> 
                                    <td><xsl:value-of select="barcode"/></td> 
                                    <td><xsl:value-of select="due_date"/></td> 
                                    <td><xsl:value-of select="library_name"/></td> 
                                </tr> 
                                </xsl:for-each> 
                            </table> 
                            <br/> 
                        </td> 
                      </tr> 
 
                  </xsl:if> 
 
                  <xsl:if test="notification_data/item_loans/item_loan"> 
 
                      <tr> 
                          <td> 
                            <!-- Converted bold text to a semantic h2 heading -->
                            <h2 style="font-size: 1.2em; margin: 0.5em 0;">@@loans@@</h2> 
                        </td> 
                      </tr> 
 
                      <tr> 
                        <td> 
                            <table cellpadding="3" class="listing"> 
                                <xsl:attribute name="style"> 
                                    <xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl --> 
                                </xsl:attribute> 
                                <tr> 
                                    <!-- Added scope="col" and fixed column 4 header mismatch -->
                                    <th scope="col" width="30%">@@title@@</th> 
                                    <th scope="col" width="10%">@@description@@</th> 
                                    <th scope="col" width="20%">@@author@@</th> 
                                    <th scope="col" width="10%">Barcode</th> 
                                    <th scope="col" width="10%">@@due_date@@</th> 
                                    <th scope="col" width="20%">@@library@@</th> 
                                </tr> 
 
                                <xsl:for-each select="notification_data/item_loans/item_loan"><xsl:sort select="due_date" order="ascending"/>  
                                <tr> 
                                    <td><xsl:value-of select="title"/></td> 
                                    <td><xsl:value-of select="description"/></td> 
                                    <td><xsl:value-of select="author"/></td> 
                                    <td><xsl:value-of select="barcode"/></td> 
                                    <td><xsl:value-of select="due_date"/></td> 
                                    <td><xsl:value-of select="library_name"/></td> 
                                </tr> 
                                </xsl:for-each> 
                            </table> 
 
                        </td> 
                      </tr> 
 
                      </xsl:if> 
 
              </xsl:if> 
 
              <!-- Fees Section --> 
              <xsl:if test="notification_data/organization_fee_list/string"> 
 
                  <!-- Fixed invalid HTML: Wrapped fee section header inside tr/td and converted to h2 -->
                  <tr> 
                      <td> 
                        <h2 style="font-size: 1.2em; margin: 0.5em 0;">Library Fines and Fees</h2> 
                      </td> 
                  </tr> 
                  <tr> 
                      <td> 
                        @@debt_message@@ 
                    </td> 
                  </tr> 
                  
                  <xsl:for-each select="notification_data/organization_fee_list/string"> 
                      <tr> 
                        <td><xsl:value-of select="."/></td> 
                    </tr> 
                  </xsl:for-each> 
 
                  <tr> 
                      <td> 
                        <b> 
                        @@total@@ <xsl:value-of select="notification_data/total_fee"/> 
                        </b> 
                    </td> 
                  </tr> 
 
              </xsl:if> 
              
             </table> 
 
            <br /> 
 
            <!-- Added role="presentation" to layout table -->
            <table role="presentation"> 
                <tr><td>@@sincerely@@</td></tr> 
                <tr><td>@@department@@</td></tr> 
            </table> 
 
          </div> 
        </div> 
 
        <!-- footer.xsl --> 
        <xsl:call-template name="lastFooter" /> 
        <xsl:call-template name="myAccount" /> 
        <xsl:call-template name="contactUs" /> 
        <xsl:call-template name="Disclaimer" /> 
      </body> 
    </html> 
  </xsl:template> 
</xsl:stylesheet>
