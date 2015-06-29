<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="2.0">
  <!-- dc:rights [ 'Copyright 2015 RuleML Inc. - Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ] -->    
  <xsl:template match="@iri|@node">
    <xsl:attribute name="{name()}">
      <xsl:value-of select="resolve-uri(., base-uri(.))"/>  
    </xsl:attribute>
  </xsl:template>
  <xsl:template match="@type">
    <xsl:attribute name="{name()}">
      <xsl:value-of select="resolve-uri(concat('#',.), base-uri(.))"/>  
    </xsl:attribute>
  </xsl:template>
  <!-- Copies everything to the transformation output -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>      
    </xsl:copy>
  </xsl:template>
  
</xsl:stylesheet>