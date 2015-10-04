<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ruleml="http://ruleml.org/spec">
  <!-- dc:rights [ 'Copyright 2015 RuleML Inc. - Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ] -->
  <!-- dc:description [ 'Transformation to correct incomplete termination in instance generation by post-processing. 
       Target schema is compact serialization. ' ] -->
  <xsl:include href="1.02_instance-postprocessor-compact _module.xslt"/>

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
  
</xsl:stylesheet>
