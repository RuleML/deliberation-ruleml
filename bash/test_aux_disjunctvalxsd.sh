#!/bin/bash
# dc:rights [ 'Copyright 2019 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
#
if ! BASH_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/"
then
     echo "BASH_HOME assignment failed"
     exit 1
fi
if ! . "${BASH_HOME}path_config.sh"
then
     echo "Path configuration failed"
     exit 1
fi
mkdir -p "${TMPDIR}"
# The first input parameter is the filename of (or relative path to) the configuration file (a text file containing the anchor filename (without serialization suffix or extension) of each schema to be employed).
# The second input parameter is the instance file.
# The third input parameter is a string with the suffix for the serialization ("relaxed", "normal" or "compact").
# Test Disjunct
echo "Case 1 normal"
instance="ackermann"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalxsd.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${NORMAL_SUITE_HOME}${instance}".ruleml
echo "Third parameter (serialization): normal"
"${BASH_HOME}aux_disjunctvalxsd.sh" "config_max.txt" "${NORMAL_SUITE_HOME}${instance}".ruleml "normal"
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 1 normal"
     exit 1
fi

echo "Case 1 mixed"
instance="ackermann"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalxsd.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${NORMAL_SUITE_HOME}${instance}".ruleml
echo "Third parameter (serialization): mixed"
"${BASH_HOME}aux_disjunctvalxsd.sh" "config_max.txt" "${NORMAL_SUITE_HOME}${instance}".ruleml "mixed"
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 1 mixed"
     exit 1
fi

echo "Case 1 default mixed"
instance="ackermann"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalxsd.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${NORMAL_SUITE_HOME}${instance}".ruleml
echo "Third parameter (serialization): absent, defaulting to mixed"
"${BASH_HOME}aux_disjunctvalxsd.sh" "config_max.txt" "${NORMAL_SUITE_HOME}${instance}".ruleml
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 1 default mixed"
     exit 1
fi

echo " "
echo "Case 2 normal"
instance="hologconstper"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalxsd.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${NORMAL_SUITE_HOME}${instance}".ruleml
echo "Third parameter (serialization): normal"
"${BASH_HOME}aux_disjunctvalxsd.sh" "config_max.txt" "${NORMAL_SUITE_HOME}${instance}".ruleml "normal"
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 2 normal"
     exit 1
fi

echo " "
echo "Case 2 mixed"
instance="hologconstper"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalxsd.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${NORMAL_SUITE_HOME}${instance}".ruleml
echo "Third parameter (serialization): mixed"
"${BASH_HOME}aux_disjunctvalxsd.sh" "config_max.txt" "${NORMAL_SUITE_HOME}${instance}".ruleml "mixed"
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 2 mixed"
     exit 1
fi

echo " "
echo "Case 2 default mixed"
instance="hologconstper"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalxsd.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${NORMAL_SUITE_HOME}${instance}".ruleml
echo "Third parameter (serialization):  absent, defaulting to mixed"
"${BASH_HOME}aux_disjunctvalxsd.sh" "config_max.txt" "${NORMAL_SUITE_HOME}${instance}".ruleml
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 2 default mixed"
     exit 1
fi

echo " "
echo "Case 3 normal"
instance="hornlogPSOA"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalxsd.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${NORMAL_SUITE_HOME}${instance}".ruleml
echo "Third parameter (serialization): normal"
"${BASH_HOME}aux_disjunctvalxsd.sh" "config_max.txt" "${NORMAL_SUITE_HOME}${instance}".ruleml "normal"
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 3 normal"
     exit 1
fi

echo " "
echo "Case 3 mixed"
instance="hornlogPSOA"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalxsd.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${NORMAL_SUITE_HOME}${instance}".ruleml
echo "Third parameter (serialization): mixed"
"${BASH_HOME}aux_disjunctvalxsd.sh" "config_max.txt" "${NORMAL_SUITE_HOME}${instance}".ruleml "mixed"
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 3 mixed"
     exit 1
fi

echo " "
echo "Case 3 default mixed"
instance="hornlogPSOA"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalxsd.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${NORMAL_SUITE_HOME}${instance}".ruleml
echo "Third parameter (serialization): absent, defaulting to mixed"
"${BASH_HOME}aux_disjunctvalxsd.sh" "config_max.txt" "${NORMAL_SUITE_HOME}${instance}".ruleml
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 3 default mixed"
     exit 1
fi

echo " "
echo "Case 4a normalized schema"
echo "Expected outcome: Validation failed against all maximal schemas"
instance="Hornlog/hornlogeq/ackermann"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalxsd.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${XSD_TEST_SUITE_HOME}${instance}".ruleml
echo "Third parameter (serialization): normal"
"${BASH_HOME}aux_disjunctvalxsd.sh" "config_max.txt" "${XSD_TEST_SUITE_HOME}${instance}".ruleml "normal"
if [[ "$?" -ne "1" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 4a normal"
     exit 1
fi

echo " "
echo "Case 4a mixed schema"
instance="Hornlog/hornlogeq/ackermann"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalxsd.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${XSD_TEST_SUITE_HOME}${instance}".ruleml
echo "Third parameter (serialization): mixed"
"${BASH_HOME}aux_disjunctvalxsd.sh" "config_max.txt" "${XSD_TEST_SUITE_HOME}${instance}".ruleml "mixed"
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 4a mixed"
     exit 1
fi

echo " "
echo "Case 4a default mixed schema"
instance="Hornlog/hornlogeq/ackermann"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalxsd.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${XSD_TEST_SUITE_HOME}${instance}".ruleml
echo "Third parameter (serialization):  absent, defaulting to mixed"
"${BASH_HOME}aux_disjunctvalxsd.sh" "config_max.txt" "${XSD_TEST_SUITE_HOME}${instance}".ruleml
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 4a default mixed"
     exit 1
fi

