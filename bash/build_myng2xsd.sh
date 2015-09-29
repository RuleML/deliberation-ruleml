#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
# Fully local test script for XSD
# Dependencies
# batch_config2rnc4xsd.sh
# batch_rnc2xsd.sh
# batch_xsd-test-suite.sh
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";

# Generate RNC using local MYNG Engine
"${BASH_HOME}batch_config2rnc4xsd.sh"
if [[ "$?" -ne "0" ]]; then
   echo "Configuration of RNC4XSD Failed"
   exit 1
fi

# Generate XSD, and validate
"${BASH_HOME}batch_rnc2xsd.sh"
if [[ "$?" -ne "0" ]]; then
     echo "Generation of XSD Failed"
     exit 1
fi
   
# Validate Examples in XSD Test Suites
"${BASH_HOME}batch_xsd-test-suite.sh"
if [[ "$?" -ne "0" ]]; then
     echo "Local Testing of XSD Schemas Failed"
     exit 1
fi

# Generate Random Normal Instances and Check Round-Trip Identity Law
"${BASH_HOME}generate_normal_xml.sh"
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Round-Trip Identity Law Failed"
     exit 1
fi

# Generate Random Compact Instances and Check Round-Trip Identity Law
"${BASH_HOME}generate_compact_xml.sh"
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Round-Trip Identity Law Failed"
     exit 1
fi


