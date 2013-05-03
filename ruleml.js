// As JSON-LD, illustrating the conversion of RDF to JSON.
// This javascript is valid according to http://www.javascriptlint.com/online_lint.php
//  and also compares favorably with the auto-generated JSON-LD from http://rdf-translator.appspot.com
// Note: this JSON is out-of-date relative to ruleml.rdfs
var RuleMLOntology =

{ "@context":
  { "rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#",
    "rdfs":"http://www.w3.org/2000/01/rdf-schema#",
    "ruleml":"http://ruleml.org/spec",
    "Class":
      { "@id": "rdf:Class",
      "@type": "@id"},
    "subClassOf": 
      { "@id": "rdfs:subClassOf",
      "@type": "@id"},
    "type": 
      { "@id": "rdf:type",
      "@type": "@id"},
    "property": 
      { "@id": "rdf:property",
      "@type": "@id"}
  },
  "@graph" :[
    { "@id": "ruleml:#Thing",
      "@type": "Class" },
    { "@id": "ruleml:#RuleML",
      "@type": "Class",
      "subClassOf":
      {"@id":"ruleml:#Thing"}},
    { "@id": "ruleml:#Performative",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#Thing"}},
    { "@id": "ruleml:#Performative",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#Thing"}},
    { "@id": "ruleml:#Assert",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#Performative"}},
    { "@id": "ruleml:#Retract",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#Performative"}},
    { "@id": "ruleml:#Query",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#Performative"}},
    { "@id": "ruleml:#MetaFormula",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#Thing"}},
    { "@id": "ruleml:#Entails",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#MetaFormula"}},
    { "@id": "ruleml:#Rulebase",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#MetaFormula"}},
    { "@id": "ruleml:#Formula",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#Thing"}},
    { "@id": "ruleml:#LogicalFormula",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#Formula"}},
    { "@id": "ruleml:#SimpleFormula",
      "@type": "Class"},
    { "@id": "ruleml:#CompoundFormula",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#Formula"}},
    { "@id": "ruleml:#Quantification",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#CompoundFormula"}},
    { "@id": "ruleml:#Forall",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#Quantification"}},
    { "@id": "ruleml:#Exists",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#Quantification"}},
    { "@id": "ruleml:#Boolean",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#CompoundFormula"}},
    { "@id": "ruleml:#Boolean",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#CompoundFormula"}},
    { "@id": "ruleml:#Naf",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#Boolean"}},
    { "@id": "ruleml:#Neg",
      "@type": "Class",
      "subClassOf":
        { "@list": [ "#Boolean", "LogicalFormula" ] }
    }, 
    { "@id": "ruleml:#And",
      "@type": "Class",
      "subClassOf":
        { "@list": [ "#Boolean", "LogicalFormula" ] }
    },
    { "@id": "ruleml:#Or",
      "@type": "Class",
      "subClassOf":
        { "@list": [ "#Boolean", "LogicalFormula" ] }
    },
    { "@id": "ruleml:#Equiv",
      "@type": "Class",
      "subClassOf":
        { "@list": [ "#Boolean", "LogicalFormula" ] }
    },
    { "@id": "ruleml:#Implies",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#Boolean"}
    },
    { "@id": "ruleml:#ImpliesMaterial",
      "@type": "Class",
      "subClassOf":
        { "@list": [ "#Implies", "LogicalFormula" ] }
    },
    { "@id": "ruleml:#Atom",
      "@type": "Class",
      "subClassOf":
        { "@list": [ "#SimpleFormula", "LogicalFormula" ] }
    },
    { "@id": "ruleml:#Equal",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#SimpleFormula"}
    },
    { "@id": "ruleml:#EqualBidirectional",
      "@type": "Class",
      "subClassOf":
        { "@list": [ "#Equal", "LogicalFormula" ] }
    },
    { "@id": "ruleml:#Term",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#Thing"}
    },
    { "@id": "ruleml:#Ind",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#Term"}
    },
    { "@id": "ruleml:#Var",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#Term"}
    },
    { "@id": "ruleml:#Skolem",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#Term"}
    },
    { "@id": "ruleml:#Expr",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#Term"}
    },
    { "@id": "ruleml:#Rel",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#Thing"}
    },
    { "@id": "ruleml:#Fun",
      "@type": "Class",
      "subClassOf":{"@id":"ruleml:#Thing"}
    },
    { "@id": "ruleml:#act",
      "@type": "Property",
      "domain":{"@id":"ruleml:#RuleML"},
      "range":{"@id":"ruleml:#Performative"}
    },
    { "@id": "ruleml:#formulaPerformative",
      "@type": "Property",
      "domain":{"@id":"ruleml:#Performative"},
      "range":{"@id":"ruleml:#MetaFormula"}
    },
    { "@id": "ruleml:#formulaRulebase",
      "@type": "Property",
      "domain":{"@id":"ruleml:#Rulebase"},
      "range":{"@id":"ruleml:#Formula"}
    },
    { "@id": "ruleml:#formulaFormula",
      "@type": "Property",
      "domain":{"@id":"ruleml:#Formula"},
      "range":{"@id":"ruleml:#LogicalFormula"}
    },
    { "@id": "ruleml:#meta",
      "@type": "Property",
      "domain":{"@id":"ruleml:#Thing"},
      "range":{"@id":"ruleml:#Formula"}
    },
    { "@id": "ruleml:#node",
      "@type": "Property",
      "domain":{"@id":"ruleml:#Thing"},
      "range":"xs:anyURI"
    }  
  ]
};  