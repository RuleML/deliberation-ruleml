<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ruleml="http://ruleml.org/spec">
  <!-- dc:rights [ 'Copyright 2015 RuleML Inc. - Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimeruleml: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ] -->    
  
    
  <!-- Phase V: skip redundant edges -->
  
  <xsl:variable name="phase-compactify-output">
    <xsl:apply-templates select="$phase-sort-output" mode="phase-compactify"/>
  </xsl:variable>
  
  <!-- Copies everything else to the phase-sort output. Comments are preserved without escaping.
        Order is preserved.
        Foreign elements are preserved.
        Because this is the most general of all templates, any more specific template in phase-sort will over-ride this one.  -->
  <xsl:template match="node() | @*" mode="phase-compactify">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*" mode="phase-compactify"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="ruleml:arg"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
  <xsl:template match="ruleml:op"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
  <xsl:template match="ruleml:Entails/ruleml:if"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
  <xsl:template match="ruleml:Entails/ruleml:then"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
  <xsl:template match="ruleml:torso"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
  <xsl:template match="ruleml:left"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
  <xsl:template match="ruleml:right"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
  <xsl:template match="ruleml:formula"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
  <xsl:template match="ruleml:declare"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
  <xsl:template match="ruleml:weak"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
  <xsl:template match="ruleml:strong"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
  <xsl:template match="ruleml:act"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>    
  </xsl:template>  

  <!-- Pretty Print -->
  <!--Makes sure everything is printed nicely-->
  <xsl:variable name="pretty-print-output">
    <xsl:apply-templates select="$phase-compactify-output" mode="pretty-print">
      <xsl:with-param name="tabs">
        <xsl:text/>
      </xsl:with-param>
    </xsl:apply-templates>
  </xsl:variable>


</xsl:stylesheet>
