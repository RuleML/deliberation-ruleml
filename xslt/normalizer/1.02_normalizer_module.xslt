<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ruleml="http://ruleml.org/spec"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <!-- dc:rights [ 'Copyright 2015 RuleML Inc. - Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimeruleml: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ] -->
  <!-- Functions -->
  <!-- test for Node elements-->
  <xsl:function name="ruleml:isNode" as="xs:boolean">
    <xsl:param name="node" as="node()"/>
    <xsl:value-of
      select="namespace-uri($node)='http://ruleml.org/spec' and
      matches(local-name($node), '^[A-Z]')
      "
    />
  </xsl:function>
  
  <!-- test for Edge elements-->
  <xsl:function name="ruleml:isEdge" as="xs:boolean">
    <xsl:param name="node" as="node()"/>
    <xsl:value-of
      select="namespace-uri($node)='http://ruleml.org/spec' and
      matches(local-name($node), '^[a-z]')
      "
    />
  </xsl:function>
  
  
  <xsl:function name="ruleml:isAEPNode"  as="xs:boolean">
    <xsl:param name="node" as="node()"/>
    <xsl:value-of
      select="namespace-uri($node)='http://ruleml.org/spec' and (
      local-name($node)='Atom' or
      local-name($node)='Expr' or
      local-name($node)='Plex'
      )
      "
    />
  </xsl:function>
  <!-- A test for elements that can only hold terms as Node children, not Formulas -->
  <xsl:function name="ruleml:isTermHolder"  as="xs:boolean">
    <xsl:param name="node" as="node()"/>
    <xsl:value-of
      select="
      ruleml:isAEPNode($node) or
      ruleml:isTermEdge($node)         
      "
    />
  </xsl:function>
  <xsl:function name="ruleml:isFormulaHolder"  as="xs:boolean">
    <xsl:param name="node" as="node()"/>
    <xsl:value-of
      select="
      ruleml:isCompoundSentence($node) or
      ruleml:isFormulaEdge($node)      
      "
    />
  </xsl:function>
  <xsl:function name="ruleml:isTermEdge"  as="xs:boolean">
    <xsl:param name="node" as="node()"/>
    <xsl:value-of
      select="namespace-uri($node)='http://ruleml.org/spec' and
      (local-name($node)='arg' or
      local-name($node)='content' or
      local-name($node)='left' or
      local-name($node)='right' or
      local-name($node)='slot' or
      local-name($node)='declare' or
      local-name($node)='degree' or
      local-name($node)='oid'                    
      )"
    />
  </xsl:function>
  <xsl:function name="ruleml:isFormulaEdge"  as="xs:boolean">
    <xsl:param name="node" as="node()"/>
    <xsl:value-of
      select="namespace-uri($node)='http://ruleml.org/spec' and
      (local-name($node)='formula' or
      local-name($node)='torso' or
      local-name($node)='if' or
      local-name($node)='then' or
      local-name($node)='strong' or
      local-name($node)='weak'
      )"
    />
  </xsl:function>
  <xsl:function name="ruleml:isSimpleTerm"  as="xs:boolean">
    <xsl:param name="node" as="node()"/>
    <xsl:value-of
      select="namespace-uri($node)='http://ruleml.org/spec' and
      (local-name($node)='Ind' or
      local-name($node)='Var' or
      local-name($node)='Skolem' or
      local-name($node)='Reify'
      )
      "
    />
  </xsl:function>
  
  <xsl:function name="ruleml:isCompoundTerm"  as="xs:boolean">
    <xsl:param name="node" as="node()"/>
    <xsl:param name="nodeParent"/>
    <xsl:value-of
      select="(namespace-uri($node)='http://ruleml.org/spec' and
      (local-name($node)='Expr' or
      local-name($node)='Plex'))
      "
    />
  </xsl:function>
  <xsl:function name="ruleml:isSimpleSentence" as="xs:boolean">
    <xsl:param name="node" as="node()"/>
    <xsl:value-of
      select="(namespace-uri($node)='http://ruleml.org/spec' and 
      (
      local-name($node)='Atom' or
      local-name($node)='Equal' or
      local-name($node)='Time[ruleml:isFormulaHolder($nodeParent)]' or
      local-name($node)='Spatial[ruleml:isFormulaHolder($nodeParent)]' or
      local-name($node)='Interval[ruleml:isFormulaHolder($nodeParent)]' or
      local-name($node)='Precedes' or
      local-name($node)='Meets' or
      local-name($node)='Starts' or
      local-name($node)='Overlaps' or
      local-name($node)='Finishes' or
      local-name($node)='Succeeds' or
      local-name($node)='During'
      )
      )
      "
    />
  </xsl:function>
  <xsl:function name="ruleml:isDeonticSentence" as="xs:boolean">
    <xsl:param name="node" as="node()"/>
    <xsl:value-of
      select="(namespace-uri($node)='http://ruleml.org/spec' and 
      (
      local-name($node)='Operation'
      )
      )
      "
    />
  </xsl:function>
  <xsl:function name="ruleml:isGenericSentence" as="xs:boolean">
    <xsl:param name="node" as="node()"/>
    <xsl:value-of
      select="(namespace-uri($node)='http://ruleml.org/spec' and 
      (
      local-name($node)='Operation' or
      local-name($node)='Negation'
      )
      )
      "
    />
  </xsl:function>
  <xsl:function name="ruleml:isNegationAsFailureSentence" as="xs:boolean">
    <xsl:param name="node" as="node()"/>
    <xsl:value-of
      select="(namespace-uri($node)='http://ruleml.org/spec' and 
      (
      local-name($node)='Naf' or
      local-name($node)='Negation'
      )
      )
      "
    />
  </xsl:function>
  <xsl:function name="ruleml:isConnectiveSentence" as="xs:boolean">
    <xsl:param name="node" as="node()"/>
    <xsl:value-of
      select="(namespace-uri($node)='http://ruleml.org/spec' and 
      (
      local-name($node)='And' or
      local-name($node)='Or' or
      local-name($node)='Not' or
      local-name($node)='Implies' or
      local-name($node)='Equivalent' or
      local-name($node)='Operation' or      
      local-name($node)='Negation'      
      )
      )
      "
    />
  </xsl:function>
  <xsl:function name="ruleml:isQuantifiedSentence" as="xs:boolean">
    <xsl:param name="node" as="node()"/>
    <xsl:value-of
      select="(namespace-uri($node)='http://ruleml.org/spec' and 
      (
      local-name($node)='Forall' or
      local-name($node)='Exists' or
      local-name($node)='Operation'
      )
      )
      "
    />
  </xsl:function>
  <xsl:function name="ruleml:isCompoundSentence" as="xs:boolean">
    <xsl:param name="node" as="node()"/>
    <xsl:value-of select="
      ruleml:isConnectiveSentence($node) or
      ruleml:isQuantifiedSentence($node) or
      ruleml:isDeonticSentence($node) or
      ruleml:isNegationAsFailureSentence($node) or
      ruleml:isGenericSentence($node)
      "
    />
  </xsl:function>
  <xsl:function name="ruleml:isSentence" as="xs:boolean">
    <xsl:param name="node" as="node()"/>
    <xsl:value-of
      select="
      ruleml:isSimpleSentence($node) or
      ruleml:isCompoundSentence($node)
      "
    />
  </xsl:function>
  
  <!-- Phase I: insert stripes if skipped -->
  <xsl:variable name="phase-1-output">
    <xsl:apply-templates select="/" mode="phase-1"/>
  </xsl:variable>
  <!-- Wraps the naked RuleML children of RuleML. -->
  <xsl:template
    match="ruleml:RuleML/*[ruleml:isNode(.)]"
    mode="phase-1">
    <xsl:call-template name="wrap">
      <xsl:with-param name="tag">act</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <!-- Wraps the naked RuleML children of Assert. -->
  <xsl:template
    match="ruleml:Assert/*[ruleml:isNode(.)]"
    mode="phase-1">
    <xsl:call-template name="wrap">
      <xsl:with-param name="tag">formula</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <!-- Wraps the naked RuleML children of Rulebase. -->
  <xsl:template
    match="ruleml:Rulebase/*[ruleml:isNode(.)]"
    mode="phase-1">
    <xsl:call-template name="wrap">
      <xsl:with-param name="tag">formula</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <!-- Wraps the naked RuleML children of Equivalent. -->
  <xsl:template
    match="ruleml:Equivalent/*[ruleml:isNode(.)]"
    mode="phase-1">
    <xsl:call-template name="wrap">
      <xsl:with-param name="tag">torso</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <!-- Wraps the naked RuleML children of Retract. -->
  <xsl:template
    match="ruleml:Retract/*[ruleml:isNode(.)]"
    mode="phase-1">
    <xsl:call-template name="wrap">
      <xsl:with-param name="tag">formula</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <!-- Wraps the naked RuleML children of Query. -->
  <xsl:template
    match="ruleml:Query/*[ruleml:isNode(.)]"
    mode="phase-1">
    <xsl:call-template name="wrap">
      <xsl:with-param name="tag">formula</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <!-- Wraps the naked RuleML children of And.-->
  <xsl:template
    match="ruleml:And/*[ruleml:isNode(.)]"
    mode="phase-1">
    <xsl:call-template name="wrap">
      <xsl:with-param name="tag">formula</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <!-- Wraps the naked RuleML children of Or.-->
  <xsl:template
    match="ruleml:Or/*[ruleml:isNode(.)]"
    mode="phase-1">
    <xsl:call-template name="wrap">
      <xsl:with-param name="tag">formula</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <!-- Wraps the naked RuleML children of Neg. -->
  <xsl:template
    match="ruleml:Neg/*[ruleml:isNode(.)]"
    mode="phase-1">
    <xsl:call-template name="wrap">
      <xsl:with-param name="tag">strong</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <!-- Wraps the naked RuleML children of Naf. -->
  <xsl:template
    match="ruleml:Naf/*[ruleml:isNode(.)]"
    mode="phase-1">
    <xsl:call-template name="wrap">
      <xsl:with-param name="tag">weak</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <!-- Wraps the naked RuleML children of Equal in the cases where:
        -the only children of Equal are <left>, <right> and <oid> which can appear before <left> and <right> - does not handle foreign elements in the last or second to last position
        -if both children are already wrapped then they will be copied unchanged
        -neither children are wrapped, then the second to last child is wrapped in <left> and the last child is wrapped <right>
        -the second to last child is wrapped in <right>, and the last child is not wrapped, then the last child is wrapped in <left>, in all other cases,
        the last child is wrapped in <right>
        -the last child is wrapped in <left> and the second to last child is not wrapped, then the second to last child is wrapped in <right>,
        in all other cases, the second to last child is wrapped in <left>
        Does not normalize cases where:
        -there are foreign elements as the last or second to last child
        -there are foreign elements between the last and second to last child
       
    -->
  <!-- Wraps the second to last RuleML child of Equal. -->
  <xsl:template match="ruleml:Equal/*[last()-1][ruleml:isNode(.)]"
    mode="phase-1">
    <xsl:choose>
      <xsl:when test="local-name(following-sibling::*[1])='left'">
        <xsl:call-template name="wrap">
          <xsl:with-param name="tag">right</xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="wrap">
          <xsl:with-param name="tag">left</xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- Wraps the last RuleML child of Equal. -->
  <xsl:template match="ruleml:Equal/*[last()][ruleml:isNode(.)]"
    mode="phase-1">
    <xsl:choose>
      <xsl:when test="local-name(preceding-sibling::*[1])='right'">
        <xsl:call-template name="wrap">
          <xsl:with-param name="tag">left</xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="wrap">
          <xsl:with-param name="tag">right</xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- Wraps the naked RuleML childern of Atom. -->
  <xsl:template
    match="ruleml:Atom/*[ruleml:isNode(.)]"
    mode="phase-1">
    <xsl:choose>
      <xsl:when test="local-name()='Rel'">
        <xsl:call-template name="wrap">
          <xsl:with-param name="tag">op</xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="wrap">
          <xsl:with-param name="tag">arg</xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- Wraps the naked RuleML children of Implies in the cases where:
        -the only children of Implies are <left>, <right> and <oid> which can appear before <if> and <then> - does not handle foreign elements in the last or second to last position
        -if both children are already wrapped then they will be copied unchanged
        -neither children are wrapped, then the second to last child is wrapped in <if> and the last child is wrapped <then>
        -the second to last child is wrapped in <then>, and the last child is not wrapped, then the last child is wrapped in <if>, in all other cases,
        the last child is wrapped in <then>
        -the last child is wrapped in <if> and the second to last child is not wrapped, then the second to last child is wrapped in <then>,
        in all other cases, the second to last child is wrapped in <if>
        Does not normalize cases where:
        -there are foreign elements as the last or second to last child
        -there are foreign elements between the last and second to last child
    -->
  <!-- Wraps the second to last RuleML child of Implies or Entails. -->
  <xsl:template
    match="ruleml:Implies/ruleml:*[last()-1]|
    ruleml:Entails/ruleml:*[last()-1]"
    mode="phase-1">
    <!--<xsl:comment>second to last</xsl:comment>-->
    <xsl:choose>
      <xsl:when test="local-name()='if' or local-name()='then'">
        <xsl:call-template name="copy-1"/>
      </xsl:when>
      <xsl:when test="local-name(following-sibling::*[1])='if'">
        <xsl:call-template name="wrap">
          <xsl:with-param name="tag">then</xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="wrap">
          <xsl:with-param name="tag">if</xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- Wraps the last RuleML child of Implies or Entails. -->
  <xsl:template
    match="ruleml:Implies/ruleml:*[last()]|
     ruleml:Entails/ruleml:*[last()]"
    mode="phase-1">
    <!--<xsl:comment>last</xsl:comment>-->
    <xsl:choose>
      <xsl:when test="local-name()='if' or local-name()='then'">
        <xsl:call-template name="copy-1"/>
      </xsl:when>
      <xsl:when test="local-name(preceding-sibling::*[1])='then'">
        <xsl:call-template name="wrap">
          <xsl:with-param name="tag">if</xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="wrap">
          <xsl:with-param name="tag">then</xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- Wraps the naked RuleML children of Forall. -->
  <xsl:template
    match="ruleml:Forall/*[ruleml:isNode(.)]"
    mode="phase-1">
    <xsl:choose>
      <xsl:when test="local-name(.)='Var'">
        <xsl:call-template name="wrap">
          <xsl:with-param name="tag">declare</xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="wrap">
          <xsl:with-param name="tag">formula</xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- Wraps the naked RuleML children of Exists. -->
  <xsl:template
    match="ruleml:Exists/*[ruleml:isNode(.)]"
    mode="phase-1">
    <xsl:choose>
      <xsl:when test="local-name(.)='Var'">
        <xsl:call-template name="wrap">
          <xsl:with-param name="tag">declare</xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="wrap">
          <xsl:with-param name="tag">formula</xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- Wraps the naked children of Expr -->
  <xsl:template
    match="ruleml:Expr/*[ruleml:isNode(.)]"
    mode="phase-1">
    <xsl:choose>
      <xsl:when test="local-name()='Fun'">
        <xsl:call-template name="wrap">
          <xsl:with-param name="tag">op</xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="wrap">
          <xsl:with-param name="tag">arg</xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- Wraps the naked children of Plex. -->
  <xsl:template
    match="ruleml:Plex/*[ruleml:isNode(.)]"
    mode="phase-1">
    <xsl:call-template name="wrap">
      <xsl:with-param name="tag">arg</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <!-- Named template that wraps an element in the element given by the tag parameter. -->
  <xsl:template name="wrap">
    <xsl:param name="tag"/>
    <xsl:element name="ruleml:{$tag}">
      <xsl:call-template name="copy-1"/>
    </xsl:element>
  </xsl:template>
  <!-- Copies everything else to the phase-1 output. Comments are preserved without escaping.
        Order is preserved.
        Foreign elements are preserved.
        Because this is the most general of all templates, any more specific template in phase-1 will over-ride this one.  -->
  <xsl:template match="node() | @*" mode="phase-1">
    <xsl:call-template name="copy-1"/>
  </xsl:template>
  <xsl:template name="copy-1">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*" mode="phase-1"/>
    </xsl:copy>
  </xsl:template>
  <!-- Phase II: rearrange into canonical ordering -->
  <xsl:variable name="phase-2-output">
    <xsl:apply-templates select="$phase-1-output" mode="phase-2"/>
  </xsl:variable>
  <!-- Note: Some of these templates may be combined. -->
  <!-- Builds canonically-ordered content of Retract. -->
  <xsl:template match="ruleml:Retract|ruleml:Assert" mode="phase-2">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="phase-2"/>
      <xsl:apply-templates select="*[namespace-uri(.)!='http://ruleml.org/spec']" mode="phase-2"/>
      <xsl:apply-templates select="comment()" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:meta" mode="phase-2"/>
      <xsl:apply-templates
        select="*[namespace-uri(.)='http://ruleml.org/spec' and
              (local-name(.)!= 'meta' and local-name(.)!= 'formula')]"
        mode="phase-2"/>
      <xsl:apply-templates select="ruleml:formula" mode="phase-2"/>
    </xsl:copy>
  </xsl:template>
  <!-- Builds canonically-ordered content of Query. -->
  <xsl:template match="ruleml:Query" mode="phase-2">
    <xsl:copy>
      <xsl:apply-templates select="*[namespace-uri(.)!='http://ruleml.org/spec']" mode="phase-2"/>
      <xsl:apply-templates select="@*" mode="phase-2"/>
      <xsl:apply-templates select="comment()" mode="phase-2"/>
      <xsl:apply-templates select="*[namespace-uri(.)!='http://ruleml.org/spec']" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:meta" mode="phase-2"/>
      <xsl:apply-templates
        select="*[namespace-uri(.)='http://ruleml.org/spec' and
              (local-name(.)!= 'meta' and local-name(.)!= 'formula')]"
        mode="phase-2"/>
      <xsl:apply-templates select="ruleml:formula" mode="phase-2"/>
    </xsl:copy>
  </xsl:template>
  <!-- Builds canonically-ordered content of Entails. -->
  <xsl:template match="ruleml:Entails" mode="phase-2">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="phase-2"/>
      <xsl:apply-templates select="comment()" mode="phase-2"/>
      <xsl:apply-templates select="*[namespace-uri(.)!='http://ruleml.org/spec']" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:meta" mode="phase-2"/>
      <xsl:apply-templates
        select="*[namespace-uri(.)='http://ruleml.org/spec' and
              (local-name(.)!= 'meta' and local-name(.)!= 'if' 
              and local-name(.)!= 'then')]"
        mode="phase-2"/>
      <xsl:apply-templates select="ruleml:if" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:then" mode="phase-2"/>
    </xsl:copy>
  </xsl:template>
  <!-- Builds canonically-ordered content of Rulebase. -->
  <xsl:template match="ruleml:Rulebase" mode="phase-2">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="phase-2"/>
      <xsl:apply-templates select="comment()" mode="phase-2"/>
      <xsl:apply-templates select="*[namespace-uri(.)!='http://ruleml.org/spec']" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:meta" mode="phase-2"/>
      <xsl:apply-templates
        select="*[namespace-uri(.)='http://ruleml.org/spec' and
              (local-name(.)!= 'meta' and local-name(.)!= 'formula')]"
        mode="phase-2"/>
      <xsl:apply-templates select="ruleml:formula" mode="phase-2"/>
    </xsl:copy>
  </xsl:template>
  <!-- Builds canonically-ordered content of Exists. -->
  <xsl:template match="ruleml:Exists" mode="phase-2">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="phase-2"/>
      <xsl:apply-templates select="comment()" mode="phase-2"/>
      <xsl:apply-templates select="*[namespace-uri(.)!='http://ruleml.org/spec']" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:meta" mode="phase-2"/>
      <xsl:apply-templates
        select="*[namespace-uri(.)='http://ruleml.org/spec' and
              (local-name(.)!= 'meta' and local-name(.)!= 'formula')]"
        mode="phase-2"/>
      <xsl:apply-templates select="ruleml:formula" mode="phase-2"/>
    </xsl:copy>
  </xsl:template>
  <!-- Builds canonically-ordered content of Forall. -->
  <xsl:template match="ruleml:Forall" mode="phase-2">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="phase-2"/>
      <xsl:apply-templates select="comment()" mode="phase-2"/>
      <xsl:apply-templates select="*[namespace-uri(.)!='http://ruleml.org/spec']" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:meta" mode="phase-2"/>
      <xsl:apply-templates
        select="*[namespace-uri(.)='http://ruleml.org/spec' and
              (local-name(.)!= 'meta' and local-name(.)!= 'formula')]"
        mode="phase-2"/>
      <xsl:apply-templates select="ruleml:formula" mode="phase-2"/>
    </xsl:copy>
  </xsl:template>
  <!-- Builds canonically-ordered content of Implies. -->
  <xsl:template match="ruleml:Implies" mode="phase-2">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="phase-2"/>
      <xsl:apply-templates select="comment()" mode="phase-2"/>
      <xsl:apply-templates select="*[namespace-uri(.)!='http://ruleml.org/spec']" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:meta" mode="phase-2"/>
      <xsl:apply-templates
        select="*[namespace-uri(.)='http://ruleml.org/spec' and
              (local-name(.)!= 'meta' and local-name(.)!= 'if' 
              and local-name(.)!= 'then')]"
        mode="phase-2"/>
      <xsl:apply-templates select="ruleml:if" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:then" mode="phase-2"/>
    </xsl:copy>
  </xsl:template>
  <!-- Builds canonically-ordered content of Equivalent. -->
  <xsl:template match="ruleml:Equivalent" mode="phase-2">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="phase-2"/>
      <xsl:apply-templates select="comment()" mode="phase-2"/>
      <xsl:apply-templates select="*[namespace-uri(.)!='http://ruleml.org/spec']" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:meta" mode="phase-2"/>
      <xsl:apply-templates
        select="*[namespace-uri(.)='http://ruleml.org/spec' and
              (local-name(.)!= 'meta' and local-name(.)!= 'torso')]"
        mode="phase-2"/>
      <xsl:apply-templates select="ruleml:torso" mode="phase-2"/>
    </xsl:copy>
  </xsl:template>
  <!-- Builds canonically-ordered content of And.-->
  <xsl:template match="ruleml:And" mode="phase-2">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="phase-2"/>
      <xsl:apply-templates select="comment()" mode="phase-2"/>
      <xsl:apply-templates select="*[namespace-uri(.)!='http://ruleml.org/spec']" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:meta" mode="phase-2"/>
      <xsl:apply-templates
        select="*[namespace-uri(.)='http://ruleml.org/spec' and
              (local-name(.)!= 'meta' and local-name(.)!= 'formula')]"
        mode="phase-2"/>
      <xsl:apply-templates select="ruleml:formula" mode="phase-2"/>
    </xsl:copy>
  </xsl:template>
  <!-- Builds canonically-ordered content of Or. -->
  <xsl:template match="ruleml:Or" mode="phase-2">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="phase-2"/>
      <xsl:apply-templates select="comment()" mode="phase-2"/>
      <xsl:apply-templates select="*[namespace-uri(.)!='http://ruleml.org/spec']" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:meta" mode="phase-2"/>
      <xsl:apply-templates
        select="*[namespace-uri(.)='http://ruleml.org/spec' and
              (local-name(.)!= 'meta' and local-name(.)!= 'formula')]"
        mode="phase-2"/>
      <xsl:apply-templates select="ruleml:formula" mode="phase-2"/>
    </xsl:copy>
  </xsl:template>
  <!-- Builds canonically-ordered content of Atom. -->
  <xsl:template match="ruleml:Atom" mode="phase-2">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="phase-2"/>
      <xsl:apply-templates select="comment()" mode="phase-2"/>
      <xsl:apply-templates select="*[namespace-uri(.)!='http://ruleml.org/spec']" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:meta" mode="phase-2"/>
      <xsl:apply-templates
        select="*[
              namespace-uri(.)='http://ruleml.org/spec' and 
              local-name(.)!= 'meta' and 
              local-name(.)!= 'oid' and 
              local-name(.)!= 'degree' and 
              local-name(.)!= 'op' and 
              local-name(.)!= 'arg' and 
              local-name(.)!='repo' and 
              local-name(.)!='slot' and 
              local-name(.)!='resl']"
        mode="phase-2"/>
      <xsl:apply-templates select="ruleml:oid" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:degree" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:op" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:arg" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:repo" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:slot" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:resl" mode="phase-2"/>
    </xsl:copy>
  </xsl:template>
  <!-- Builds canonically-ordered content of Equal. -->
  <xsl:template match="ruleml:Equal" mode="phase-2">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="phase-2"/>
      <xsl:apply-templates select="comment()" mode="phase-2"/>
      <xsl:apply-templates select="*[namespace-uri(.)!='http://ruleml.org/spec']" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:meta" mode="phase-2"/>
      <xsl:apply-templates
        select="*[
              namespace-uri(.)='http://ruleml.org/spec' and 
              local-name(.)!= 'meta' and 
              local-name(.)!= 'degree' and 
              local-name(.)!= 'left' and 
              local-name(.)!= 'right']"
        mode="phase-2"/>
      <xsl:apply-templates select="ruleml:degree" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:left" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:right" mode="phase-2"/>
    </xsl:copy>
  </xsl:template>
  <!-- Builds canonically-ordered content of Neg. -->
  <xsl:template match="ruleml:Neg" mode="phase-2">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="phase-2"/>
      <xsl:apply-templates select="comment()" mode="phase-2"/>
      <xsl:apply-templates select="*[namespace-uri(.)!='http://ruleml.org/spec']" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:meta" mode="phase-2"/>
      <xsl:apply-templates
        select="*[namespace-uri(.)='http://ruleml.org/spec' and
              (local-name(.)!= 'meta' and local-name(.)!= 'strong')]"
        mode="phase-2"/>
      <xsl:apply-templates select="ruleml:strong" mode="phase-2"/>
    </xsl:copy>
  </xsl:template>
  <!-- Builds canonically-ordered content of Naf. -->
  <xsl:template match="ruleml:Naf" mode="phase-2">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="phase-2"/>
      <xsl:apply-templates select="comment()" mode="phase-2"/>
      <xsl:apply-templates select="*[namespace-uri(.)!='http://ruleml.org/spec']" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:meta" mode="phase-2"/>
      <xsl:apply-templates
        select="*[namespace-uri(.)='http://ruleml.org/spec' and
              (local-name(.)!= 'meta' and local-name(.)!= 'weak')]"
        mode="phase-2"/>
      <xsl:apply-templates select="ruleml:weak" mode="phase-2"/>
    </xsl:copy>
  </xsl:template>
  <!-- Builds canonically-ordered content of Expr. -->
  <xsl:template match="ruleml:Expr" mode="phase-2">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="phase-2"/>
      <xsl:apply-templates select="comment()" mode="phase-2"/>
      <xsl:apply-templates select="*[namespace-uri(.)!='http://ruleml.org/spec']" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:meta" mode="phase-2"/>
      <xsl:apply-templates
        select="*[
              namespace-uri(.)='http://ruleml.org/spec' and 
              local-name(.)!= 'meta' and 
              local-name(.)!= 'oid' and 
              local-name(.)!= 'op' and 
              local-name(.)!= 'arg' and 
              local-name(.)!='repo' and 
              local-name(.)!='slot' and 
              local-name(.)!='resl']"
        mode="phase-2"/>
      <xsl:apply-templates select="ruleml:oid" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:op" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:arg" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:repo" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:slot" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:resl" mode="phase-2"/>
    </xsl:copy>
  </xsl:template>
  <!-- Builds canonically-ordered content of Plex. -->
  <xsl:template match="ruleml:Plex" mode="phase-2">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="phase-2"/>
      <xsl:apply-templates select="comment()" mode="phase-2"/>
      <xsl:apply-templates select="*[namespace-uri(.)!='http://ruleml.org/spec']" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:meta" mode="phase-2"/>
      <xsl:apply-templates
        select="*[
              namespace-uri(.)='http://ruleml.org/spec' and 
              local-name(.)!= 'meta' and 
              local-name(.)!= 'oid' and 
              local-name(.)!= 'arg' and 
              local-name(.)!='repo' and 
              local-name(.)!='slot' and 
              local-name(.)!='resl']"/>
      <xsl:apply-templates select="ruleml:oid" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:arg" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:repo" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:slot" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:resl" mode="phase-2"/>
    </xsl:copy>
  </xsl:template>
  <!-- Copies everything else to the phase-2 output. Comments are preserved without escaping.
        Order is preserved.
        Foreign elements are preserved.
        Because this is the most general of all templates, any more specific template in phase-2 will over-ride this one.  -->
  <xsl:template match="@* | node() " mode="phase-2">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()" mode="phase-2"/>
    </xsl:copy>
  </xsl:template>
  <!-- Phase III: add required attributes -->
  <xsl:variable name="phase-3-output">
    <xsl:apply-templates select="$phase-2-output" mode="phase-3"/>
  </xsl:variable>
  <!-- Adds the required index attribute to the arg tag 
        There are errors with the indexing when the argument is within a slot-->
  <xsl:template match="ruleml:arg[not(@index)]" mode="phase-3">
    <xsl:variable name="index_value">
      <xsl:value-of select="count(preceding-sibling::ruleml:arg)+1"/>
    </xsl:variable>
    <xsl:element name="ruleml:arg">
      <xsl:attribute name="index">
        <xsl:value-of select="$index_value"/>
      </xsl:attribute>
      <xsl:apply-templates select="@*|node()" mode="phase-3"/>
    </xsl:element>
  </xsl:template>
  <!-- Adds the required index attribute to the act tag -->
  <xsl:template match="ruleml:act[not(@index)]" mode="phase-3">
    <xsl:variable name="index_value">
      <xsl:value-of select="count(preceding-sibling::ruleml:act)+1"/>
    </xsl:variable>
    <xsl:element name="ruleml:act">
      <xsl:attribute name="index">
        <xsl:value-of select="$index_value"/>
      </xsl:attribute>
      <xsl:apply-templates select="@*|node()" mode="phase-3"/>
    </xsl:element>
  </xsl:template>
  
  <!-- Adds the required index attribute to the formula tag in And and Or -->
  <xsl:template match="*[self::ruleml:And or self::ruleml:Or]/ruleml:formula[not(@index)]" mode="phase-3">
    <xsl:variable name="index_value">
      <xsl:value-of select="count(preceding-sibling::ruleml:formula)+1"/>
    </xsl:variable>
    <xsl:element name="ruleml:formula">
      <xsl:attribute name="index">
        <xsl:value-of select="$index_value"/>
      </xsl:attribute>
      <xsl:apply-templates select="@*|node()" mode="phase-3"/>
    </xsl:element>
  </xsl:template>
  
  <!-- Copies everything else to the phase-3 output. Comments are preserved without escaping.
        Order is preserved.
        Foreign elements are preserved.
        Because this is the most general of all templates, any more specific template in phase-3 will over-ride this one.  -->
  <xsl:template match="node() | @*" mode="phase-3">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*" mode="phase-3"/>
    </xsl:copy>
  </xsl:template>
  <!-- Phase IV: sort by required attributes -->
  
  <xsl:variable name="phase-sort-output">
    <xsl:apply-templates select="$phase-3-output" mode="phase-sort"/>
  </xsl:variable>
  
  <!-- Sorts by the required index attribute to the arg tag 
        There are errors with the indexing when the argument is within a slot-->
  
  <xsl:template match="*[ruleml:arg]" mode="phase-sort">
    <xsl:copy>
      <xsl:apply-templates select="@*"  mode="phase-sort"/>
      <xsl:apply-templates select="node()[not(self::ruleml:arg or self::ruleml:repo or self::ruleml:slot or self::ruleml:resl)]"  mode="phase-sort"/>
      <xsl:apply-templates select="ruleml:arg"  mode="phase-sort">
        <xsl:sort select="@index"  data-type="number"/>                
      </xsl:apply-templates>
      <xsl:apply-templates select="ruleml:repo" mode="phase-sort"/>
      <xsl:apply-templates select="ruleml:slot" mode="phase-sort"/>
      <xsl:apply-templates select="ruleml:resl" mode="phase-sort"/>
    </xsl:copy>  
  </xsl:template>
  
  
  <!-- Sorts by the required index attribute to the act tag -->
  <xsl:template match="*[ruleml:act]" mode="phase-sort">
    <xsl:copy>
      <xsl:apply-templates select="@*"  mode="phase-sort"/>
      <xsl:apply-templates select="node()[not(self::ruleml:act)]"  mode="phase-sort"/>
      <xsl:apply-templates select="ruleml:act"  mode="phase-sort">
        <xsl:sort select="@index"  data-type="number"/>                
      </xsl:apply-templates>
    </xsl:copy>  
  </xsl:template>
  <!-- Sorts by the required index attribute to the formula tag in And and Or -->
  <xsl:template match="*[self::ruleml:And or self::ruleml:Or]" mode="phase-sort">
    <xsl:copy>
      <xsl:apply-templates select="@*"  mode="phase-sort"/>
      <xsl:apply-templates select="node()[not(self::ruleml:formula)]"  mode="phase-sort"/>
      <xsl:apply-templates select="ruleml:formula"  mode="phase-sort">
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
  
 
</xsl:stylesheet>
