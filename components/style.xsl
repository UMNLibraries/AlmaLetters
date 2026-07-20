<?xml version="1.0" encoding="utf-8"?> 
 
<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
 
<xsl:template name="generalStyle"> 
 <style> 
 body {background-color:#ffffff;} 
 .listing td {border-bottom: 1px solid #eeeeee;} 
 .listing tr:hover td {background-color:#eeeeee;} 
 .listing th {background-color:#f5f5f5; color:#333333;} 
 h4{line-height: 1.2em;} 
 
 /* Accessible Keyboard Focus Styles */
 a:focus {
   outline: 3px solid #0056b3 !important; /* Bright accessible blue outline */
   outline-offset: 2px;
   background-color: #f0f7ff; /* Light blue background highlight */
 }
 </style> 
</xsl:template>
 
<xsl:template name="bodyStyleCss"> 
font-family: Arial, sans-serif; color:#333333; margin:0; padding:0em; font-size:100%; line-height: 1.5;
<!-- Fixed: Changed font-size from 80% to 100% to meet minimum readability standards (14px-16px equivalent) -->
</xsl:template> 
 
<xsl:template name="listStyleCss"> 
list-style: none; margin:0 0 0 0em; padding:0 
</xsl:template> 
 
<xsl:template name="mainTableStyleCss"> 
width:100%; text-align:left 
</xsl:template> 
 
<xsl:template name="headerLogoStyleCss"> 
background-color:#ffffff;  width:100%; 
</xsl:template> 
 
<xsl:template name="headerTableStyleCss"> 
background-color:#e9e9e9;  width:100%; height:30px; color:#333333;
</xsl:template> 
 
<xsl:template name="footerTableStyleCss"> 
background-color:#ffffff;  width:100%; color:#333333; margin-top:1em;  font-weight:700; line-height:2em; font-size:120%; 
<!-- Fixed: Changed color from #fff to #333333 so text is no longer hidden white-on-white -->
</xsl:template> 
 
</xsl:stylesheet>
