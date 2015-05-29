#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
# Fully cloud test script for RNC
# FIXME Download modules from cloud to temporary directory
# FIXME Download test suite from cloud to temporary directory
# FIXME Download drivers from cloud to temporary directory
# FIXME Output generated files into temporary directories
# Dependencies
# aux_valrnc.sh
# batch_rnc2rng.sh
# batch_webconfig2rnc.sh
# batch_webconfig2rnc4simp.sh
# batch_rnc_test_suite.sh
# batch_rnc2simp.sh
# webserver
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/
REPO_HOME="${BASH_HOME}../"
RNC_HOME=${REPO_HOME}relaxng/

# Generate RNC for Testing
${BASH_HOME}batch_webconfig2rnc.sh  >> /dev/null 2>&1
if [ "$?" -ne "0" ]; then
     echo "Local Configuration and Caching of Online MYNG-Generated RNC Schemas Failed"
     exit 1
fi
# Validate Examples in Relax NG Test Suites
${BASH_HOME}batch_rnc-test-suite.sh  >> /dev/null 2>&1
if [ "$?" -ne "0" ]; then
     echo "Local Testing of RuleML Instances against (Cached) Online MYNG-Generated RNC Schemas Failed"
     exit 1
fi
