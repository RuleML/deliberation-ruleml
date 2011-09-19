<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.ruleml.org/1.0/xsd"
  xmlns:ruleml091="http://www.ruleml.org/0.91/xsd"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  exclude-result-prefixes="ruleml091">

  <!--
	XSLT stylesheet for converting rulebases from RuleML 0.91 to 1.0

	See http://www.ruleml.org/1.0/#Changes for more information.

	File: 091_to_100.xslt
	Version: 1.0
	Author: Tara Athan
	Last Modification: 2011-09-18

	Changes from RuleML 0.91 to 1.0 reflected in this document:

	A. The namespace is changed from "http://www.ruleml.org/0.91/xsd" to "http://www.ruleml.org/1.0/xsd".
	 	
	B. The schema location is changed from "http://www.ruleml.org/0.91/xsd" to "http://www.ruleml.org/1.0/xsd".



	1. The name of the interpretation attribute was changed from @in to @per.
	 	
	   - <... in="no">
        
     was changed to
      
       <... per="copy">
        
	   - <... in="yes">
        
     was changed to
      
       <... per="value">
 
    - <... in="semi">
        
     was changed to
      
       <... per="open">

  2. The name of the edge elements (role tags) in Equal are changed from <lhs> -> <left>, <rhs> -> <right> 
    
     	   - <lhs>
        
     was changed to
      
       <left>
     
     	   - <rhs>
        
     was changed to
      
       <right>
            
  3. The name of the edge elements (role tags) in Implies are changed from <body> -> <if>, <head> -> <then> 
    
     	   - <body>
        
     was changed to
      
       <if>
     
     	   - <head>
        
     was changed to
      
       <then>
            
	4. The name of the "webizing" attribute was changed from @uri to @iri.
	 	
	   - <... uri="...">
        
     was changed to
      
       <... iri="...">


 	-->

  <xsl:output method="xml" version="1.0" />
  <xsl:namespace-alias stylesheet-prefix="ruleml091" result-prefix="#default"/>
  <xsl:template match="/" priority="3">
    <xsl:text>&#xa;</xsl:text>
    <!--newline-->
    <xsl:text>&#xa;</xsl:text>
    <!--newline-->
    <xsl:apply-templates/>
  </xsl:template>

  <!-- A/B. change references to 0.91 xsd to 1.0 xsd in the root node attributes -->
  
  <xsl:template match="@xsi:schemaLocation[starts-with(.,'http://www.ruleml.org/0.91/xsd')]" priority="3"> 
      <xsl:attribute name="xsi:schemaLocation">
        <xsl:variable name="ns"
          >http://www.ruleml.org/1.0/xsd</xsl:variable>
        <xsl:variable name="url"
          >http://www.ruleml.org/1.0/xsd</xsl:variable>
        <!-- store just the name of the schema -->
        <xsl:variable name="file"
          select="substring-after(., 'http://www.ruleml.org/0.91/xsd/')"/>
        <xsl:value-of select="concat($ns, ' ', $url, '/', $file)"
        />
      </xsl:attribute>
    
  </xsl:template>

  <!-- Ad. 1a. change < in="no">.. to < per="copy">.. -->
  <xsl:template match="@in[.='no']" priority="3">
    <xsl:attribute name="per">copy</xsl:attribute>
  </xsl:template>

  <!-- Ad. 1b. change < in="yes">.. to < per="value">.. -->
  <xsl:template match="@in[.='yes']" priority="3">
    <xsl:attribute name="per">value</xsl:attribute>
  </xsl:template>

  <!-- Ad. 1c. change < in="semi">.. to < per="open">.. -->
  <xsl:template match="@in[.='semi']" priority="3">
    <xsl:attribute name="per">open</xsl:attribute>
  </xsl:template>

  <!-- Ad. 2a. change <lhs>.. to <left>.. -->
  <xsl:template match="ruleml091:lhs" priority="3">
    <xsl:element name="left">
      <xsl:apply-templates select="node()|@*"/>
    </xsl:element>
  </xsl:template>

  <!-- Ad. 2b. change <rhs>.. to <right>.. -->
  <xsl:template match="ruleml091:rhs" priority="3">
    <xsl:element name="right">
      <xsl:apply-templates select="node()|@*"/>
    </xsl:element>
  </xsl:template>

  <!-- Ad. 3a. change <body>.. to <if>.. -->
  <xsl:template match="ruleml091:body" priority="3">
    <xsl:element name="if">
      <xsl:apply-templates select="node()|@*"/>
    </xsl:element>
  </xsl:template>

  <!-- Ad. 3b. change <head>.. to <then>.. -->
  <xsl:template match="ruleml091:head" priority="3">
    <xsl:element name="then">
      <xsl:apply-templates select="node()|@*"/>
    </xsl:element>
  </xsl:template>

  <!-- Ad. 4. change < uri="...">.. to < iri="...">.. -->
  <xsl:template match="@uri" priority="3">
    <xsl:attribute name="iri">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <!-- copy any element whose namespace matches the old namespace to the new namespace -->
  <xsl:template match="*[namespace-uri()='http://www.ruleml.org/0.91/xsd']" priority="2">
    <xsl:element name="{local-name()}">
      <xsl:copy-of select="namespace::xs"/>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:element>
  </xsl:template>


  <!-- preserve comments -->
  <xsl:template match="comment()" priority="2">
    <xsl:text>&#xa;</xsl:text>
    <!--newline-->
    <!-- prevent commented-out code from being escaped -->
    <xsl:text disable-output-escaping="yes">&lt;!--</xsl:text>
    <xsl:value-of disable-output-escaping="yes" select="."/>
    <xsl:text disable-output-escaping="yes">--></xsl:text>
    <xsl:text>&#xa;</xsl:text>
    <!--newline-->
  </xsl:template>

  <!-- copy any element or attribute not matched above -->
  <xsl:template match="node()|@*" priority="1">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
