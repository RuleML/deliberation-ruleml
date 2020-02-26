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
echo "Case 1: instance of both naffolgeqPSOA and nafhologeq"
echo "Case 1 normal"
# A test instance is used that is in the normalized serialization for hornlogeq.
instance="${XSD_TEST_SUITE_HOME}Hornlog/hornlogeq/ackermann-typecond_normal.ruleml"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalrnc.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${instance}"
echo "Third parameter (serialization): normal"
"${BASH_HOME}aux_disjunctvalrnc.sh" "config_max.txt" "${instance}" "normal"
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 1 normal"
     exit 1
fi

echo " "
echo "Case 1 relaxed"
# A test instance is used that is in the relaxed serialization for naffologeq
instance="${RNC_TEST_SUITE_HOME}folplus-test-suite/naffologeq-anno_relaxed.ruleml"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalrnc.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${instance}"
echo "Third parameter (serialization): relaxed"
"${BASH_HOME}aux_disjunctvalrnc.sh" "config_max.txt" "${instance}" "relaxed"
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 1 relaxed"
     exit 1
fi

echo " "
echo "Case 1 default relaxed"
# A test instance is used that is in the relaxed serialization for naffologeq
instance="${RNC_TEST_SUITE_HOME}folplus-test-suite/naffologeq-anno_relaxed.ruleml"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalrnc.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${instance}"
echo "Third parameter (serialization): absent, defaulting to relaxed"
"${BASH_HOME}aux_disjunctvalrnc.sh" "config_max.txt" "${instance}"
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 1 default relaxed"
     exit 1
fi

echo " "
echo "Case 1 compact"
# A test instance is used that is in the compact serialization for naffologeq
instance="ackermann"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalrnc.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${COMPACT_SUITE_HOME}${instance}".ruleml
echo "Third parameter (serialization): compact"
"${BASH_HOME}aux_disjunctvalrnc.sh" "config_max.txt" "${COMPACT_SUITE_HOME}${instance}".ruleml "compact"
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 1 compact"
     exit 1
fi

echo " "
echo "Case 2: instance of nafhologeq but not naffologeqPSOA"
echo "Case 2 normal"
instance="hologconstper"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalrnc.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${NORMAL_SUITE_HOME}${instance}".ruleml
echo "Third parameter (serialization): normal"
"${BASH_HOME}aux_disjunctvalrnc.sh" "config_max.txt" "${NORMAL_SUITE_HOME}${instance}".ruleml "normal"
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 2 normal"
     exit 1
fi

echo " "
echo "Case 2 relaxed"
instance="${RNC_TEST_SUITE_HOME}unordered-test-suite/posl-unordered.ruleml"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalrnc.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${instance}"
echo "Third parameter (serialization): relaxed"
"${BASH_HOME}aux_disjunctvalrnc.sh" "config_max.txt" "${instance}" "relaxed"
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 2 relaxed"
     exit 1
fi

echo " "
echo "Case 2 default relaxed"
instance="${RNC_TEST_SUITE_HOME}unordered-test-suite/posl-unordered.ruleml"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalrnc.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${instance}"
echo "Third parameter (serialization):  absent, defaulting to relaxed"
"${BASH_HOME}aux_disjunctvalrnc.sh" "config_max.txt" "${instance}"
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 2 default relaxed"
     exit 1
fi

echo " "
echo "Case 2 compact"
instance="hologconstper"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalrnc.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${COMPACT_SUITE_HOME}${instance}".ruleml
echo "Third parameter (serialization): compact"
"${BASH_HOME}aux_disjunctvalrnc.sh" "config_max.txt" "${COMPACT_SUITE_HOME}${instance}".ruleml "compact"
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 2 compact"
     exit 1
fi

