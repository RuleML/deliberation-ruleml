<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ruleml="http://ruleml.org/spec">
  <!-- dc:rights [ 'Copyright 2015 RuleML Inc. - Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ] -->
  <!-- dc:description [ 'Transformation to correct generated arbitrary values of @index.' ] -->
  <!-- Note- due to use of the preceding sibling axis, this algorithm has n-squared complexity in the number of @index attributes if they occur in large clusters.-->
  
  <xsl:template match="ruleml:*[@index]">
    <xsl:copy>
      <xsl:apply-templates select="@*[not(name(.)='index')]"/>
      <xsl:attribute name="index" 
        select="count(preceding-sibling::*[name()=name(.)])+1"/>
      <xsl:apply-templates select="node()"/>
    </xsl:copy>
  </xsl:template>
  <!-- Copies everything else to the transformation output -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  
</xsl:stylesheet>
