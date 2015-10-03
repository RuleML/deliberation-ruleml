<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ruleml="http://ruleml.org/spec"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <!-- dc:rights [ 'Copyright 2015 RuleML Inc. - Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimeruleml: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ] -->    
 
  <!-- Functions -->
  <!-- test for skippable edges elements-->
  <xsl:function name="ruleml:isSkippableEntailsEdge" as="xs:boolean">
    <xsl:param name="node" as="node()"/>
    <xsl:value-of
      select="
      namespace-uri($node)='http://ruleml.org/spec' and
      namespace-uri($node/..)='http://ruleml.org/spec' and
      local-name($node/..)='Entails' and
      ( local-name($node)='if' or
      local-name($node)='then' )
      "
    />
  </xsl:function>
  <xsl:function name="ruleml:isSkippableIfThenEdge" as="xs:boolean">
    <xsl:param name="node" as="node()"/>
    <xsl:value-of
      select="(namespace-uri($node)='http://ruleml.org/spec' and
      (local-name($node)='arg' or
      local-name($node)='op' or
      local-name($node)='if[..[ruleml:Entails]]' or
      local-name($node)='then[..[ruleml:Entails]]' or
      local-name($node)='torso' or
      local-name($node)='left' or
      local-name($node)='right' or
      local-name($node)='formula' or
      local-name($node)='declare' or
      local-name($node)='strong' or
      local-name($node)='weak' or
      local-name($node)='act')) or
      ruleml:isSkippableEntailsEdge($node)
      "
    />
  </xsl:function>
  
  
    
  <!-- Phase V: skip redundant edges except for if and then in Implies -->
  
  <xsl:variable name="phase-compactify-output">
    <xsl:apply-templates select="$phase-sort-output" mode="phase-compactify"/>
  </xsl:variable>
  
  <xsl:template match="ruleml:*[ruleml:isSkippableIfThenEdge(.)]"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>        
  </xsl:template>  
  
  <!-- Copies everything else to the phase-compactify output.  -->
  <xsl:template match="node() | @*" mode="phase-compactify">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*" mode="phase-compactify"/>
    </xsl:copy>
  </xsl:template>
  
</xsl:stylesheet>
