#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
#
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";

# creates the output directories if they don't exist, and clears them of RNC files, in case they already have contents
# mkdir -p "${TMP_HOME}"
# rm "${TMP_HOME}"* >> /dev/null 2>&1
# ln -s "${TMP_HOME}modules/" modules
# ln -s "${RNC_HOME}modules/" "${TMP_HOME}modules"

echo "Starting"
# myngcode="b3f-d7-a7-l1-p3ff-i7f-t2f3f-q7-ef-s4c" for slotdep and below one is for tuple
# In MYNG GUI click "Fill Form", then uncheck "Unordered Groups" and "Stripe-Skipping"
# naffologeq_normal: myng-b3f-d7-a7-l1-p3ff-i7f-tf3f-q7-ef-s4c 
myngcode="b3f-d7-a7-l1-p3f7-i7f-tef3f-q9-ef-s4c"
"${BASH_HOME}aux_myng2rnc.sh" "${myngcode}" "${RNC_HOME}naffologeqPSOA_normal.rnc"
echo "Finished creating relaxng"
schemaFile="${RNC_HOME}naffologeqPSOA_normal.rnc"
echo "schemaFile: ${schemaFile}"
rulemlFile="${RNC_TEST_SUITE_HOME}naffologeqPSOA-test-suite/naffologeqPSOA_normal.ruleml"
echo "rulemlFile: ${rulemlFile}"
"${BASH_HOME}aux_valrnc.sh" "${schemaFile}"
"${BASH_HOME}aux_valrnc.sh" "${schemaFile}" "${rulemlFile}"

# In MYNG GUI click "Fill Form", then uncheck "Unordered Groups" and "Stripe-Skipping" etc.,
# as appropriate for configuring datalog_normal.
# datalog_normal: myng-b7-d7-a7-l1-p3cf-i7-tf0f-q1-e0-s4c
myngcode="b7-d7-a7-l1-p3c7-i7-tef0f-q9-e0-s4c"
"${BASH_HOME}aux_myng2rnc.sh" "${myngcode}" "${RNC_HOME}datalogPSOA_normal.rnc"
echo "Finished creating relaxng"
schemaFile="${RNC_HOME}datalogPSOA_normal.rnc"
echo "schemaFile: ${schemaFile}"
rulemlFile="${RNC_TEST_SUITE_HOME}datalogPSOA-test-suite/datalogPSOA_normal.ruleml"
echo "rulemlFile: ${rulemlFile}"
"${BASH_HOME}aux_valrnc.sh" "${schemaFile}"
"${BASH_HOME}aux_valrnc.sh" "${schemaFile}" "${rulemlFile}"

# hornlog_normal: myng-bf-d7-a7-l1-p3cf-i7-tf0f-q7-e3-s4c
myngcode="bf-d7-a7-l1-p3c7-i7-tef0f-q9-e3-s4c"
"${BASH_HOME}aux_myng2rnc.sh" "${myngcode}" "${RNC_HOME}hornlogPSOA_normal.rnc"
echo "Finished creating relaxng"
schemaFile="${RNC_HOME}hornlogPSOA_normal.rnc"
echo "schemaFile: ${schemaFile}"
rulemlFile="${RNC_TEST_SUITE_HOME}hornlogPSOA-test-suite/hornlogPSOA_normal.ruleml"
echo "rulemlFile: ${rulemlFile}"
"${BASH_HOME}aux_valrnc.sh" "${schemaFile}"
"${BASH_HOME}aux_valrnc.sh" "${schemaFile}" "${rulemlFile}"

# naffologeq_normal4xsd: myng-b3f-d7-a7-l1-p3ff-i7f-tf3f-q7-ef-s50 
myngcode="b3f-d7-a7-l1-p3f7-i7f-tef3f-q9-ef-s50"
"${BASH_HOME}aux_myng2rnc.sh" "${myngcode}" "${RNC_HOME}naffologeqPSOA_normal4xsd.rnc"
echo "Finished creating relaxng"
schemaFile="${RNC_HOME}naffologeqPSOA_normal4xsd.rnc"
echo "schemaFile: ${schemaFile}"
rulemlFile="${RNC_TEST_SUITE_HOME}naffologeqPSOA-test-suite/naffologeqPSOA_normal.ruleml"
echo "rulemlFile: ${rulemlFile}"
"${BASH_HOME}aux_valrnc.sh" "${schemaFile}"
"${BASH_HOME}aux_valrnc.sh" "${schemaFile}" "${rulemlFile}"

