<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">

  <!-- Remove almost all white space between elements -->
  <xsl:preserve-space elements="xs:schema"/>
  <!--<xsl:strip-space elements="*"/>-->

  <!-- Add the  <?xml version="1.0" ?> at the top of the result.-->
  <xsl:output method="xml" version="1.0" indent="no" exclude-result-prefixes="xs"/>

  <xsl:template match="xs:schema[@targetNamespace='http://ruleml.org/spec']">
        <xsl:copy>
          <xsl:apply-templates select="@*"/>
          <xs:import namespace="http://www.w3.org/XML/1998/namespace" schemaLocation="http://deliberation.ruleml.org/1.02/xsd/xml.xsd"/>
          <xs:include schemaLocation="http://deliberation.ruleml.org/1.02/datatypes/SimpleWithAttributes.xsd"/>
          <xsl:apply-templates select="text()|processing-instruction()|*[ name()!='xs:import']"/>
        </xsl:copy>
  </xsl:template>
  
  <!-- Fix elements with wild-card content. -->
  <xsl:template match="xs:element[@name='Data']">
    <xs:element name="Data" type="xs:anyType"/>
  </xsl:template>

  <xsl:template match="xs:element[@name='Reify']">
    <xs:element name="Reify">
      <xs:complexType>
        <xs:sequence>
          <xs:any minOccurs="0" processContents="strict" namespace="##targetNamespace"/>
        </xs:sequence>
        <xs:attribute name="node" type="xs:anyURI"/>
        <xs:attribute ref="xml:base"/>
        <xs:attribute ref="xml:id"/>
      </xs:complexType>
    </xs:element>
  </xsl:template>

  <!-- Remove groups like 
  <xs:group name="_1">-->
  <xsl:template match="xs:group[@name='_1']"> </xsl:template>
  <xsl:template match="xs:group[@name='_2']"> </xsl:template>

  <xsl:template match="xs:attribute[@name='id']">
    <xs:attribute name="id" type="xs:ID"/>
  </xsl:template>

  <!-- Remove importations of schemas in the ruleml namespace -->
  <!--<xsl:template match="xs:import[@namespace='http://ruleml.org/spec']"/>-->

  <!-- Remove existing includes -->
  <xsl:template match="xs:include"/>
  
  <!-- Add default values to optional attributes-->
  <xsl:template match="xs:attribute[(@name='mapMaterial' or @name='material') and not(@use)]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="default">yes</xsl:attribute>
      <xsl:apply-templates select="node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="xs:attribute[(@name='mapDirection' or @name='direction') and not(@use)]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="default">bidirectional</xsl:attribute>
      <xsl:apply-templates select="node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="xs:attribute[@name='per' and not(@use)]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="default">copy</xsl:attribute>
      <xsl:apply-templates select="node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="xs:attribute[@name='val' and not(@use)]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="default">0..</xsl:attribute>
      <xsl:apply-templates select="node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="xs:attribute[@name='oriented' and not(@use)]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="default">no</xsl:attribute>
      <xsl:apply-templates select="node()"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- Copies everything to the transformation output -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
