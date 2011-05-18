<?php
//Assembler of RNC schema for RuleML 1.0
// Last Modified 2011/05/17
// Step 000. Initialize some parameters
$schemaLocation='';
$modulesLocation = $schemaLocation . 'modules/';
$start = ' start = Node.choice | edge.choice'."\n";
$end = ' inherit = ruleml {start |= notAllowed}';
$base_url = "http://www.ruleml.org/1.0/relaxng/schema_rnc.php";
$now =  date(DATE_ATOM,time());
//Step 00. Write the header
echo 'namespace dc = "http://purl.org/dc/elements/1.1/"
namespace ruleml = "http://www.ruleml.org/spec"

dc:title [ "RuleML Custom-Built Schema" ]
dc:version [ "1.0.01" ]
dc:creator [ "Tara Athan (taraathan AT gmail.com)" ]
dc:subject [ "RuleML, custom-built" ]
dc:description [
    "custom-built main module for a RuleML sublanguage."
]
dc:date [ "';
echo($now);
echo '" ]
dc:language [ "en" ]
dc:rights [ "TBD" ]
dc:relation [ "http://wiki.ruleml.org/index.php/Relax_NG" ]';
echo "\n";
echo "# Call parameters\n";
$this_url = $base_url;
$this_url = $this_url . "?";
echo "# Base URL = $base_url \n";
//
//Step 0. Extract all GET parameters
$backbone = "backbone";
$backbone_andor = 0;
$backbone_implies = 1;
$backbone_quant = 2;
$backbone_expr = 3;
$backbone_dis = 4;
$backbone_fo = 5;
$backboneParam = $_GET[$backbone];
$bbackbone = processGETParameter ($backbone);
$call_fragment = $backbone."=".$backboneParam;
echo "# GET parameter: ".$call_fragment."\n";
$this_url = $this_url . $call_fragment."&";
//
$default = "default";
$default_absent = 0;
$default_present = 1;
$defaultParam = $_GET[$default];
$bdefault = processGETParameter ($default);
$call_fragment = $default."=".$defaultParam;
echo "# GET parameter: ".$call_fragment."\n";
$this_url = $this_url . $call_fragment."&";
//
$termseq = "termseq";
$termseq_unary = 0;
$termseq_binary = 1;
$termseq_ternary_plus = 2;
$termseqParam = $_GET[$termseq];
$btermseq = processGETParameter ($termseq);
$call_fragment = $termseq."=".$termseqParam;
echo "# GET parameter: ".$call_fragment."\n";
$this_url = $this_url . $call_fragment."&";
//
$lng = "lng";
$lng_abbrev_en = 0;
$lng_long_en = 1;
//$lng_long_fr = 2;
$lngParam = $_GET[$lng];
$blng = processGETParameter ($lng);
$call_fragment = $lng."=".$lngParam;
echo "# GET parameter: ".$call_fragment."\n";
$this_url = $this_url . $call_fragment."&";
//
$propo = "propo";
$propo_uri = 0;
$propo_rulebase = 1;
$propo_entails = 2;
$propo_degree = 3;
$propo_neg = 4;
$propo_naf = 5;
$propoParam = $_GET[$propo];
$bpropo = processGETParameter ($propo);
$call_fragment = $propo."=".$propoParam;
echo "# GET parameter: ".$call_fragment."\n";
$this_url = $this_url . $call_fragment."&";
//
$implies = "implies";
$implies_equivalent = 0;
$implies_direction = 1;
$implies_material = 2;
$impliesParam = $_GET[$implies];
$bimplies = processGETParameter ($implies);
$call_fragment = $implies."=".$impliesParam;
echo "# GET parameter: ".$call_fragment."\n";
$this_url = $this_url . $call_fragment."&";
//
$terms = "terms";
$terms_oid = 0;
$terms_slot = 1;
$terms_card = 2;
$terms_weight = 3;
$terms_equal = 4;
$terms_oriented = 5;
$terms_type = 8;
$terms_data = 9;
$terms_skolem = 10;
$terms_reify = 11;
$termsParam = $_GET[$terms];
$bterms = processGETParameter ($terms);
$call_fragment = $terms."=".$termsParam;
echo "# GET parameter: ".$call_fragment."\n";
$this_url = $this_url . $call_fragment."&";
//
$quant = "quant";
$quant_closure = 0;
$quant_resl = 1;
$quant_repo = 2;
$quantParam = $_GET[$quant];
$bquant = processGETParameter ($quant);
$call_fragment = $quant."=".$quantParam;
echo "# GET parameter: ".$call_fragment."\n";
$this_url = $this_url . $call_fragment."&";
//
$expr = "expr";
$expr_val_absent = 0;
$expr_plex = 1;
$expr_val_nondefault = 2;
$expr_in = 3;
$exprParam = $_GET[$expr];
$bexpr = processGETParameter ($expr);
$call_fragment = $expr."=".$exprParam;
echo "# GET parameter: ".$call_fragment."\n";
$this_url = $this_url . $call_fragment."&";

$serialization = "serial";
$serialization_unordered = 0;
$serialization_stripeskip = 1;
$serialization_datatyping = 2;
$serialization_schemaLocation = 3;
$serializationParam = $_GET[$serialization];
$bserialization = processGETParameter ($serialization);
$call_fragment = $serialization."=".$serializationParam;
echo "# GET parameter: ".$call_fragment."\n";
$this_url = $this_url . $call_fragment."&";


echo "# Complete URL = \n";
echo "#     " . $this_url . "\n";
if ($bdefault==0){
    echo "#\n# Error: The ".$default." parameter value ".$defaultParam." is not allowed.\n";
} else {
  
  $needAndOr = extractBit($bbackbone, $backbone_andor);
  $needImp = extractBit($bbackbone, $backbone_implies);
  $needQuant = extractBit($bbackbone, $backbone_quant);
  $needExpr = extractBit($bbackbone, $backbone_expr);
  $needDis = extractBit($bbackbone, $backbone_dis);
  $needFO = extractBit($bbackbone, $backbone_fo);
  // Apparent violation of monotonicity below is caused by lack of complete orthogonalizaiton
  // Orthogonalization is possible and is perhaps worthwhile, but not implemented in 0.91 .
  // The default_required  modules are syntactictally subsumed by default_optional modules
  $needDefaultAbsentRes = extractBit($bdefault, $default_absent);
  $bdefault_present = extractBit($bdefault, $default_present);
  $needDefaultRes =  $bdefault_present * (1-$needDefaultAbsentRes);    
  $needDefaultAbsentUnRes = $needDefaultAbsentRes * $needFO;
  $bdefault_present_fo =  $bdefault_present *  $needFO;
  $needDefaultUnRes =  $bdefault_present_fo * (1-$needDefaultAbsentUnRes);  
  // As long as translation to XSD is required, we are not able to
  // orthogonalize these modules, so a selection of one module must be made.
  // It is possible to orthogonalize the modules, but the result is ugly,
  // difficult to understand, and not translatable into XSD.
  $btermseq_unary = extractBit($btermseq, $unary);
  $btermseq_binary = extractBit($btermseq, $binary);
  $btermseq_ternary_plus = extractBit($btermseq, $ternary_plus);
  $needPoly = $btermseq_ternary_plus * $btermseq_binary * $btermseq_unary;
  // This looks like a violation of monotonicity 
  // but  termseq_bin is superfluous if termseq_poly is included
  // (termseq_poly syntactically syntactically contains termseq_bin
  $needBin = extractBit($btermseq, $termseq_binary) * (1-$needPoly);
  
  $needLongNames = extractBit($blng, $lng_long_en);

  // Apparent lack of monotonicity caused by incomplete orthogonalization
  // of ordered and unordered modules, this being impossible within the Relax NG grammar.
  $needUnordered = extractBit($bserialization, $serialization_unordered);
  $needOrdered = (1-$needUnordered);
  $needStripeSkip = extractBit($bserialization, $serialization_stripeskip);
  $needDatatyping = extractBit($bserialization, $serialization_datatyping);
  $needSchemaLocation = extractBit($bserialization, $serialization_schemaLocation);

  $needURI = extractBit($bpropo, $propo_uri);
  $needRulebase = extractBit($bpropo, $propo_rulebase);
  $needEntails = extractBit($bpropo, $propo_entails);
  $needFuzzy = extractBit($bpropo, $propo_degree);
  $needNeg = extractBit($bpropo, $propo_neg);
  $needNaf = extractBit($bpropo, $propo_naf);

  $needEquiv = extractBit($bimplies, $implies_equivalent);
  $needDirND =  extractBit($bimplies, $implies_direction);
  $needDirD =  $bdefault_present;
  $needDirAtt = $needDirD + $needDirND;
  $needMatND =  extractBit($bimplies, $implies_material);
  $needMatD =  $bdefault_present;
  $needMatAtt = $needMatD + $needMatND;

  $needOid = extractBit($bterms, $terms_oid);
  $needSlot = extractBit($bterms, $terms_slot);
  $needCard = extractBit($bterms, $terms_card);
  $needWeight = extractBit($bterms, $terms_weight);
  $needEqual = extractBit($bterms, $terms_equal);
  $needOrientedND = extractBit($bterms, $terms_oriented);
  $needOrientedD = $bdefault_present * $needEqual;
  $needOrientedAtt = $needOrientedD * $needEqual + $needOrientedND;
  $needType = extractBit($bterms, $terms_type);
  $needDataTerms = extractBit($bterms, $terms_data);
  $needData = $needDataTerms + $needFuzzy;
  $needSkolem = extractBit($bterms, $terms_skolem);
  $needReify = extractBit($bterms, $terms_reify);
  $needInd = $btermseq + $needOid + $needSlot + $needEqual;

  $needVar = $needQuant + $bquant;   
  $needClosure = extractBit($bquant, $quant_closure);
  $needResl = extractBit($bquant, $quant_resl);
  $needRepo = extractBit($bquant, $quant_repo);
  
  $needValAbsent = extractBit($bexpr, $expr_val_absent);
  $needPlex = extractBit($bexpr, $expr_plex);
  $needValND = extractBit($bexpr, $expr_val_nondefault);
  $needValD = $bdefault_present * $needExpr * $needEqual;
  $needValAtt = $needValD + $needValND;
  $needInND = extractBit($bexpr, $expr_in);
  $needInD = $bdefault_present * $needExpr;
  $needInAtt = $needInD + $needInND;

  $needPerformatives = 1;
  $needAtom = 1;
  $needInit = 1;
  $needHeader = $needFuzzy + $needOid;

  //Step 1. Assemble the language foundation
  //Step 1A. Assemble the propositional language 
  // Add the start statement
    echo $start;
  // Include the root and performatives if needed
    if ($needPerformatives){    
      echo "#\n# ROOT NODE AND PERFORMATIVES INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'performative_extension_module.rnc"'."$end\n";
    }
  //Step 1B. Assemble the backbone expressivity from extension modules 
    if ($needAtom){    
      echo "#\n# ATOMIC FORMULAS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
        'atom_extension_module.rnc"'."$end\n";
    }
    if ($needAndOr){
      echo "#\n# CONJUNCTIONS AND DISJUNCTIONS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'andor_extension_module.rnc"'."$end\n";
    }
    if ($needImp){
      echo "#\n# IMPLICATIONS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'implication_extension_module.rnc"'."$end\n";
    }
    if ($needQuant){
      echo "#\n# QUANTIFICATION OVER VARIABLES INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'quantification_extension_module.rnc"'."$end\n";
    }
    if ($needExpr){
      echo "#\n# EXPRESSIONS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'expr_extension_module.rnc"'."$end\n";
    }
    if ($needDis){
      echo "#\n# DISJUNCTIONS IN CONCLUSIONS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'dis_extension_module.rnc"'."$end\n";
    }
    if ($needFO){
      echo "#\n# RESTRICTIONS ON COMPOUNDING CLASSICAL FORMULAS REMOVED \n";
      if ($needNeg){
        echo "#\n# FULL FIRST-ORDER EXPRESSIVITY IS AVAILABLE \n";
      }
      echo "#\n".'include "' . $modulesLocation .
          'folog_cl_extension_module.rnc"'."$end\n";
    }

  //Step 1C. Include the appropriate module(s) for default values present
  //         absent, or optional
  if ($needDefaultAbsentRes){
    echo "#\n# ATTRIBUTES WITH DEFAULT VALUES ARE ABSENT OR OPTIONAL\n";
    echo "#\n".'include "' . $modulesLocation .
        'default_optional_extension_module.rnc"'."$end\n";
  }
  if ($needDefaultAbsentUnRes){
      echo 'include "' . $modulesLocation .
          'default_optional_folog_extension_module.rnc"'."$end\n";
  } 
  if ($needDefaultRes) {
      echo "#\n# ATTRIBUTES WITH DEFAULT VALUES REQUIRED\n";
      echo "#\n".'include "' . $modulesLocation .
          'default_required_base_module.rnc"'."$end\n";
  }
  if ($needDefaultUnRes){
          echo 'include "' . $modulesLocation .
              'default_required_folog_base_module.rnc"'."$end\n";
  }
  //Step 1D. Determine which module to include for positional arguments
  if ($needBin){
      echo "#\n# BINARY TERM (TWO TERMS ONLY) SEQUENCES INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
        'termseq_bin_extension_module.rnc"'."$end\n";
  }
  if ($needPoly){
      echo "#\n# POLYADIC TERM (ONE OR MORE TERMS) SEQUENCES INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'termseq_poly_extension_module.rnc"'."$end\n";
  }
  //Step 3F. Include serialization modules 
    // DOCUMENTME: apparent violation of monotonicity with else clause
    //       However, ordered groups is contained in unorder groups
    //       so it is redundant.
    // Include unordered groups
    if ($needUnordered){
      echo "#\n# ORDER MODE - UNORDERED GROUPS ENABLED\n";
      echo "#\n".'include "' . $modulesLocation .
          'unordered_groups_extension_module.rnc"'."$end\n";
    }
    if ($needOrdered){
      echo "#\n# ORDER MODE - UNORDERED GROUPS DISABLED\n";
      echo "#\n".'include "' . $modulesLocation .
          'ordered_groups_extension_module.rnc"'."$end\n";
    }
    // Include stripe-skipping
    if ($needStripeSkip){
      echo "#\n# STRIPE-SKIPPING MODE ENABLED\n";
      echo "#\n".'include "' . $modulesLocation .
          'stripe_skipping_extension_module.rnc"'."$end\n";
    }
    
    // Include explicit datatyping
    if ($needDatatyping){
      echo "#\n# EXPLICIT DATATYPING ENABLED\n";
      echo "#\n".'include "' . $modulesLocation .
          'explicit_datatyping_extension_module.rnc"'."$end\n";
      echo 'include "' . $modulesLocation .
          'dataterm_simple_extension_module.rnc"'."$end\n";
      echo 'include "' . $modulesLocation .
          'data_simple_content_extension_module.rnc"'."$end\n";
    }
    // Include xsi:schemaLocation
  if ($needSchemaLocation){
      echo "#\n# xsi:schemaLocation ALLOWED IN RuleML\n";
      echo "#\n".'include "' . $modulesLocation .
          'xsi_schemalocation_extension_module.rnc"'."$end\n";
  }
  //Step 4. Mix-in optional extension modules
  //Step 4A. Include proposition-related modules 
  // Include abstract header patterns if needed
  if ($needHeader){    
    echo "#\n# ABSTRACT HEADERS INCLUDED\n";
    echo "#\n".'include "' . $modulesLocation .
      'header_extension_module.rnc"'."$end\n";
  }      
    // Include universal resource identifiers (URIs) if needed
    if ($needURI){
      echo "#\n# UNIVERSAL RESOURCE IDENTIFIERS (URIs) INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'uri_extension_module.rnc"'."$end\n";
    }
    // Include rulebases if needed
    if ($needRulebase){
      echo "#\n# RULEBASES INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'rulebase_extension_module.rnc"'."$end\n";
    }
    // Include entailments if needed
    if ($needEntails){
      echo "#\n# ENTAILMENTS (PROVES) INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'meta_extension_module.rnc"'."$end\n";
    }
    // Include degree of uncertainty if needed
    if ($needFuzzy){
      echo "#\n# DEGREE OF UNCERTAINTY INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'fuzzy_extension_module.rnc"'."$end\n";
    }
    // Include strong negations if needed
    if ($needNeg){
      echo "#\n# STRONG NEGATION INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'neg_extension_module.rnc"'."$end\n";
    }
    // Include weak negations if needed
    if ($needNaf){
      echo "#\n# WEAK NEGATIONS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'naf_extension_module.rnc"'."$end\n";
    }
  //Step 4B. Include implication-related modules 
    // Include equivalences
    if ($needEquiv){
      echo "#\n# EQUIVALENCES INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'equivalent_extension_module.rnc"'."$end\n";
    }
    // Include inference direction attribute if needed
    if ($needDirAtt){
      echo "#\n# INFERENCE DIRECTION ATTRIBUTE IS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'direction_attrib_extension_module.rnc"'."$end\n";      
    }
    // Include non-symmetric inference direction attribute value if needed
    if ($needDirND){
      echo "#\n# NON-DEFAULT VALUES OF INFERENCE DIRECTION INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
            'direction_non-default_extension_module.rnc"'."$end\n";
    }
    // Include symmetric inference direction attribute value if needed
    if ($needDirD){
      echo "#\n# DEFAULT VALUES OF INFERENCE DIRECTION INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
        'direction_default_extension_module.rnc"'."$end\n";
    }
    // Include material implication attributes if needed
    if ($needMatAtt){
      echo "#\n# MATERIAL IMPLICATION ATTRIBUTE IS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'material_attrib_extension_module.rnc"'."$end\n";      
    }
    // Include non-material implication if needed
    if ($needMatND){
      echo "#\n# NON-DEFAULT VALUES OF MATERIAL IMPLICATION INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
            'material_non-default_extension_module.rnc"'."$end\n";
    }
    // Include material implication if needed
    if ($needMatD){
      echo "#\n# DEFAULT VALUES OF MATERIAL IMPLICATION INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
        'material_default_extension_module.rnc"'."$end\n";
    }
    
  //Step 3C. Include term-related modules 
    // Include object identifiers
    if ($needOid){
      echo "#\n# OBJECT IDENTIFIERS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'desc_extension_module.rnc"'."$end\n";
    }
    // Include slots
    if ($needSlot){
      echo "#\n# SLOTS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'slot_extension_module.rnc"'."$end\n";
    }
    // Include slot cardinality
    if ($needCard){
      echo "#\n# SLOT CARDINALITY INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'card_extension_module.rnc"'."$end\n";
    }
    // Include slot weights
    if ($needWeight){
      echo "#\n# SLOT WEIGHTS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'weight_extension_module.rnc"'."$end\n";
    }
    // Include equations
    if ($needEqual){
      echo "#\n# EQUATIONS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'equal_extension_module.rnc"'."$end\n";
    }
    // Include oriented equality attribute if needed
    if ($needOrientedAtt){
      echo "#\n# ORIENTED EQUALITY ATTRIBUTE IS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
           'oriented_attrib_extension_module.rnc"'."$end\n";      
    }
    // Include symmetric equality attribute values if needed
    if ($needOrientedD){
      echo "#\n# DEFAULT VALUE OF ORIENTED EQUALITY ATTRIBUTE INCLUDED\n";
        echo "#\n".'include "' . $modulesLocation .
          'oriented_default_extension_module.rnc"'."$end\n";
      }
    // Include non-symmetric equality attribute values if needed
    if ($needOrientedND){
      echo "#\n# NON-DEFAULT VALUES OF ORIENTED EQUALITY ATTRIBUTE INCLUDED\n";
        echo "#\n".'include "' . $modulesLocation .
            'oriented_non-default_extension_module.rnc"'."$end\n";
      }
    // Include explicit typing of terms if needed
    if ($needType){
      echo "#\n# EXPLICIT TYPING OF TERMS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'type_extension_module.rnc"'."$end\n";
    }
    // Include data terms if needed
    if ($needDataTerms){
      echo "#\n# DATA TERMS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'dataterm_any_extension_module.rnc"'."$end\n";
    }
    // Include data element if needed 
    // for example, for either terms or degree of uncertainty
    if ($needData){
      echo "#\n# DATA ELEMENTS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'data_any_content_extension_module.rnc"'."$end\n";
    }
    // Include skolem constants if needed
    if ($needSkolem){
      echo "#\n# SKOLEM CONSTANTS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'skolem_extension_module.rnc"'."$end\n";
    }
    // Include reified terms if needed
    // DOCUMENTME: apparent violation of monotonicity with else clause
    //             needed for conversion to XSD with process strict
    //             In that case, monotonicity is preserved.
    if ($needReify){
      if ($needUnordered){    
        echo "#\n# REIFICATION TERMS INCLUDED, EXPLICIT CONTENT\n";
        echo "#\n".'include "' . $modulesLocation .
            'reify_extension_module.rnc"'."$end\n";
      } else {
        echo "#\n# REIFICATION TERMS INCLUDED, ANY CONTENT\n";
        echo "#\n".'include "' . $modulesLocation .
            'reify_any_extension_module.rnc"'."$end\n";      
      }      
    }
    // Include individuals if needed
    if ($needInd){
      echo "#\n# INDIVIDUAL TERMS (INTERPRETED NAMES) ARE INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'individual_extension_module.rnc"'."$end\n";      
    }
    // Include variables if needed
    if ($needVar){
      echo "#\n# VARIABLES (INTERPRETABLE NAMES) ARE INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'variable_extension_module.rnc"'."$end\n";      
    }
  //Step 3D. Include quantification-related modules if needed
    // Include implicit closure if needed
    if ($needClosure){
      echo "#\n# IMPLICIT CLOSURE INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'closure_extension_module.rnc"'."$end\n";
    }
    // Include slotted rest variables if needed
    if ($needResl){
      echo "#\n# SLOTTED REST VARIABLES INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'resl_extension_module.rnc"'."$end\n";
    }
    // Include positional rest variables if needed
    if ($needRepo){
      echo "#\n# POSITIONAL REST VARIABLES INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'repo_extension_module.rnc"'."$end\n";
    }
  //Step 3E. Include expression-related modules 
    // Include generalized lists
    if ($needPlex){
      echo "#\n# GENERALIZED LISTS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'plex_extension_module.rnc"'."$end\n";
    }

  // Include empty initialization of set-valued attribute if needed
  if ( $needValAbsent ){
      echo "#\n# SET-VALUED EXPRESSION ATTRIBUTE IS ABSENT OR OPTIONAL\n";
      echo "#\n".'include "' . $modulesLocation .
          'val_absence_extension_module.rnc"'."$end\n";
  }  
  // Include set-valued expression attribute if needed
 if ($needValAtt){
    echo "#\n# SET-VALUED EXPRESSION ATTRIBUTE IS INCLUDED\n";
    echo "#\n".'include "' . $modulesLocation .
        'val_attrib_extension_module.rnc"'."$end\n";      
  }
  // Include non-default values of set-valued expression attribute if needed
  if ($needValND){
    echo "#\n# NON-DEFAULT VALUES OF THE SET-VALUED ATTRIBUTE INCLUDED\n";
    echo "#\n".'include "' . $modulesLocation .
        'val_non-default_extension_module.rnc"'."$end\n";
  }
  // Include default values of set-valued expression attribute if needed
  if ($needValD){
    echo "#\n# DEFAULT VALUE OF THE SET-VALUED ATTRIBUTE INCLUDED\n";
    echo "#\n".'include "' . $modulesLocation .
      'val_default_extension_module.rnc"'."$end\n";
  }
  // Include interpreted expression attribute if needed
  if ($needInAtt){
    echo "#\n# INTERPRETED EXPRESSION ATTRIBUTE IS INCLUDED\n";
    echo "#\n".'include "' . $modulesLocation .
        'in_attrib_extension_module.rnc"'."$end\n";      
  }  
  // Include non-default values of interpretation of expressions if needed
  if ($needInND){
    echo "#\n# NON-DEFAULT VALUES OF EXPRESSION INTERPRETATION INCLUDED\n";
    echo "#\n".'include "' . $modulesLocation .
        'in_non-default_extension_module.rnc"'."$end\n";
  }
  // Include default values of interpretation of expressions if needed
  if ($needInD){
    echo "#\n# DEFAULT VALUE OF EXPRESSION INTERPRETATION INCLUDED\n";
    echo "#\n".'include "' . $modulesLocation .
      'in_default_extension_module.rnc"'."$end\n";
  }
  //Step 4A. Translate to requested xs:lang
  // FIXME: need to handle differently when more than one alternate available
  //        or simulataneous alternate element names allowed
  if ($blng){
    // Include long English element names
    if ($needLongNames){
      echo "#\n# LONG ENGLISH ELEMENT NAMES\n";
      echo "#\n".'include "' . $modulesLocation .
          'long_name_base_module.rnc"'."$end\n";
      // this second module is separated out because of a short-coming in trang
      // where element xyz{notAllowed} is not simplified to notAllowed
      // with the result that we cannot rename abstract elements if
      // we want to be able to generate XSD or monolithic content-models    
      if ($needRepo){
        echo "#\n".'include "' . $modulesLocation .
            'long_name_repo_base_module.rnc"'."$end\n";      
      }
      if ($needResl){
        echo "#\n".'include "' . $modulesLocation .
            'long_name_resl_base_module.rnc"'."$end\n";
      }
    }
  }
  //Step 4B. Initialize abstract patterns
    if ($needInit){
      echo "#\n# INITIALIZATION MODULES INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'init_extension_module.rnc"'."$end\n";
    }

}
//Functions
function processGETParameter ($paramName){
  $param_base_default = "x";
  $bparam_default = decbin(hexdec(fff));
  $param = $_GET[$paramName];
  //echo("#\n#  The ".$paramName." parameter has length ".strlen($param)."\n");
  if (strlen($param)>0){
    $param_base = substr($param,0,1);
  } else {
    $param_base = $param_base_default;
  }
  if (preg_match('/x|0/',$param_base)){
    //echo("#  The ".$paramName." parameter base is ".$param_base."\n");
    if (strcmp($param_base, 'x')==0){
      $xparam = substr($param,1);
      //echo("# The ".$paramName." parameter was provided in hexadecimal");
      //echo(" as ".$xparam);
      //echo(".\n");
      if (ctype_xdigit($xparam)) {
        $bparam = decbin(hexdec($xparam));
      } else {
        echo "#\n# Error: The string $xparam does not consist of all".
             "hexadecimal digits.\n";
        echo "# Default (supremum) ".$paramName." parameter is assumed.\n";
        $bparam = $bparam_default;
      }
    } elseif (strcmp($param_base, '0')==0){
      $bparam = $bparam_default;
    }
  } else {
    echo "<#\n# Error: The ".$paramName." parameter ".$param." is not a".
         " hexidecimal or blank string.\n";
    echo "# Default (supremum) ".$paramName." parameter is assumed.\n";
    $bparam = $bparam_default;
  }
  //echo("#\n# The ".$paramName." parameter is ".$bparam." in binary.\n");
  return $bparam;
}

function extractBit ($bparam, $bitIndex) {
  if (strlen($bparam)>$bitIndex) {
    $bparamBit =  (boolean) (substr($bparam, -1-$bitIndex, 1)==1);
  } else {
    $bparamBit = false;
  }
  return $bparamBit;
}
?>