<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://ruleml.org/spec" xmlns:r="http://ruleml.org/spec" exclude-result-prefixes="#all">
  <xsl:import href="../normalizer/1.02_normalizer.xslt"/>
  
  <!-- Phase IV: sort by required attributes -->
  
  <xsl:variable name="phase-sort-output">
    <xsl:apply-templates select="$phase-3-output" mode="phase-sort"/>
  </xsl:variable>
  
  <!-- Sorts by the required index attribute to the arg tag 
        There are errors with the indexing when the argument is within a slot-->
  
  <xsl:template match="*[r:arg]" mode="phase-sort">
    <xsl:copy>
      <xsl:apply-templates select="@*"  mode="phase-sort"/>
      <xsl:apply-templates select="node()[not(self::r:arg or self::r:repo or self::r:slot or self::r:resl)]"  mode="phase-sort"/>
      <xsl:apply-templates select="r:arg"  mode="phase-sort">
        <xsl:sort select="@index"  data-type="number"/>                
      </xsl:apply-templates>
      <xsl:apply-templates select="r:repo" mode="phase-sort"/>
      <xsl:apply-templates select="r:slot" mode="phase-sort"/>
      <xsl:apply-templates select="r:resl" mode="phase-sort"/>
    </xsl:copy>  
  </xsl:template>
  
  
  <!-- Sorts by the required index attribute to the act tag -->
  <xsl:template match="*[r:act]" mode="phase-sort">
    <xsl:copy>
      <xsl:apply-templates select="@*"  mode="phase-sort"/>
      <xsl:apply-templates select="node()[not(self::r:act)]"  mode="phase-sort"/>
      <xsl:apply-templates select="r:act"  mode="phase-sort">
        <xsl:sort select="@index"  data-type="number"/>                
      </xsl:apply-templates>
    </xsl:copy>  
  </xsl:template>
  <!-- Sorts by the required index attribute to the formula tag in And and Or -->
  <xsl:template match="*[self::r:And or self::r:Or]" mode="phase-sort">
    <xsl:copy>
      <xsl:apply-templates select="@*"  mode="phase-sort"/>
      <xsl:apply-templates select="node()[not(self::r:formula)]"  mode="phase-sort"/>
      <xsl:apply-templates select="r:formula"  mode="phase-sort">
        <xsl:sort select="@index"  data-type="number"/>                
      </xsl:apply-templates>
    </xsl:copy>  
  </xsl:template>
  <!-- Copies everything else to the phase-sort output. Comments are preserved without escaping.
        Order is preserved.
        Foreign elements are preserved.
        Because this is the most general of all templates, any more specific template in phase-sort will over-ride this one.  -->
  <xsl:template match="node() | @*" mode="phase-sort">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*" mode="phase-sort"/>
    </xsl:copy>
  </xsl:template>
    
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
  <xsl:template match="r:if"  mode="phase-compactify">
    <xsl:apply-templates select="node()" mode="phase-compactify"/>
  </xsl:template>  
  <xsl:template match="r:then"  mode="phase-compactify">
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
