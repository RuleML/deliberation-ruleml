<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ruleml="http://ruleml.org/spec" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0">
  <!-- dc:rights [ 'Copyright 2015 RuleML Inc. - Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ] -->
  <!-- Resolves the values of @iri and @node attributes to IRI, interpreting the value as an IRI reference -->
  <xsl:template match="@iri|@node">
    <xsl:attribute name="{name(.)}">
      <xsl:value-of select="resolve-uri(., base-uri(.))"/>
    </xsl:attribute>
  </xsl:template>
  <!-- Converts the values of @type attributes to IRI, interpreting the original value a same-document ID -->
  <xsl:template match="@type">
    <xsl:attribute name="{name(.)}">
      <xsl:value-of select="resolve-uri(concat('#',.), base-uri(.))"/>
    </xsl:attribute>
  </xsl:template>

  <!-- Remove xml:base attributes  -->
  <xsl:template match="@xml:base"/>

  <!-- Exception: don't remove @xml:base on Data element with datatype ruleml:anyURI-->
  <xsl:template match="ruleml:Data[@xsi:type]/@xml:base" priority="1">
    <xsl:variable name="datatypestring">
      <xsl:value-of select="../@xsi:type"/>
    </xsl:variable>
    <xsl:variable name="datatype" select="resolve-QName($datatypestring, ..)" as="xs:QName"/>
    <xsl:if test="local-name-from-QName($datatype)='anyURI'">
      <xsl:if test="namespace-uri-from-QName($datatype)='http://ruleml.org/spec'">
        <xsl:choose>
          <xsl:when test="ancestor::*[@xml:base]">
            <xsl:attribute name="{name(.)}">
              <xsl:value-of select="resolve-uri(., base-uri(.))"/>
            </xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:copy-of select="."/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
    </xsl:if>
  </xsl:template>

  <!-- Updates the version in the xml-model processing instruction  -->
  <xsl:template match="/processing-instruction('xml-model')">
    <xsl:variable name="text">
      <xsl:value-of select="."/>
    </xsl:variable>
    <xsl:processing-instruction name="xml-model"><xsl:value-of select="replace($text, '1.01', '1.02' )"/></xsl:processing-instruction>
  </xsl:template>

  <!-- Updates the version in the xsi:schemaLocation attribute-->
  <xsl:template match="@xsi:schemaLocation">
    <xsl:attribute name="xsi:schemaLocation" select="replace(., '1.01', '1.02')"/>
  </xsl:template>



  <!-- Copies everything to the transformation output -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
