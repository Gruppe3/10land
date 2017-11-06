<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:key name = "year-search" match = "row" use = "Year"/>

<xsl:variable name="landkoder">NOR,SWE,DNK,USA,GBR,CHE,JPN</xsl:variable>
<xsl:variable name="html">.html</xsl:variable>
<xsl:param name="currency-codes" select="document('merged.xml')/root/valutakurs"/>

<xsl:template match="/">
  <html>
  <body>
      <xsl:for-each select = "key('year-search', '2016')">
      <xsl:if test="contains($landkoder, CountryCode)">
          <li>
            <a alt="More information" target="_blank">
            <xsl:attribute name="href"><xsl:value-of select="CountryName" />.php</xsl:attribute>
            <xsl:value-of select="CountryName" />
            </a>
          </li>
           <!-- <xsl:variable name="foldername" select="xampp\htdocs\XML\steffen"/>
      <xsl:result-document href="{$foldername}/foo.txt" method="text">
         <xsl:apply-templates/>
      </xsl:result-document> -->
        </xsl:if>
      </xsl:for-each>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>