<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:ruleml="http://ruleml.org/spec">
  <!-- dc:rights [ 'Copyright 2015 RuleML Inc. - Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ] -->    
  <xsl:import href="1.02_deliberation_compactifier_module.xslt"/>

  <!-- Phase V: skip redundant edges -->
  
  <!-- Drop the xml:base attribute on a skippable element to the child node,
    if it doesn't have one already, when skipping -->
  <xsl:template match="ruleml:*[ruleml:isSkippableEdge(..)][not(.[@xml:base])]" mode="phase-compactify">
    <xsl:element name="{name()}">
      <xsl:copy-of select="../@xml:base"/>
      <xsl:apply-templates select="node()|@*" mode="phase-compactify"/>
    </xsl:element>
  </xsl:template>
  
  
</xsl:stylesheet>