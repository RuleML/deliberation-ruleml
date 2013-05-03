<!-- This XML fragment should be served with MIME type
     application/xml-external-parsed-entity
-->
<rdfs:Class 
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" 
  xmlns:xs="http://www.w3.org/2001/XMLSchema"    
    rdf:about="#Rule">
    <rdfs:subClassOf rdf:resource="#Formula"/>
  </rdfs:Class>
  <!-- A ruleml:#ClosedRule has no free variables, but has at least one
       bound variable whose scope is the entire ruleml:#Rule-->
  <rdfs:Class rdf:about="#ClosedRule">
    <rdfs:subClassOf rdf:resource="#Rule"/>
    <rdfs:subClassOf>
      <rdf:Description rdf:about="#ClosedFormula">
        <rdfs:subClassOf rdf:resource="#Formula"/>
      </rdf:Description>
    </rdfs:subClassOf>
  </rdfs:Class>
  <!-- A ruleml:#OpenRule has free variables. 
    It may also contain bound variables. -->
  <rdfs:Class rdf:about="#OpenRule">
    <rdfs:subClassOf rdf:resource="#Rule"/>
    <rdfs:subClassOf>
      <rdf:Description rdf:about="#OpenFormula">
        <rdfs:subClassOf rdf:resource="#Formula"/>
      </rdf:Description>
    </rdfs:subClassOf>
  </rdfs:Class>
  <!-- A ruleml:#GroundRule has no variables. -->
  <rdfs:Class rdf:about="#GroundRule">
    <rdfs:subClassOf rdf:resource="#Rule"/>
    <rdfs:subClassOf>
      <rdf:Description rdf:about="#GroundFormula">
        <rdfs:subClassOf rdf:resource="#Formula"/>
      </rdf:Description>
    </rdfs:subClassOf>
  </rdfs:Class>
  <rdfs:Class rdf:about="#FormulaForRuleAntecedent">
    <rdfs:subClassOf rdf:resource="#LogicalFormula"/>
  </rdfs:Class>
  <rdfs:Class rdf:about="#FormulaForRuleConsequent">
    <rdfs:subClassOf rdf:resource="#LogicalFormula"/>
  </rdfs:Class>
  <rdf:Property rdf:about="#ifRule">
    <rdfs:domain rdf:resource="#Rule"/>
    <rdfs:range rdf:resource="#FormulaForRuleAntecedent"/>
  </rdf:Property>
  <rdf:Property rdf:about="#thenRule">
    <rdfs:domain rdf:resource="#Rule"/>
    <rdfs:range rdf:resource="#FormulaForRuleConsequent"/>
  </rdf:Property>