#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
# Fully RuleML webserver-based test script for RNC
# Dependencies
# Direct Dependencies
#   batch_webconfig2rnc.sh
#   batch_rnc_test_suite.sh
# Indirect Dependencies
#   aux_valrnc.sh
#   aux_web2rnc.sh
#   config_rnc.txt
#   config_rnc_myng.txt
#   test/rnc-test-suites/*.ruleml
#   relaxng/test/*.rnc



# webserver
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";

# Generate RNC Drivers for Testing
"${BASH_HOME}batch_webconfig2rnc.sh"
if [[ "$?" -ne "0" ]]; then
     echo "Local Configuration and Caching of Online MYNG-Generated RNC Schemas Failed"
     exit 1
fi

# Validate Examples in Relax NG Test Suites
"${BASH_HOME}batch_rnc-test-suite.sh"
if [[ "$?" -ne "0" ]]; then
     echo "Local Testing of RuleML Instances against (Cached) Online MYNG-Generated RNC Schemas Failed"
     exit 1
fi
