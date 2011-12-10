<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://ruleml.org/spec"
xmlns:ruleml="http://www.ruleml.org/0.91/xsd"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
exclude-result-prefixes="ruleml">
	
	<!--
	XSLT stylesheet for converting rulebases from RuleML 0.91 to 1.00

	See http://www.ruleml.org/1.00/#Changes for more information.

	File: 091_to_100.xslt
	Version: 1.0
	Last Modification: 2010-11-01

	Changes from RuleML 0.91 to 1.00 relfected in this document:
	* Role tags <head> and <body>, replaced with <then> and <if>, respectively	
    * Role tags <lhs> and <rhs>, replaced with <left> and <right>, respectively
	* Type tags <Hterm> and <Con>, replaced with <Uniterm> and <Const> respectively
    * Attribute uri replaced with iri	
    * Attribute in="no|semi|yes|effect|modal" with respective values, replaced with per="copy|open|value|effect|modal"
    
	Other changes (not reflected here):
    
    * Schematron dependency has now been reduced (as comments in the code)
    
	-->
	
	<xsl:output method="xml" version="1.0"/>
	
	<xsl:template match="/">				
		<xsl:text>&#xa;</xsl:text><!--newline-->
		<xsl:text>&#xa;</xsl:text><!--newline-->
		<xsl:apply-templates />
	</xsl:template>
		
	<!-- change references to 0.91 xds to 1.0 xsd in the root node attributes -->
	<!--<xsl:template match="ruleml:RuleML">-->
  <xsl:template match="/*"> <!--matches any root element instead of only RuleML - it was changed to that to make it match subtrees-->		
		<xsl:element name="{name(.)}">			
			<xsl:attribute name="xsi:schemaLocation">
				<xsl:variable name="url">http://www.ruleml.org/1.0/xsd</xsl:variable>
				<!-- store just the name of the schema -->
				<xsl:variable name="file" 
						select="substring-after(@xsi:schemaLocation, 'http://www.ruleml.org/0.91/xsd/')" />
				<xsl:value-of select="concat($url, ' ', $url, '/', $file)" />		
			</xsl:attribute>						
			<xsl:apply-templates/>			
		</xsl:element>	    
	</xsl:template>
	
	<!-- change head to then -->
	<xsl:template match="ruleml:head">	
		<xsl:element name="then" >			
			<xsl:apply-templates select="node()|@*"/>			
		</xsl:element>		
	</xsl:template>
	
	<!-- change body to if -->
	<xsl:template match="ruleml:body">	
		<xsl:element name="if" >			
			<xsl:apply-templates select="node()|@*"/>			
		</xsl:element>		
	</xsl:template>
	
	<!-- change lhs to left -->
	<xsl:template match="ruleml:lhs">	
		<xsl:element name="left" >			
			<xsl:apply-templates select="node()|@*"/>			
		</xsl:element>
	</xsl:template>	
	
	<!-- change rhs to right -->
	<xsl:template match="ruleml:rhs">	
		<xsl:element name="right" >			
			<xsl:apply-templates select="node()|@*"/>			
		</xsl:element>		
	</xsl:template>
	
	<!-- change Hterm to Uniterm -->
	<xsl:template match="ruleml:Hterm">	
		<xsl:element name="Uniterm" >			
			<xsl:apply-templates select="node()|@*"/>			
		</xsl:element>		
	</xsl:template>
	
	<!-- change Con to Const -->
	<xsl:template match="ruleml:Con">	
		<xsl:element name="Const" >			
			<xsl:apply-templates select="node()|@*"/>			
		</xsl:element>		
	</xsl:template>
	
   <!-- rename @uri to @iri -->
	<xsl:template match="@uri">
		<xsl:attribute name="iri">
			<xsl:value-of select="."/>
		</xsl:attribute>		
	</xsl:template>
	
	<!-- change @in="no|semi|yes|effect|modal" to @per="copy|open|value|effect|modal", respectively-->
	<xsl:template match="@in">
		<xsl:attribute name="per">
			<xsl:choose>
				 <xsl:when test=".='no'">copy</xsl:when>
				  <xsl:when test=".='semi'">open</xsl:when>
				  <xsl:when test=".='yes'">value</xsl:when>
<!--			  these two lines do nothing:
                  <xsl:when test=".='effect'">effect</xsl:when>
				  <xsl:when test=".='modal'">modal</xsl:when>			-->
 			      <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>     			     			     
     		</xsl:choose>			
		</xsl:attribute>
	</xsl:template>
	
	<!-- copy all attributes, except as above -->
	<xsl:template match="@*">
		<xsl:copy-of select="."/>
	</xsl:template>	
	
	<!-- copy everything except the old namespace -->
	<xsl:template match="*">
		<xsl:element name="{name()}" >			
			<xsl:apply-templates select="node()|@*"/>
		</xsl:element>				
	</xsl:template>	

  <!-- preserve comments -->
	<xsl:template match="comment()">
		<xsl:text>&#xa;</xsl:text><!--newline-->
		<!-- prevent commented-out code from being escaped -->
		<xsl:text disable-output-escaping="yes">&lt;!--</xsl:text>
		<xsl:value-of disable-output-escaping="yes" select="."/>
		<xsl:text disable-output-escaping="yes">--></xsl:text>		
		<xsl:text>&#xa;</xsl:text><!--newline-->
	</xsl:template>
  	
</xsl:stylesheet>
