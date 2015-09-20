<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://ruleml.org/spec" xmlns:r="http://ruleml.org/spec" exclude-result-prefixes="#all">
  <!-- dc:rights [ 'Copyright 2015 RuleML Inc. - Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ] -->    
  <!-- Remove almost all white space between elements -->
  <xsl:import href="1.02_normalizer.xslt"/>


  <!-- Phase III: add required attributes -->


  <!-- Adds the required index attribute to the formula tag in And and Or -->
  <xsl:template match="*[self::r:And or self::r:Or]/r:formula[not(@index)]" mode="phase-3">
    <xsl:variable name="index_value">
      <xsl:value-of select="count(preceding-sibling::r:formula)+1"/>
    </xsl:variable>
    <formula>
      <xsl:attribute name="index">
        <xsl:value-of select="$index_value"/>
      </xsl:attribute>
      <xsl:apply-templates select="@*|node()" mode="phase-3"/>
    </formula>
  </xsl:template>
</xsl:stylesheet>