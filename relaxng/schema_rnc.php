<?php
ini_set('display_errors', 'On');
error_reporting(E_ALL | E_STRICT);
header('Content-Description: File Transfer');
header('Content-type: application/relax-ng-compact-syntax; charset=utf-8');
//Assembler of RNC schema for RuleML 1.02
//
//Step 0000. Extract all GET parameters
$backbone = "backbone";
$backbone_andor = 0;
$backbone_implies = 1;
$backbone_quant = 2;
$backbone_expr = 3;
$backbone_dis = 4;
$backbone_fo = 5;
$bbackbone = processGETParameter ($backbone);
$backboneParam = "x".dechex(bindec($bbackbone));
//
$default = "default";
$default_absent = 0;
$default_present = 1;
$default_absent_fo = 2;
$bdefault = processGETParameter ($default);
$defaultParam = "x".dechex(bindec($bdefault));
//
$termseq = "termseq";
$termseq_unary = 0;
$termseq_binary = 1;
$termseq_ternary_plus = 2;
$btermseq = processGETParameter ($termseq);
$termseqParam = "x".dechex(bindec($btermseq));
//
$lng = "lng";
$lng_abbrev_en = 0;
$lng_long_en = 1;
//$lng_long_fr = 2;
$blng = processGETParameter ($lng);
$lngParam = "x".dechex(bindec($blng));
//
$propo = "propo";
$propo_iri = 0;
$propo_rulebase = 1;
$propo_entails = 2;
$propo_degree = 3;
$propo_neg = 4;
$propo_naf = 5;
$propo_node = 6;
$propo_meta = 7;
$propo_xmlbase = 8;
$propo_xmlid = 9;
$bpropo = processGETParameter ($propo);
$propoParam = "x".dechex(bindec($bpropo));
//
$implies = "implies";
$implies_equivalent = 0;
$implies_direction = 1;
$implies_material = 2;
$implies_and = 3;
$implies_nc = 4;
$implies_or = 5;
$implies_ex = 6;
$bimplies = processGETParameter ($implies);
$impliesParam = "x".dechex(bindec($bimplies));
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
$terms_var = 12;
$bterms = processGETParameter ($terms);
$termsParam = "x".dechex(bindec($bterms));
//
$quant = "quant";
$quant_closure = 0;
$quant_resl = 1;
$quant_repo = 2;
$bquant = processGETParameter ($quant);
$quantParam = "x".dechex(bindec($bquant));
//
$expr = "expr";
$expr_val_absent = 0;
$expr_plex = 1;
$expr_val_nondefault = 2;
$expr_in = 3;
$bexpr = processGETParameter ($expr);
$exprParam = "x".dechex(bindec($bexpr));
//
$serialization = "serial";
$serialization_unordered = 0;
$serialization_stripeskip = 1;
$serialization_datatyping = 2;
$serialization_schemaLocation = 3;
$serialization_pivot = 4;
$serialization_absolute = 5;
$bserialization = processGETParameter ($serialization);
$serializationParam = "x".dechex(bindec($bserialization));

// Step 000. Initialize some parameters
$rnc_filename = 'myng';
$rnc_filename = $rnc_filename.'-b'.substr($backboneParam, 1);
$rnc_filename = $rnc_filename.'-d'.substr($defaultParam, 1);
$rnc_filename = $rnc_filename.'-a'.substr($termseqParam, 1);
$rnc_filename = $rnc_filename.'-l'.substr($lngParam, 1);
$rnc_filename = $rnc_filename.'-p'.substr($propoParam, 1);
$rnc_filename = $rnc_filename.'-i'.substr($impliesParam, 1);
$rnc_filename = $rnc_filename.'-t'.substr($termsParam, 1);
$rnc_filename = $rnc_filename.'-q'.substr($quantParam, 1);
$rnc_filename = $rnc_filename.'-e'.substr($exprParam, 1);
$rnc_filename = $rnc_filename.'-s'.substr($serializationParam, 1);
$rnc_filename = $rnc_filename.'.rnc';
header('Content-Disposition: attachment; filename="'.basename($rnc_filename).'"');
$start = ' start = Node.choice | edge.choice'."\n";
$end = ' inherit = ruleml {start |= notAllowed}';
$base_url = "http://deliberation.ruleml.org/1.02/relaxng/schema_rnc.php";
$now =  date(DATE_ATOM,time());

