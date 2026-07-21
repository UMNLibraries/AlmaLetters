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
 
            <!-- Added role="presentation" to hide layout table from screen readers -->
            <table cellspacing="0" cellpadding="5" border="0" role="presentation"> 
              <tr> 
                  <td> 
                    @@message@@ 
                    <br/><br/> 
                </td> 
              </tr> 
              <tr> 
                  <td> 
                    <!-- Changed from <b> to a semantic <h2> heading for layout navigation -->
                    <h2 style="font-size: 1.2em; margin: 0 0 0.5em 0;">@@loans@@</h2> 
                </td> 
              </tr> 
 
              <tr> 
                <td> 
                    <table cellpadding="5" class="listing"> 
                        <xsl:attribute name="style"> 
                            <xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl --> 
                        </xsl:attribute> 
                        <tr> 
                            <!-- Added scope="col" to associate headers with data cells -->
                            <th scope="col">@@title@@</th> 
                            <th scope="col">@@description@@</th> 
                            <th scope="col">Barcode</th> <!-- Fixed mismatch: Your code prints barcode here, not author -->
                            <th scope="col">@@due_date@@</th> 
                            <th scope="col">@@library@@</th> 
                        </tr> 
 
                        <xsl:for-each select="notification_data/item_loans/item_loan"> 
                        <tr> 
                            <td><xsl:value-of select="title"/></td> 
                            <td><xsl:value-of select="description"/></td> 
                            <td><xsl:value-of select="barcode"/></td> 
                            <td><xsl:value-of select="due_date"/></td> 
                            <td><xsl:value-of select="library_name"/></td> 
 
                        </tr> 
                        </xsl:for-each> 
 
                    </table> 
                </td> 
              </tr> 
             </table> 
                <br /> 
                <br /> 
                @@additional_info_1@@ 
            <br /> 
            @@additional_info_2@@ 
                <br /> 
            
            <!-- Added role="presentation" to layout table -->
            <table style="margin:1em 0 1em 0" role="presentation"> 
              <tbody><tr> 
                <td> 
                  If you have any questions or if we can assist you further, <a href="https://www.lib.umn.edu/systemlibraries" target="_blank">please contact us at your campus library.</a> 
                </td> 
              </tr> 
             </tbody> 
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
