<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:ruleml="http://ruleml.org/spec"
   xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <!-- dc:rights [ 'Copyright 2015 RuleML Inc. - Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ] -->    
  <xsl:import href="deliberation_compactifier-ifthen_module.xslt"/>
  
  <!-- Functions -->
  <!-- test for skippable edges elements-->
  <xsl:function name="ruleml:isSkippableEdge" as="xs:boolean">
    <xsl:param name="node" as="node()"/>
    <xsl:value-of
      select="(
        namespace-uri($node)='http://ruleml.org/spec' and
        (
          local-name($node)='if' or
          local-name($node)='then' 
        )) or
      ruleml:isSkippableIfThenEdge($node)
      "
    />
  </xsl:function>
  
  <xsl:template match="ruleml:*[ruleml:isSkippableEdge(.)]"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>        
  </xsl:template>  
</xsl:stylesheet>