# datalogPSOA_normal4xsd: b07-d7-a7-l1-p3cf-i07-tf0f-q7-e0-s50
myngcode="b7-d7-a7-l1-p3c7-i7-tef0f-q9-e0-s50"
"${BASH_HOME}aux_myng2rnc.sh" "${myngcode}" "${RNC_HOME}datalogPSOA_normal4xsd.rnc"
echo "Finished creating relaxng"
schemaFile="${RNC_HOME}datalogPSOA_normal4xsd.rnc"
echo "schemaFile: ${schemaFile}"
rulemlFile="${RNC_TEST_SUITE_HOME}datalogPSOA-test-suite/datalogPSOA_normal.ruleml"
echo "rulemlFile: ${rulemlFile}"
"${BASH_HOME}aux_valrnc.sh" "${schemaFile}"
"${BASH_HOME}aux_valrnc.sh" "${schemaFile}" "${rulemlFile}"

# hornlogPSOA_normal4xsd: b0f-d7-a7-l1-p3cf-i07-tf3f-q7-ef-s50
myngcode="bf-d7-a7-l1-p3c7-i7-tef0f-q9-e3-s50"
"${BASH_HOME}aux_myng2rnc.sh" "${myngcode}" "${RNC_HOME}hornlogPSOA_normal4xsd.rnc"
echo "Finished creating relaxng"
schemaFile="${RNC_HOME}hornlogPSOA_normal4xsd.rnc"
echo "schemaFile: ${schemaFile}"
rulemlFile="${RNC_TEST_SUITE_HOME}hornlogPSOA-test-suite/hornlogPSOA_normal.ruleml"
echo "rulemlFile: ${rulemlFile}"
"${BASH_HOME}aux_valrnc.sh" "${schemaFile}"
"${BASH_HOME}aux_valrnc.sh" "${schemaFile}" "${rulemlFile}"

# naffologeq_normal4simp: myng-b3f-d7-a7-l1-p3ff-i7f-tf3f-q7-ef-s48 
myngcode="b3f-d7-a7-l1-p3f7-i7f-tef3f-q9-ef-s48"
"${BASH_HOME}aux_myng2rnc.sh" "${myngcode}" "${RNC_HOME}naffologeqPSOA_normal4simp.rnc"
echo "Finished creating relaxng"
schemaFile="${RNC_HOME}naffologeqPSOA_normal4simp.rnc"
echo "schemaFile: ${schemaFile}"
rulemlFile="${RNC_TEST_SUITE_HOME}naffologeqPSOA-test-suite/naffologeqPSOA_normal.ruleml"
echo "rulemlFile: ${rulemlFile}"
"${BASH_HOME}aux_valrnc.sh" "${schemaFile}"
"${BASH_HOME}aux_valrnc.sh" "${schemaFile}" "${rulemlFile}"

# datalogPSOA_normal4simp: b07-d7-a7-l1-p3cf-i07-tf0f-q7-e0-s48
myngcode="b7-d7-a7-l1-p3c7-i7-tef0f-q9-e0-s48"
"${BASH_HOME}aux_myng2rnc.sh" "${myngcode}" "${RNC_HOME}datalogPSOA_normal4simp.rnc"
echo "Finished creating relaxng"
schemaFile="${RNC_HOME}datalogPSOA_normal4simp.rnc"
echo "schemaFile: ${schemaFile}"
rulemlFile="${RNC_TEST_SUITE_HOME}datalogPSOA-test-suite/datalogPSOA_normal.ruleml"
echo "rulemlFile: ${rulemlFile}"
"${BASH_HOME}aux_valrnc.sh" "${schemaFile}"
"${BASH_HOME}aux_valrnc.sh" "${schemaFile}" "${rulemlFile}"

# hornlogPSOA_normal4simp: b0f-d7-a7-l1-p3cf-i07-tf0f-q7-e3-s48
myngcode="bf-d7-a7-l1-p3c7-i7-tef0f-q9-e3-s48"
"${BASH_HOME}aux_myng2rnc.sh" "${myngcode}" "${RNC_HOME}hornlogPSOA_normal4simp.rnc"
echo "Finished creating relaxng"
schemaFile="${RNC_HOME}hornlogPSOA_normal4simp.rnc"
echo "schemaFile: ${schemaFile}"
rulemlFile="${RNC_TEST_SUITE_HOME}hornlogPSOA-test-suite/hornlogPSOA_normal.ruleml"
echo "rulemlFile: ${rulemlFile}"
"${BASH_HOME}aux_valrnc.sh" "${schemaFile}"
"${BASH_HOME}aux_valrnc.sh" "${schemaFile}" "${rulemlFile}"
