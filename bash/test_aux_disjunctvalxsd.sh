#!/bin/bash
# dc:rights [ 'Copyright 2019 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
#
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";
mkdir -p "${TMPDIR}"
# The first input parameter is the filename of (or relative path to) the configuration file (a text file containing the anchor filename (without serialization suffix or extension) of each schema to be employed).
# The second input parameter is the instance file.
# The third input parameter is a string with the suffix for the serialization ("relaxed", "normal" or "compact").
# Test Disjunct
echo "Case 1"
instance="ackermann"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalxsd.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${NORMAL_SUITE_HOME}${instance}".ruleml
echo "Third parameter (serialization): normal"
"${BASH_HOME}aux_disjunctvalxsd.sh" "config_max.txt" "${NORMAL_SUITE_HOME}${instance}".ruleml "normal"
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed"
     exit 1
fi

echo " "
echo "Case 2"
instance="hologconstper"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalxsd.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${NORMAL_SUITE_HOME}${instance}".ruleml
echo "Third parameter (serialization): normal"
"${BASH_HOME}aux_disjunctvalxsd.sh" "config_max.txt" "${NORMAL_SUITE_HOME}${instance}".ruleml "normal"
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed"
     exit 1
fi

echo " "
echo "Case 3"
instance="hornlogPSOA"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalxsd.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${NORMAL_SUITE_HOME}${instance}".ruleml
echo "Third parameter (serialization): normal"
"${BASH_HOME}aux_disjunctvalxsd.sh" "config_max.txt" "${NORMAL_SUITE_HOME}${instance}".ruleml "normal"
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed"
     exit 1
fi

echo " "
echo "Case 4a"
instance="Hornlog/hornlogeq/ackermann"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalxsd.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${XSD_TEST_SUITE_HOME}${instance}".ruleml
echo "Third parameter (serialization): normal"
"${BASH_HOME}aux_disjunctvalxsd.sh" "config_max.txt" "${XSD_TEST_SUITE_HOME}${instance}".ruleml "normal"
if [[ "$?" -ne "1" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 4a"
     exit 1
fi