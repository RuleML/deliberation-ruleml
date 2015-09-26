<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:ruleml="http://ruleml.org/spec">
  <!-- dc:rights [ 'Copyright 2015 RuleML Inc. - Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ] -->    
  <xsl:import href="1.02_deliberation_compactifier-ifthen_module.xslt"/>

  <xsl:template match="ruleml:*[
    name(..)='ruleml:arg' or
    name(..)='ruleml:op' or
    name(..)='ruleml:if' or
    name(..)='ruleml:then' or
    name(..)='ruleml:torso' or
    name(..)='ruleml:left' or
    name(..)='ruleml:right' or
    name(..)='ruleml:formula' or
    name(..)='ruleml:declare' or
    name(..)='ruleml:strong' or
    name(..)='ruleml:weak' or
    name(..)='ruleml:act' or
    name(..)='ruleml:arg'
    ][not(.[@xml:base])]" mode="phase-compactify">
    <xsl:element name="{name()}">
      <xsl:copy-of select="../@xml:base"/>
      <xsl:apply-templates select="node()|@*" mode="copy"/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="ruleml:if"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
  <xsl:template match="ruleml:then"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
</xsl:stylesheet>
