<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:key name = "year-search" match = "row" use = "Year"/>

<xsl:variable name="landkoder">THA</xsl:variable>

<xsl:param name="currency-codes" select="document('merged.xml')/root/valutakurs"/>
<xsl:param name="praktisk-info" select="document('merged.xml')/root/rad"/>

<xsl:template match="/">
  <html>
  <body>
      <xsl:for-each select = "key('year-search', '2016')">
        <xsl:if test="contains($landkoder, CountryCode)">
          <h4 class="infotekst"> Land : </h4><p class="infotekst"><xsl:value-of select="CountryName"/></p>
          <h4 class="infotekst"> Land kode : </h4><p class="infotekst"><xsl:value-of select="CountryCode"/></p>
          <h4 class="infotekst"> År : </h4><p class="infotekst"><xsl:value-of select="Year"/></p>
          <h4 class="infotekst"> Populasjon </h4><p class="infotekst"><xsl:value-of select="Value"/></p>
          <h4 class="infotekst">Currency</h4><p class="infotekst"><xsl:value-of select="$currency-codes[land = current()/CountryName]/kode"/></p>
          <h4 class="infotekst">Rate</h4><p class="infotekst"><xsl:value-of select="$currency-codes[land = current()/CountryName]/overforsel/midtkurs"/></p>
          <h4 class="infotekst">Språk</h4> <p class="infotekst"><xsl:value-of select="$praktisk-info[Country = current()/CountryName]/Language"/></p>
          <h4 class="infotekst">Styreform</h4><p class="infotekst"><xsl:value-of select="$praktisk-info[Country = current()/CountryName]/Goverment"/></p>
          <h4 class="infotekst">Nasjonalrett</h4><p class="infotekst"><xsl:value-of select="$praktisk-info[Country = current()/CountryName]/Dish"/></p>
          <h4 class="infotekst">Nasjonaldag</h4><p class="infotekst"><xsl:value-of select="$praktisk-info[Country = current()/CountryName]/Day"/></p>
          <h4 class="infotekst">Nasjonalsang</h4><p class="infotekst"><xsl:value-of select="$praktisk-info[Country = current()/CountryName]/Song"/></p>
          <h4 class="infotekst">Hovedstad</h4><p class="infotekst"><xsl:value-of select="$praktisk-info[Country = current()/CountryName]/Capital"/></p>
          <h4 class="infotekst">Kjent for</h4><p class="infotekst"><xsl:value-of select="$praktisk-info[Country = current()/CountryName]/Top3"/></p>
          <h4 class="infotekst"> Visste du at :</h4><p class="infotekst"><xsl:value-of select="$praktisk-info[Country = current()/CountryName]/FunFact"/></p>
        </xsl:if>
      </xsl:for-each>
   </body>
  </html>
</xsl:template>

</xsl:stylesheet>