//
// Step 00. Document the GET parameters and construct the URL
$this_url = $base_url;
$this_url = $this_url . "?";
$call_fragment = $backbone."=".$backboneParam;
echo "# Call parameters\n";
echo "# GET parameter: ".$call_fragment."\n";
$this_url = $this_url . $call_fragment."&";
$call_fragment = $default."=".$defaultParam;
echo "# GET parameter: ".$call_fragment."\n";
$this_url = $this_url . $call_fragment."&";
$call_fragment = $termseq."=".$termseqParam;
echo "# GET parameter: ".$call_fragment."\n";
$this_url = $this_url . $call_fragment."&";
$call_fragment = $lng."=".$lngParam;
echo "# GET parameter: ".$call_fragment."\n";
$this_url = $this_url . $call_fragment."&";
$call_fragment = $propo."=".$propoParam;
echo "# GET parameter: ".$call_fragment."\n";
$this_url = $this_url . $call_fragment."&";
$call_fragment = $implies."=".$impliesParam;
echo "# GET parameter: ".$call_fragment."\n";
$this_url = $this_url . $call_fragment."&";
$call_fragment = $terms."=".$termsParam;
echo "# GET parameter: ".$call_fragment."\n";
$this_url = $this_url . $call_fragment."&";
$call_fragment = $quant."=".$quantParam;
echo "# GET parameter: ".$call_fragment."\n";
$this_url = $this_url . $call_fragment."&";
$call_fragment = $expr."=".$exprParam;
echo "# GET parameter: ".$call_fragment."\n";
$this_url = $this_url . $call_fragment."&";
$call_fragment = $serialization."=".$serializationParam;
echo "# GET parameter: ".$call_fragment."\n";
$this_url = $this_url . $call_fragment;



//Step 00. Write the header
echo 'namespace dc = "http://purl.org/dc/elements/1.1/"'."\n";
echo 'namespace dcterms = "http://purl.org/dc/terms/"'."\n";
echo 'namespace ruleml = "http://ruleml.org/spec"'."\n";
echo "\n";
echo 'dc:title [ "Deliberation RuleML Custom-Built Schema" ]'."\n";
echo 'dc:version [ "1.02" ]'."\n";
echo 'dc:creator [ "Tara Athan (taraathan AT gmail.com)" ]'."\n";
echo 'dc:subject [ "Deliberation RuleML, custom-built" ]'."\n";
echo 'dc:description ['."\n";
echo '    "custom-built main module for a Deliberation RuleML sublanguage."'."\n";
echo ']'."\n";
echo 'dc:date [ "';
echo($now);
echo '" ]'."\n";
echo 'dc:language [ "en" ]'."\n";
echo 'dcterms:rights [ "TBD" ]'."\n";
echo 'dc:relation [ "http://deliberation.ruleml.org/1.02" ]'."\n";
echo "# Base URL = $base_url \n";


