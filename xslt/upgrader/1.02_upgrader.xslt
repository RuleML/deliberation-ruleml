<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="2.0">
  <xsl:template match="@iri|@node">
    <xsl:attribute name="{name()}">
      <xsl:value-of select="resolve-uri(., base-uri(.))"/>  
    </xsl:attribute>
  </xsl:template>
  <!-- Copies everything to the transformation output -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>      
    </xsl:copy>
  </xsl:template>
  
</xsl:stylesheet>