echo " "
echo "Case 3: instance of naffologeqPSOA but not nafhologeq"
echo "Case 3 normal"
instance="hornlogPSOA"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalrnc.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${NORMAL_SUITE_HOME}${instance}".ruleml
echo "Third parameter (serialization): normal"
"${BASH_HOME}aux_disjunctvalrnc.sh" "config_max.txt" "${NORMAL_SUITE_HOME}${instance}".ruleml "normal"
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 3 normal"
     exit 1
fi

echo " "
echo "Case 3 relaxed"
instance="${RNC_TEST_SUITE_HOME}hornlogPSOA-test-suite/hornlogPSOA_relaxed.ruleml"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalrnc.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${instance}"
echo "Third parameter (serialization): relaxed"
"${BASH_HOME}aux_disjunctvalrnc.sh" "config_max.txt" "${instance}" "relaxed"
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 3 relaxed"
     exit 1
fi

echo " "
echo "Case 3 default relaxed"
instance="${RNC_TEST_SUITE_HOME}hornlogPSOA-test-suite/hornlogPSOA_relaxed.ruleml"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalrnc.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${instance}"
echo "Third parameter (serialization): absent, defaulting to relaxed"
"${BASH_HOME}aux_disjunctvalrnc.sh" "config_max.txt" "${instance}"
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 3 default relaxed"
     exit 1
fi

echo " "
echo "Case 3 compact"
instance="${COMPACT_SUITE_HOME}hornlogPSOA.ruleml"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalrnc.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${instance}"
echo "Third parameter (serialization): compact"
"${BASH_HOME}aux_disjunctvalrnc.sh" "config_max.txt" "${instance}" "compact"
if [[ "$?" -ne "0" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 3 compact"
     exit 1
fi

echo " "
echo "Case 4: test that the aux_disjunctvalrnc script FAILS when the instance is not valid against either maximal schema "
echo "Case 4a: existing instance that is not normalized "
echo "Case 4a normalized schema"
echo "Expected outcome: Validation failed against all maximal schemas"
instance="Hornlog/hornlogeq/ackermann"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalrnc.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${XSD_TEST_SUITE_HOME}${instance}".ruleml
echo "Third parameter (serialization): normal"
"${BASH_HOME}aux_disjunctvalrnc.sh" "config_max.txt" "${XSD_TEST_SUITE_HOME}${instance}".ruleml "normal"
if [[ "$?" -ne "1" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 4a normal"
     exit 1
fi

echo " "
echo "Case 4a relaxed schema"
instance="annotation_fail"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalrnc.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${NORMAL_SUITE_HOME}${instance}".ruleml
echo "Third parameter (serialization): relaxed"
"${BASH_HOME}aux_disjunctvalrnc.sh" "config_max.txt" "${NORMAL_SUITE_HOME}${instance}".ruleml "relaxed"
if [[ "$?" -ne "1" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 4a relaxed"
     exit 1
fi

echo " "
echo "Case 4a default relaxed schema"
instance="annotation_fail"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalrnc.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${NORMAL_SUITE_HOME}${instance}".ruleml
echo "Third parameter (serialization):  absent, defaulting to relaxed"
"${BASH_HOME}aux_disjunctvalrnc.sh" "config_max.txt" "${NORMAL_SUITE_HOME}${instance}".ruleml
if [[ "$?" -ne "1" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 4a default relaxed"
     exit 1
fi

echo " "
echo "Case 4a compact"
instance="ackermann"
echo "Invoke script: ${BASH_HOME}aux_disjunctvalrnc.sh"
echo "First parameter (configuration file): config_max.txt"
echo "Second parameter (instance file): ${NORMAL_SUITE_HOME}${instance}".ruleml
echo "Third parameter (serialization):  compact"
"${BASH_HOME}aux_disjunctvalrnc.sh" "config_max.txt" "${NORMAL_SUITE_HOME}${instance}".ruleml "compact"
if [[ "$?" -ne "1" ]]; then
     echo "Testing of Disjunct Validation Failed For Case 4a compact"
     exit 1
fi
