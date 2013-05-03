<!-- This XML fragment should be served with MIME type
     application/xml-external-parsed-entity
-->

  <rdfs:Class rdf:about="#TermSequenceForAtom">
    <rdfs:subClassOf rdf:resource="&rdf;List"/>
  </rdfs:Class>
 
  <rdf:Property rdf:about="#hasOperator-Atomic">
    <rdfs:domain rdf:resource="#AtomicFormula"/>
    <rdfs:range rdf:resource="#Relation"/>
  </rdf:Property>

  <rdf:Property rdf:about="#hasPositionalArgumentSequence-Atomic">
    <rdfs:domain rdf:resource="#AtomicFormula"/>
    <rdfs:range rdf:resource="#TermSequenceForAtom"/>
  </rdf:Property>

  <rdf:Property rdf:about="#hasFirstPositionalArgument-Atomic">
    <rdfs:subPropertyOf rdf:resource="&rdf;first"/>
    <rdfs:domain rdf:resource="#TermSequenceForAtom"/>
    <rdfs:range rdf:resource="#TermForAtom"/>
  </rdf:Property>

  <rdf:Property rdf:about="#restOfPositionalArguments-Atomic">
    <rdfs:subPropertyOf rdf:resource="&rdf;rest"/>
    <rdfs:domain rdf:resource="#TermSequenceForAtom"/>
    <rdfs:range rdf:resource="#TermSequenceForAtom"/>
  </rdf:Property>

 

  <!-- Usage:
   Example 1. An explicit positional argument sequence, with no rest variable.

   <AtomicFormula rdf:about="atom-1">
      <hasOperator-Atomic><Relation rdf:about="r"/></hasOperator-Atomic>
      <hasPositionalArgumentSequence-Atomic rdf:parseType="Collection">
        <Individual rdf:about="a"/>
        <Individual rdf:about="b"/>
      </hasPositionalArgumentSequence-Atomic>
    </AtomicFormula>  

    
    Example 2. To have a rest variable for the positional term sequence,
    it is necessary to use the long-hand construction for an rdf:List
    
    <AtomicFormula rdf:about="atom-2">
      <hasOperator-Atomic><Relation rdf:about="r"/></hasOperator-Atomic>
      <hasPositionalArgumentSequence-Atomic>
        <TermSequenceForAtom rdf:nodeID="seq1"> 
           <hasFirstPositionalArgument-Atomic>
             <Individual rdf:about="a"/>
           </hasFirstPositionalArgument-Atomic>
           <restOfPositionalArguments-Atomic>
              <TermSequenceForAtom rdf:nodeID="seq2"> 
                 <hasFirstPositionalArgument-Atomic>     
                   <Individual rdf:about="b"/>
                 </hasFirstPositionalArgument-Atomic>
                 <restOfPositionalArguments-Atomic>
                   <Var>X</Var>
                 </restOfPositionalArguments-Atomic> 
              <TermSequenceForAtom>
           </restOfPositionalArguments-Atomic> 
        </TermSequenceForAtom>      
      </hasPositionalArgumentSequence-Atomic>
    </AtomicFormula>  

 
   
    See http://www.w3.org/TR/2004/REC-rdf-primer-20040210/#collections 
-->

 <rdf:Property rdf:about="#hasSlottedArgument-Atomic">
    <rdfs:domain rdf:resource="#AtomicFormula"/>
    <rdfs:range rdf:resource="#SlotForAtom"/>
  </rdf:Property>

  <rdf:Property rdf:about="#hasSlottedArgumentSequence-Atomic">
    <rdfs:domain rdf:resource="#AtomicFormula"/>
    <rdfs:range rdf:resource="#SlotSequenceForAtom"/>
  </rdf:Property>

  <rdf:Property rdf:about="#hasFirstSlottedArgument-Atomic">
    <rdfs:subPropertyOf rdf:resource="&rdf;first"/>
    <rdfs:domain rdf:resource="#SlotSequenceForAtom"/>
    <rdfs:range rdf:resource="#SlotForAtom"/>
  </rdf:Property>

  <rdf:Property rdf:about="#restOfSlottedArguments-Atomic">
    <rdfs:subPropertyOf rdf:resource="&rdf;rest"/>
    <rdfs:domain rdf:resource="#SlotSequenceForAtom"/>
    <rdfs:range rdf:resource="#SlotSequenceForAtom"/>
  </rdf:Property>

  <!-- Usage:
   Example 3. An explicit slotted argument sequence, with no rest variable.

   <AtomicFormula rdf:about="atom-3">
      <hasOperator-Atomic><Relation rdf:about="r"/></hasOperator-Atomic>
      <hasSlottedArgumentSequence-Atomic rdf:parseType="Collection">
        <Slot>
          <hasSlotKey><Individual rdf:about="s"/></hasSlotName>
          <hasSlotFiller><Individual rdf:about="a"/></hasSlotName>
        </Slot>
        <Individual rdf:about="b"/>
      </hasPositionalArgumentSequence-Atomic>
    </AtomicFormula>  

    
    Example 2. To have a rest variable for the positional term sequence,
    it is necessary to use the long-hand construction for an rdf:List
    
    <AtomicFormula rdf:about="atom-2">
      <hasOperator-Atomic><Relation rdf:about="r"/></hasOperator-Atomic>
      <hasPositionalArgumentSequence-Atomic>
        <TermSequenceForAtom rdf:nodeID="seq1"> 
           <hasFirstPositionalArgument-Atomic>
             <Individual rdf:about="a"/>
           </hasFirstPositionalArgument-Atomic>
           <restOfPositionalArguments-Atomic>
              <TermSequenceForAtom rdf:nodeID="seq2"> 
                 <hasFirstPositionalArgument-Atomic>     
                   <Individual rdf:about="b"/>
                 </hasFirstPositionalArgument-Atomic>
                 <restOfPositionalArguments-Atomic>
                   <Var>X</Var>
                 </restOfPositionalArguments-Atomic> 
              <TermSequenceForAtom>
           </restOfPositionalArguments-Atomic> 
        </TermSequenceForAtom>      
      </hasPositionalArgumentSequence-Atomic>
    </AtomicFormula>  

 
   
    See http://www.w3.org/TR/2004/REC-rdf-primer-20040210/#collections 
-->

  <rdf:Property rdf:about="#oid-Atom">
    <rdfs:domain rdf:resource="#AtomicFormula"/>
    <rdfs:range rdf:resource="#Term-oidAtom"/>
  </rdf:Property>
