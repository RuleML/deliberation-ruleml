<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
  <!-- dc:rights [ 'Copyright 2015 RuleML Inc. - Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ] -->    
  
  <!-- Remove almost all white space between elements -->
  <xsl:preserve-space elements="xs:schema"/>
  <!--<xsl:strip-space elements="*"/>-->

  <!-- Add the  <?xml version="1.0" ?> at the top of the result.-->
  <xsl:output method="xml" version="1.0" indent="no" exclude-result-prefixes="xs"/>

  <xsl:template match="xs:schema[@targetNamespace='http://ruleml.org/spec']">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:comment>  dc:rights [ 'Copyright 2015 RuleML Inc. - Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]    
</xsl:comment>
      <xsl:apply-templates select="text()|processing-instruction()|*[ name()!='xs:import']"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- Fix elements with wild-card content. -->
  <xsl:template match="xs:element[@name='Data']">
    <xs:element name="Data" type="xs:anyType"/>
  </xsl:template>

  <!-- Fix elements with required index attribute. -->
  <xsl:template match="*[not (@name='formula_And-datt.choice') and not (@name='formula_Or-datt.choice')]/xs:attributeGroup[@ref='ruleml:index-attrib.choice']">
    <xs:attributeGroup ref="ruleml:index.attrib.def"/>
  </xsl:template>
  
  <!-- Remove groups like 
  <xs:group name="_1">-->
  <xsl:template match="xs:group[@name='_1']"/> 
  <xsl:template match="xs:group[@name='_2']"/> 
  
  <!-- Remove unused groups and elements -->
  <xsl:template match="xs:group[@name='Node.choice']"/>
  <xsl:template match="xs:group[@name='edge.choice']"/>
  <xsl:template match="xs:group[matches(@name,'^Dummy')]"/>
  <xsl:template match="xs:element[matches(@name,'^Dummy')]"/>
 
   
  <!-- Copies everything to the transformation output -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
