<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ruleml="http://ruleml.org/spec">
  <!-- dc:rights [ 'Copyright 2015 RuleML Inc. - Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimeruleml: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ] -->    
  <!-- Remove almost all white space between elements -->
  <xsl:preserve-space elements="RuleML"/>
  <xsl:strip-space elements="*"/>

  <!-- Add the  <?xml version="1.0" ?> at the top of the result.-->
  <xsl:output method="xml" version="1.0" indent="no"/>

 
  <!-- Pretty Print -->

  <!-- variable containing the amount of space for a tab -->
  <xsl:variable name="tab">
    <xsl:text>  </xsl:text>
  </xsl:variable>

  <!-- variable containing a new line -->
  <xsl:variable name="newline">
    <xsl:text>
</xsl:text>
  </xsl:variable>

  <!-- adds a new line and an appropriate amount of tabs before each comment -->
  <xsl:template match="*/comment()" mode="pretty-print">
    <xsl:param name="tabs"/>
    <xsl:value-of select="$newline"/>
    <xsl:value-of select="$tabs"/>
    <xsl:comment><xsl:value-of select="."/></xsl:comment>
  </xsl:template>

  <!-- decides whether the children of the current node should be on a new
        line or not and calls the appropriate template-->
  <xsl:template match="*" mode="pretty-print">
    <xsl:param name="tabs"/>
    <xsl:choose>

      <xsl:when test="local-name(.)='op' or local-name(.)='arg' or local-name(.)='slot'">
        <xsl:call-template name="no-new-line">
          <xsl:with-param name="newlines">yes</xsl:with-param>
          <xsl:with-param name="tabs">
            <xsl:value-of select="$tabs"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:when>

      <xsl:otherwise>
        <xsl:call-template name="new-line">
          <xsl:with-param name="tabs">
            <xsl:value-of select="$tabs"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>

    </xsl:choose>
  </xsl:template>

  <!-- Copies everything else to the pretty-print output -->
  <xsl:template match="@*|text()|processing-instruction()"  mode="pretty-print">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" mode="pretty-print"/>
    </xsl:copy>
  </xsl:template>
  
  
  <!-- formats a node that should have new lines before it's children -->
  <xsl:template name="new-line">
    <xsl:param name="tabs"/>
    <xsl:value-of select="$newline"/>
    <xsl:value-of select="$tabs"/>
    <xsl:copy>
      <xsl:for-each select="@*">
        <xsl:call-template name="attribute-out"/>
      </xsl:for-each>
      <xsl:choose>
        <xsl:when test="count(./*) = 0">
          <xsl:value-of select="."/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="./node()" mode="pretty-print">
            <xsl:with-param name="tabs">
              <xsl:value-of select="$tabs"/>
              <xsl:value-of select="$tab"/>
            </xsl:with-param>
          </xsl:apply-templates>
          <xsl:value-of select="$newline"/>
          <xsl:value-of select="$tabs"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:copy>
  </xsl:template>

  <!-- formats a node with no new lines before it's children -->
  <xsl:template name="no-new-line">
    <xsl:param name="newlines"/>
    <xsl:param name="tabs"/>
    <xsl:if test="$newlines='yes'">
      <xsl:value-of select="$newline"/>
      <xsl:value-of select="$tabs"/>
    </xsl:if>
    <xsl:copy>
      <xsl:for-each select="@*">
        <xsl:call-template name="attribute-out"/>
      </xsl:for-each>
      <xsl:choose>
        <xsl:when test="count(./*)=0">
          <xsl:value-of select="."/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:for-each select="./node()">
            <xsl:call-template name="no-new-line">
              <xsl:with-param name="newlines">no</xsl:with-param>
            </xsl:call-template>
          </xsl:for-each>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:copy>
  </xsl:template>

  <!-- outputs an attribute -->
  <xsl:template name="attribute-out">
    <xsl:copy-of select="."/>
  </xsl:template>

  <!-- Copies everything to the transformation output -->
  <xsl:template match="/">
    <xsl:copy-of select="$pretty-print-output"/>
  </xsl:template>

</xsl:stylesheet>
