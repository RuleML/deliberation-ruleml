<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://ruleml.org/spec" xmlns:r="http://ruleml.org/spec" exclude-result-prefixes="#all">
  <!-- dc:rights [ 'Copyright 2015 RuleML Inc. - Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ] -->    
  <xsl:import href="../normalizer/1.02_normalizer.xslt"/>
  
    
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
  
  <xsl:template match="r:arg"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
  <xsl:template match="r:op"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
  <xsl:template match="r:Entails/r:if"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
  <xsl:template match="r:Entails/r:then"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
  <xsl:template match="r:torso"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
  <xsl:template match="r:left"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
  <xsl:template match="r:right"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
  <xsl:template match="r:formula"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
  <xsl:template match="r:declare"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
  <xsl:template match="r:weak"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
  <xsl:template match="r:strong"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
  <xsl:template match="r:act"  mode="phase-compactify">
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