echo "# Complete URL = \n";
echo "#     " . $this_url . "\n";
if ($bdefault==0){
    echo "#\n# Error: The ".$default." parameter value ".$defaultParam." is not allowed.\n";
} else {
  
  $enableAndOr = extractBit($bbackbone, $backbone_andor);
  $enableImp = extractBit($bbackbone, $backbone_implies);
  $enableQuant = extractBit($bbackbone, $backbone_quant);
  $enableExpr = extractBit($bbackbone, $backbone_expr);
  // Disjunctive Heads are now indicated from the implication options facets.
  // However, we also honor the backbone code for dishornlog for backward compatibility
  $enableDis = max(extractBit($bbackbone, $backbone_dis) , extractBit($bimplies, $implies_or));
  $enableFO = extractBit($bbackbone, $backbone_fo);
  
  $enableDefaultAbsent = extractBit($bdefault, $default_absent); 
  $enableDefaultPresent = extractBit($bdefault, $default_present);
  $enableDefaultAbsentFO = extractBit($bdefault, $default_absent_fo);

  $enableTermseq_unary = extractBit($btermseq, $termseq_unary);
  $enableTermseq_binary = extractBit($btermseq, $termseq_binary);
  $enableTermseq_ternary_plus = extractBit($btermseq, $termseq_ternary_plus);
  $NeedPoly = $enableTermseq_ternary_plus * $enableTermseq_binary * $enableTermseq_unary;
  
  // Apparent lack of monotonicity caused by incomplete orthogonalization
  // of modules for binary and polyadic positional term sequences.
  // Orthogonalization is possible but awkward, leading to complex and unreadable grammar rules.
  $NeedUnBin = $enableTermseq_unary * $enableTermseq_binary * (1-$NeedPoly);
  $NeedBin = $enableTermseq_binary * (1-$NeedUnBin) * (1-$NeedPoly);
  $NeedUn  = $enableTermseq_unary  * (1-$NeedUnBin) * (1-$NeedPoly);
  
  $enableLongNames = extractBit($blng, $lng_long_en);

  // Apparent lack of monotonicity caused by incomplete orthogonalization
  // of modules for ordered and unordered groups.
  // Orthogonalization is possible but awkward, leading to complex and unreadable grammar rules.
  $enableUnordered = extractBit($bserialization, $serialization_unordered);
  $NeedOrdered = (1-$enableUnordered);
  
  $enabletripeSkip = extractBit($bserialization, $serialization_stripeskip);
  $enableDatatyping = extractBit($bserialization, $serialization_datatyping);
  $enableSchemaLocation = extractBit($bserialization, $serialization_schemaLocation);
  $enableAbsolute = extractBit($bserialization, $serialization_absolute);
  // The pivot bit is monotonic in the other direction.
  $notPivot = 1-extractBit($bserialization, $serialization_pivot);

  $NeedIRI = extractBit($bpropo, $propo_iri);
  $NeedRulebase = extractBit($bpropo, $propo_rulebase);
  $NeedEntails = extractBit($bpropo, $propo_entails);
  $NeedFuzzy = extractBit($bpropo, $propo_degree);
  $NeedNeg = extractBit($bpropo, $propo_neg);
  $needNaf = extractBit($bpropo, $propo_naf);
  $NeedNode = extractBit($bpropo, $propo_node);
  $NeedMeta = extractBit($bpropo, $propo_meta);
  $NeedBase = extractBit($bpropo, $propo_xmlbase);
  $NeedId = extractBit($bpropo, $propo_xmlid);
  $NeedWeb = max($NeedIRI, $NeedNode);

  $needEquiv = extractBit($bimplies, $implies_equivalent);
  $needDirND =  extractBit($bimplies, $implies_direction);
  $needDirD =  $enableDefaultPresent;
  $needDirAtt = max($needDirD , $needDirND);
  $needMatND =  extractBit($bimplies, $implies_material);
  $needMatD =  $enableDefaultPresent;
  $needMatAtt = max($needMatD , $needMatND);
  
  
  $enableExHead = extractBit($bimplies, $implies_ex);
  $enableAndHead = extractBit($bimplies, $implies_and);
  $enableNegConstraint = extractBit($bimplies, $implies_nc);
  //Apparent lack of monotonicity caused by containment of the
  // existential head module within the implementation of FOL.
  //Including the existential head module would be redundant in FOL.
  // Similar considerations hold for negative constraints.
  $NeedExHeadModule = $enableExHead*(1-$enableFO);
  $NeedNegConstraintModule = $enableNegConstraint*(1-$enableDis);
  // Apparent lack of monotonicity caused by the refactoring of head content model
  // in order to achieving maximal stripe-skipping for if-then edges
  // A language is considered a "plus" language if
  //  * it requires the existential head module OR
  //  * it requires the negative constraint module OR
  //  * it requires the conjunctive head feature, or the disjunctive logic feature but not both
  //  * AND it is not FO expressive
  // The "plus" languages are the ones where skipping if-then stripes is not possible in XSD.
  $plus = max($NeedExHeadModule, $NeedNegConstraintModule, $enableAndHead*(1 - $enableDis), $enableDis*(1 - $enableAndHead)) * (1- $enableFO);
  $notPlus = 1 - $plus;
  // The conjunctive head module is needed if the conjunctive head feature is needed
  // and the language is a plus language..
  $NeedConModule = $enableAndHead*$plus;
  // The disjunctive head module is needed if the disjunctive head feature is needed
  // and the language is a plus language.
  $NeedOrHead = $enableDis*$plus;
  // The dis-conjunctive logic module is needed if the disjunctive head feature is enabled
  // AND the conjunctive head feature is enabled
  // AND the expressivity is not first-order.
  // AND the language is not a plus language.
  $NeedDisCon = $enableDis * $enableAndHead * $notPlus * (1-$enableFO);
  
  $enableOid = extractBit($bterms, $terms_oid);
  // FIXME continute refactoring to distinguish between the variables directly extracted from
  // a call to extractBit ($enable...), those that are used to include a particular module ($Need => $need)
  // and those that are intermediate ($need => $flag)
  // In those cases when the $enable variable is used directly to include a module, add an assignment.
  $needSlot = extractBit($bterms, $terms_slot);
  $needCard = extractBit($bterms, $terms_card);
  $needWeight = extractBit($bterms, $terms_weight);
  $needEqualBi = extractBit($bterms, $terms_equal);
  $needOrientedND = extractBit($bterms, $terms_oriented);
  $needEqual = max($needEqualBi, $needOrientedND);
  $needOrientedAtt = max($needOrientedND, $enableDefaultPresent) * $needEqual;
  $needOrientedD = $enableDefaultPresent * $needEqualBi;
  $needType = extractBit($bterms, $terms_type);
  $needDataTerms = extractBit($bterms, $terms_data);
  $needData = max($needDataTerms , $NeedFuzzy);
  $needSkolem = extractBit($bterms, $terms_skolem);
  $needReify = extractBit($bterms, $terms_reify);
  $needInd = max($btermseq , $enableOid , $needSlot , $needEqual);

  $needVar = max($enableQuant , extractBit($bterms, $terms_var));   
  $needClosure = extractBit($bquant, $quant_closure);
  $needResl = extractBit($bquant, $quant_resl);
  $enableRepo = extractBit($bquant, $quant_repo);
  
  $enableValAbsent = extractBit($bexpr, $expr_val_absent);
  $enablePlex = extractBit($bexpr, $expr_plex);
  $enableValND = extractBit($bexpr, $expr_val_nondefault);
  $needValD = $enableDefaultPresent * $enableExpr * $needEqual;
  $needValAtt = max($needValD , $enableValND);
  $enableInND = extractBit($bexpr, $expr_in);
  $needInD = $enableDefaultPresent * $enableExpr;
  $needInAtt = max($needInD , $enableInND);

  $NeedPerformatives = 1;
  $NeedAtom = 1;
  $needInit = 1;
  
  $needDefaultPresent =  max($enableDefaultPresent , $needDirND , $needMatND , $enableInND , $enableValND , $needOrientedND);    
  $needDefaultPresentFO = $needDefaultPresent * $enableFO;
  
  $NeedIfThenSkippable = max( $notPivot, $notPlus ); 

  //Step 1. Assemble the language foundation
  if ($enableAbsolute) {
    $schemaLocation='http://deliberation.ruleml.org/1.02/relaxng/';  
  } else {
    $schemaLocation='';
  }
  $modulesLocation = $schemaLocation . 'modules/';

  //Step 1A. Assemble the propositional language 
  // Add the start statement
    echo $start;
  // Include the root and performatives if needed
    if ($NeedPerformatives) {    
      echo "#\n# ROOT NODE AND PERFORMATIVES INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .'performative_expansion_module.rnc"'."$end\n";
      echo "#\n".'include "' . $modulesLocation .'performative_content_expansion_module.rnc"'."$end\n";
    }
  //Step 1B. Assemble the backbone expressivity from expansion modules 
    if ($NeedAtom){    
      echo "#\n# ATOMIC FORMULAS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
        'atom_expansion_module.rnc"'."$end\n";
    }
    if ($enableAndOr){
      echo "#\n# CONJUNCTIONS AND DISJUNCTIONS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'andor_expansion_module.rnc"'."$end\n";
    }
    if ($enableImp){
      echo "#\n# IMPLICATIONS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'implication_expansion_module.rnc"'."$end\n";
    }
    if ($enableQuant){
      echo "#\n# QUANTIFICATION OVER VARIABLES INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'quantification_expansion_module.rnc"'."$end\n";
    }
    if ($enableExpr){
      echo "#\n# EXPRESSIONS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'expr_expansion_module.rnc"'."$end\n";
    }
    if ($NeedOrHead){
      echo "#\n# DISJUNCTIONS IN CONCLUSIONS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'disjunctive_head_expansion_module.rnc"'."$end\n";
    }
    if ($NeedDisCon){
      echo "#\n# DIS- AND CON-JUNCTIONS IN CONCLUSIONS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'discon_expansion_module.rnc"'."$end\n";
    }
    if ($enableFO){
      echo "#\n# RESTRICTIONS ON COMPOUNDING CLASSICAL FORMULAS REMOVED \n";
      if ($NeedNeg){
        echo "#   FULL FIRST-ORDER EXPRESSIVITY (INCLUDING NEGATION) IS AVAILABLE \n";
      }
      echo "#\n".'include "' . $modulesLocation .
          'folog_cl_expansion_module.rnc"'."$end\n";
    }

  //Step 1C. Include the appropriate module(s) for default values present
  //         absent, or optional
  echo "#\n# ATTRIBUTES WITH DEFAULT VALUES ARE INITIALIZED\n";
  echo "#\n".'include "' . $modulesLocation .
      'default_inf_expansion_module.rnc"'."$end\n";
  if ($enableDefaultAbsent){
    echo "#\n# ATTRIBUTES WITH DEFAULT VALUES ARE ABSENT OR OPTIONAL\n";
    echo "#\n".'include "' . $modulesLocation .
        'default_absent_expansion_module.rnc"'."$end\n";
  }
  if ($enableDefaultAbsentFO){
      echo 'include "' . $modulesLocation .
          'default_absent_folog_expansion_module.rnc"'."$end\n";
  } 
  if ($needDefaultPresent) {
      echo "#\n# ATTRIBUTES WITH DEFAULT VALUES REQUIRED\n";
      echo "#\n".'include "' . $modulesLocation .
          'default_present_expansion_module.rnc"'."$end\n";
  }
  if ($needDefaultPresentFO){
          echo 'include "' . $modulesLocation .
              'default_present_folog_expansion_module.rnc"'."$end\n";
  }
  //Step 1D. Determine which module to include for positional arguments 
  if ($NeedUn){
      echo "#\n# UNARY TERM (ONE TERM ONLY) SEQUENCES INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
        'termseq_un_expansion_module.rnc"'."$end\n";
  }
  if ($NeedBin){
      echo "#\n# BINARY TERM (TWO TERMS ONLY) SEQUENCES INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
        'termseq_bin_expansion_module.rnc"'."$end\n";
  }
  if ($NeedUnBin){
      echo "#\n# UNARY AND BINARY TERM (TWO TERMS ONLY) SEQUENCES INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
        'termseq_unbin_expansion_module.rnc"'."$end\n";
  }
  if ($NeedPoly){
      echo "#\n# POLYADIC TERM (ONE OR MORE TERMS) SEQUENCES INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'termseq_poly_expansion_module.rnc"'."$end\n";
  }
  //Step 3F. Include serialization modules 
    // Apparent violation of monotonicity with else clause
    //       However, ordered groups is contained in unorder groups
    //       so it is redundant.
    // Include unordered groups
    if ($enableUnordered){
      echo "#\n# ORDER MODE - UNORDERED GROUPS ENABLED\n";
    // Apparent violation of monotonicity with else clause
    //       However, unordered deterministic groups is contained in unordered groups
    //       so it is redundant.
      if ($notPivot){
         echo "#\n".'include "' . $modulesLocation .
            'unordered_groups_expansion_module.rnc"'."$end\n";
      }  
      else {
         echo "#\n".'include "' . $modulesLocation .
            'unordered_deterministic_groups_expansion_module.rnc"'."$end\n";
      }  
    }
    if ($NeedOrdered){
      echo "#\n# ORDER MODE - UNORDERED GROUPS DISABLED\n";
      echo "#\n".'include "' . $modulesLocation .
          'ordered_groups_expansion_module.rnc"'."$end\n";
    }
    // Include stripe-skipping
    if ($enabletripeSkip){
      echo "#\n# SYNCHRONOUS STRIPE-SKIPPING MODE ENABLED\n";
      echo "#\n".'include "' . $modulesLocation .
          'stripe_skipping_expansion_module.rnc"'."$end\n";
      if ($NeedIfThenSkippable){    
        echo "#\n# SYNCHRONOUS IF-THEN STRIPE-SKIPPING MODE ENABLED\n";
        echo "#\n".'include "' . $modulesLocation .
            'stripe_skipping_ifthen_expansion_module.rnc"'."$end\n";
       }
      if ($notPivot){ 
      // not included when converting to XSD
      echo "#\n# ASYNCHRONOUS STRIPE-SKIPPING MODE ENABLED\n";
      echo "#\n".'include "' . $modulesLocation .
          'asynchronous_stripe_skipping_entailment_expansion_module.rnc"'."$end\n";
      echo "#\n".'include "' . $modulesLocation .
          'asynchronous_stripe_skipping_implication_expansion_module.rnc"'."$end\n";
      }
    }
    
    // Include explicit datatyping
    if ($enableDatatyping){
      echo "#\n# EXPLICIT DATATYPING ENABLED\n";
      echo "#\n".'include "' . $modulesLocation .
          'explicit_datatyping_expansion_module.rnc"'."$end\n";
      echo 'include "' . $modulesLocation .
          'dataterm_simple_expansion_module.rnc"'."$end\n";
      echo 'include "' . $modulesLocation .
          'data_simple_content_expansion_module.rnc"'."$end\n";
    }
    // Include xsi:schemaLocation
  if ($enableSchemaLocation){
      echo "#\n# xsi:schemaLocation ALLOWED IN RuleML\n";
      echo "#\n".'include "' . $modulesLocation .
          'xsi_schemalocation_expansion_module.rnc"'."$end\n";
  }
  //Step 4. Mix-in optional expansion modules
  //Step 4A. Include proposition-related modules
    // Include datatypes for webized references (IRIs and/or CURIEs) if needed
    if ($NeedWeb){
      echo "#\n# WEB REFERENCES INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'web_expansion_module.rnc"'."$end\n";
    }
    // Include universal resource identifiers (URIs) if needed
    if ($NeedIRI){
      echo "#\n# INTERNATIONALIZED RESOURCE IDENTIFIERS (IRIs) INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'iri_expansion_module.rnc"'."$end\n";
    }
    // Include rulebases if needed
    if ($NeedRulebase){
      echo "#\n# RULEBASES INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'rulebase_expansion_module.rnc"'."$end\n";
    }
    // Include entailments if needed
    if ($NeedEntails){
      echo "#\n# ENTAILMENTS (PROVES) INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'metalevel_expansion_module.rnc"'."$end\n";
    }
    // Include degree of uncertainty if needed
    if ($NeedFuzzy){
      echo "#\n# DEGREE OF UNCERTAINTY INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'fuzzy_expansion_module.rnc"'."$end\n";
    }
    // Include strong negations if needed
    if ($NeedNeg){
      echo "#\n# STRONG NEGATION INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'neg_expansion_module.rnc"'."$end\n";
    }
    // Include weak negations if needed
    if ($needNaf){
      echo "#\n# WEAK NEGATIONS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'naf_expansion_module.rnc"'."$end\n";
    }
    // Include node identifiers if needed
    if ($NeedNode){
      echo "#\n# NODE IDENTIFIERS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'node_attribute_expansion_module.rnc"'."$end\n";
    }
    // Include in-place annotations if needed
    if ($NeedMeta){
      echo "#\n# IN-PLACE ANNOTATIONS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'meta_expansion_module.rnc"'."$end\n";
    }
    // Include XML base attribute if needed
    if ($NeedBase){
      echo "#\n# XML BASE ATTRIBUTE INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'xml_base_expansion_module.rnc"'."$end\n";
    }
    // Include XML id attribute if needed
    if ($NeedId){
      echo "#\n# XML ID ATTRIBUTE INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'xml_id_expansion_module.rnc"'."$end\n";
    }
  //Step 4B. Include implication-related modules 
    // Include equivalences
    if ($needEquiv){
      echo "#\n# EQUIVALENCES INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'equivalent_expansion_module.rnc"'."$end\n";
    }
    // Include inference direction attribute if needed
    if ($needDirAtt){
      echo "#\n# INFERENCE DIRECTION ATTRIBUTE IS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'direction_attrib_expansion_module.rnc"'."$end\n";      
      echo "#\n".'include "' . $modulesLocation .
          'mapdirection_attrib_expansion_module.rnc"'."$end\n";      
    }
    // Include non-symmetric inference direction attribute value if needed
    if ($needDirND){
      echo "#\n# NON-DEFAULT VALUES OF INFERENCE DIRECTION INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
            'direction_non-default_expansion_module.rnc"'."$end\n";
    }
    // Include symmetric inference direction attribute value if needed
    if ($needDirD){
      echo "#\n# DEFAULT VALUES OF INFERENCE DIRECTION INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
        'direction_default_expansion_module.rnc"'."$end\n";
    }
    // Include material implication attributes if needed
    if ($needMatAtt){
      echo "#\n# MATERIAL IMPLICATION ATTRIBUTE IS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'material_attrib_expansion_module.rnc"'."$end\n";      
      echo "#\n".'include "' . $modulesLocation .
          'mapmaterial_attrib_expansion_module.rnc"'."$end\n";      
    }
    // Include non-material implication if needed
    if ($needMatND){
      echo "#\n# NON-DEFAULT VALUES OF MATERIAL IMPLICATION INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
            'material_non-default_expansion_module.rnc"'."$end\n";
    }
    // Include material implication if needed
    if ($needMatD){
      echo "#\n# DEFAULT VALUES OF MATERIAL IMPLICATION INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
        'material_default_expansion_module.rnc"'."$end\n";
    }
    // Include existential heads in implications if needed
    if ($NeedExHeadModule){
      echo "#\n# EXISTENTIAL HEADS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'existential_head_expansion_module.rnc"'."$end\n";
    }    
    // Include negative constraints if needed
    if ($NeedNegConstraintModule){
      echo "#\n# NEGATIVE CONSTRAINTS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'negative_constraint_expansion_module.rnc"'."$end\n";
    }
    // Include conjunctive heads in implications if needed
    if ($NeedConModule){
      echo "#\n# CONJUNCTIVE HEADS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'conjunctive_head_expansion_module.rnc"'."$end\n";
    }
    
  //Step 3C. Include term-related modules 
    // Include object identifiers
    if ($enableOid){
      echo "#\n# OBJECT IDENTIFIERS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'oid_expansion_module.rnc"'."$end\n";
    }
    // Include slots
    if ($needSlot){
      echo "#\n# SLOTS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'slot_expansion_module.rnc"'."$end\n";
    }
    // Include slot cardinality
    if ($needCard){
      echo "#\n# SLOT CARDINALITY INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'card_expansion_module.rnc"'."$end\n";
    }
    // Include slot weights
    if ($needWeight){
      echo "#\n# SLOT WEIGHTS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'weight_expansion_module.rnc"'."$end\n";
    }
    // Include equations
    if ($needEqual){
      echo "#\n# EQUATIONS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'equal_expansion_module.rnc"'."$end\n";
    }
    // Include oriented equality attribute if needed
    if ($needOrientedAtt){
      echo "#\n# ORIENTED EQUALITY ATTRIBUTE IS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
           'oriented_attrib_expansion_module.rnc"'."$end\n";      
    }
    // Include non-symmetric equality attribute values if needed
    if ($needOrientedND){
      echo "#\n# NON-DEFAULT VALUES OF ORIENTED EQUALITY ATTRIBUTE INCLUDED\n";
        echo "#\n".'include "' . $modulesLocation .
            'oriented_non-default_expansion_module.rnc"'."$end\n";
      }
    // Include symmetric equality attribute values if needed
    if ($needOrientedD){
      echo "#\n# DEFAULT VALUE OF ORIENTED EQUALITY ATTRIBUTE INCLUDED\n";
        echo "#\n".'include "' . $modulesLocation .
          'oriented_default_expansion_module.rnc"'."$end\n";
      }
    // Include explicit typing of terms if needed
    if ($needType){
      echo "#\n# EXPLICIT TYPING OF TERMS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'type_expansion_module.rnc"'."$end\n";
    }
    // Include data terms if needed
    if ($needDataTerms){
      echo "#\n# DATA TERMS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'dataterm_any_expansion_module.rnc"'."$end\n";
    }
    // Include data element if needed 
    // for example, for either terms or degree of uncertainty
    if ($needData){
      echo "#\n# DATA ELEMENTS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'data_any_content_expansion_module.rnc"'."$end\n";
    }
    // Include skolem constants if needed
    if ($needSkolem){
      echo "#\n# SKOLEM CONSTANTS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'skolem_expansion_module.rnc"'."$end\n";
    }
    // Include reified terms if needed
    // DOCUMENTME: apparent violation of monotonicity with else clause
    //             needed for conversion to XSD with process strict
    //             In that case, monotonicity is preserved.
    if ($needReify){
      if ($notPivot){    
        echo "#\n# REIFICATION TERMS INCLUDED, EXPLICIT CONTENT\n";
        echo "#\n".'include "' . $modulesLocation .
            'reify_expansion_module.rnc"'."$end\n";
      } else {
        // just for conversion to XSD
        echo "#\n# REIFICATION TERMS INCLUDED, ANY CONTENT\n";
        echo "#\n".'include "' . $modulesLocation .
            'reify_any_expansion_module.rnc"'."$end\n";      
      }      
    }
    // Include individuals if needed
    if ($needInd){
      echo "#\n# INDIVIDUAL TERMS (INTERPRETED NAMES) ARE INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'individual_expansion_module.rnc"'."$end\n";      
    }
    // Include variables if needed
    if ($needVar){
      echo "#\n# VARIABLES (INTERPRETABLE NAMES) ARE INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'variable_expansion_module.rnc"'."$end\n";      
    }
  //Step 3D. Include quantification-related modules if needed
    // Include implicit closure if needed
    if ($needClosure){
      echo "#\n# IMPLICIT CLOSURE INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'closure_expansion_module.rnc"'."$end\n";
      echo "#\n".'include "' . $modulesLocation .
          'mapclosure_expansion_module.rnc"'."$end\n";
    }
    // Include slotted rest variables if needed
    if ($needResl){
      echo "#\n# SLOTTED REST VARIABLES INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'resl_expansion_module.rnc"'."$end\n";
    }
    // Include positional rest variables if needed
    if ($enableRepo){
      echo "#\n# POSITIONAL REST VARIABLES INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'repo_expansion_module.rnc"'."$end\n";
    }
  //Step 3E. Include expression-related modules 
    // Include generalized lists
    if ($enablePlex){
      echo "#\n# GENERALIZED LISTS INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'plex_expansion_module.rnc"'."$end\n";
    }

  // Include empty initialization of set-valued attribute if needed
  if ( $enableValAbsent ){
      echo "#\n# SET-VALUED EXPRESSION ATTRIBUTE IS ABSENT OR OPTIONAL\n";
      echo "#\n".'include "' . $modulesLocation .
          'val_absence_expansion_module.rnc"'."$end\n";
  }  
  // Include set-valued expression attribute if needed
 if ($needValAtt){
    echo "#\n# SET-VALUED EXPRESSION ATTRIBUTE IS INCLUDED\n";
    echo "#\n".'include "' . $modulesLocation .
        'val_attrib_expansion_module.rnc"'."$end\n";      
  }
  // Include non-default values of set-valued expression attribute if needed
  if ($enableValND){
    echo "#\n# NON-DEFAULT VALUES OF THE SET-VALUED ATTRIBUTE INCLUDED\n";
    echo "#\n".'include "' . $modulesLocation .
        'val_non-default_expansion_module.rnc"'."$end\n";
  }
  // Include default values of set-valued expression attribute if needed
  if ($needValD){
    echo "#\n# DEFAULT VALUE OF THE SET-VALUED ATTRIBUTE INCLUDED\n";
    echo "#\n".'include "' . $modulesLocation .
      'val_default_expansion_module.rnc"'."$end\n";
  }
  // Include interpreted expression attribute if needed
  if ($needInAtt){
    echo "#\n# INTERPRETED EXPRESSION ATTRIBUTE IS INCLUDED\n";
    echo "#\n".'include "' . $modulesLocation .
        'per_attrib_expansion_module.rnc"'."$end\n";      
  }  
  // Include non-default values of interpretation of expressions if needed
  if ($enableInND){
    echo "#\n# NON-DEFAULT VALUES OF EXPRESSION INTERPRETATION INCLUDED\n";
    echo "#\n".'include "' . $modulesLocation .
        'per_non-default_expansion_module.rnc"'."$end\n";
  }
  // Include default values of interpretation of expressions if needed
  if ($needInD){
    echo "#\n# DEFAULT VALUE OF EXPRESSION INTERPRETATION INCLUDED\n";
    echo "#\n".'include "' . $modulesLocation .
      'per_default_expansion_module.rnc"'."$end\n";
  }
  //Step 4B. Initialize abstract patterns
    if ($needInit){
      echo "#\n# INITIALIZATION MODULES INCLUDED\n";
      echo "#\n".'include "' . $modulesLocation .
          'init_expansion_module.rnc"'."$end\n";
    }


  //Step 4A. Translate to requested xs:lang
  // FIXME: need to handle differently when more than one alternate available
  //        or simulataneous alternate element names allowed
  if ($blng){
    // Include long English element names
    if ($enableLongNames){
      echo "#\n# LONG ENGLISH ELEMENT NAMES\n";
      echo "#\n".'include "' . $modulesLocation .
          'long_name_expansion_module.rnc"'."$end\n";
      // this second module is separated out because of a short-coming in trang
      // where element xyz{notAllowed} is not simplified to notAllowed
      // with the result that we cannot rename abstract elements if
      // we want to be able to generate XSD or monolithic content-models    
      if ($enableRepo){
        echo "#\n".'include "' . $modulesLocation .
            'long_name_repo_expansion_module.rnc"'."$end\n";      
      }
      if ($needResl){
        echo "#\n".'include "' . $modulesLocation .
            'long_name_resl_expansion_module.rnc"'."$end\n";
      }
    }
  }
echo "\n#";

}
//Functions
function processGETParameter ($paramName){
  $param_base_default = "x";
  $bparam_default = decbin(hexdec('fff'));
  if(isset($_GET[$paramName])) {
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
          echo "#\n# Warning: The string $xparam does not consist of all".
               "hexadecimal digits.\n";
          echo "# Default (supremum) ".$paramName." parameter is assumed.\n";
          $bparam = $bparam_default;
        }
      } elseif (strcmp($param_base, '0')==0){
        $bparam = 0;
      }
    } else {
      echo "#\n# Warning: The ".$paramName." parameter ".$param." is not a".
           " hexidecimal or blank string.\n";
         echo "# Default (supremum) ".$paramName." parameter is assumed.\n";
        $bparam = $bparam_default;
    }
  } else {
    echo("#\n# The ".$paramName." parameter was not provided.\n"); 
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