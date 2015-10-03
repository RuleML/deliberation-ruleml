<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ruleml="http://ruleml.org/spec">
  <!-- dc:rights [ 'Copyright 2015 RuleML Inc. - Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ] -->
  <!-- dc:description [ 'Transformation to correct incomplete termination in instance generation by post-processing. 
       Target schema is compact serialization. ' ] -->
  <!-- Remove almost all white space between elements -->
  <xsl:preserve-space elements="ruleml:*"/>
  <!--<xsl:strip-space elements="*"/>-->

  <!-- Add the  <?xml version="1.0" ?> at the top of the result.-->
  <xsl:output method="xml" version="1.0" indent="yes"/>

  <xsl:template match="ruleml:meta[not(*)]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:element name="ruleml:Atom">
        <xsl:element name="ruleml:Rel"/>
      </xsl:element>
    </xsl:copy>
  </xsl:template>  
  <xsl:template match="ruleml:repo[not(*)]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:element name="ruleml:Var"/>
    </xsl:copy>
  </xsl:template>  
  <xsl:template match="ruleml:resl[not(*)]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:element name="ruleml:Var"/>
    </xsl:copy>
  </xsl:template>  
    <xsl:template match="ruleml:oid[not(*)]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:element name="ruleml:Ind"/>
    </xsl:copy>
  </xsl:template>  
  <xsl:template match="ruleml:slot[count(*) &lt; 2]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:element name="ruleml:Ind"/>
      <xsl:element name="ruleml:Ind"/>
    </xsl:copy>
  </xsl:template>  
  <xsl:template match="ruleml:Atom[count(Rel)=0]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:element name="ruleml:Rel"/>
    </xsl:copy>
  </xsl:template>  
  <xsl:template match="ruleml:Expr[count(Fun)=0]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:element name="ruleml:Fun"/>
    </xsl:copy>
  </xsl:template>  
  <xsl:template match="ruleml:Equal[count(ruleml:*[matches(local-name(), '^[A-Z]')]) &lt; 2]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:element name="ruleml:Ind"/>
      <xsl:element name="ruleml:Ind"/>
    </xsl:copy>
  </xsl:template>  
  <xsl:template match="ruleml:Naf[count(ruleml:*[matches(local-name(), '^[A-Z]')]) = 0]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:element name="ruleml:Atom">
        <xsl:element name="ruleml:Rel"/>
      </xsl:element>
    </xsl:copy>
  </xsl:template>  
  <xsl:template match="ruleml:Neg[count(ruleml:*[matches(local-name(), '^[A-Z]')]) = 0]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:element name="ruleml:Atom">
        <xsl:element name="ruleml:Rel"/>
      </xsl:element>
    </xsl:copy>
  </xsl:template>  
  <xsl:template match="ruleml:Entails[count(ruleml:*[matches(local-name(), '^[A-Z]')]) &lt; 2]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:element name="ruleml:Rulebase"/>
      <xsl:element name="ruleml:Rulebase"/>
    </xsl:copy>
  </xsl:template>  
  <xsl:template match="ruleml:Exists[count(ruleml:*[matches(local-name(), '^[A-Z]')]) &lt; 2]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:element name="ruleml:Var"/>
      <xsl:element name="ruleml:Atom">
        <xsl:element name="ruleml:Rel"/>
      </xsl:element>
    </xsl:copy>
  </xsl:template>  
  <xsl:template match="ruleml:Forall[count(ruleml:*[matches(local-name(), '^[A-Z]')]) &lt; 2]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:element name="ruleml:Var"/>
      <xsl:element name="ruleml:Atom">
        <xsl:element name="ruleml:Rel"/>
      </xsl:element>
    </xsl:copy>
  </xsl:template>  
  <xsl:template match="ruleml:Equivalent[count(ruleml:*[matches(local-name(), '^[A-Z]')]) &lt; 2]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:element name="ruleml:Atom">
        <xsl:element name="ruleml:Rel"/>
      </xsl:element>
      <xsl:element name="ruleml:Atom">
        <xsl:element name="ruleml:Rel"/>
      </xsl:element>
    </xsl:copy>
  </xsl:template>  
  <xsl:template match="ruleml:Implies[count(ruleml:*[matches(local-name(), '^[A-Z]')]) &lt; 2]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:element name="ruleml:Atom">
        <xsl:element name="ruleml:Rel"/>
      </xsl:element>
      <xsl:element name="ruleml:Atom">
        <xsl:element name="ruleml:Rel"/>
      </xsl:element>
    </xsl:copy>
  </xsl:template>  
  
  <!-- Copies everything to the transformation output -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
