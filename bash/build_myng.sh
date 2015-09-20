#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]

# Builds using local instance of MYNG
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";

# Test RNC locally
"${BASH_HOME}build_myng2rnc.sh"
if [ "$?" -ne "0" ]; then
     echo "Local Testing of RNC Schemas Failed"
     exit 1
fi
# Build XSD locally and test
"${BASH_HOME}build_myng2xsd.sh"
if [ "$?" -ne "0" ]; then
     echo "Local Testing of XSD Schemas Failed"
     exit 1
fi
# Test Normalizer
"${BASH_HOME}batch_xslt_test-normal.sh"
if [ "$?" -ne "0" ]; then
     echo "Local Testing of XSLT Normalizer Failed"
     exit 1
fi
# Test Compactifier
"${BASH_HOME}batch_xslt_test-compact.sh"
if [ "$?" -ne "0" ]; then
     echo "Local Testing of XSLT Compactifier Failed"
     exit 1
fi
# Build zip files
"${BASH_HOME}build_zip.sh"
if [ "$?" -ne "0" ]; then
     echo "Build of zip files Failed"
     exit 1
fi
