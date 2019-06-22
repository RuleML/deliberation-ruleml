#!/bin/bash
# Dependencies:
# aux_valxsd.sh
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";

# Demonstrate various usages of aux_valxsd.sh 
schemafilenameNE="datalogPSOA_normal"
schemaxsd="${XSD_HOME}${schemafilenameNE}.xsd"
"${BASH_HOME}aux_valxsd.sh" "${schemaxsd}"
if [[ "$?" -ne "0" ]]; then
   echo "Validation Failed for  ${schemaxsd}"
fi

instancefilenameNE="datalogPSOA"
instance="${XSD_TEST_SUITE_HOME}datalogPSOA-test-suite/${instancefilenameNE}.ruleml"
echo "${instance}"
"${BASH_HOME}aux_valxsd.sh" "${schemaxsd}" "${instance}"
if [[ "$?" -ne "0" ]]; then
   echo "Validation Failed for  ${instance}"
fi

instancefilenameNE="datalogPSOA_normal"
instance="${XSD_TEST_SUITE_HOME}datalogPSOA-test-suite/${instancefilenameNE}.ruleml"
echo "${instance}"
"${BASH_HOME}aux_valxsd.sh" "${schemaxsd}" "${instance}"
if [[ "$?" -ne "0" ]]; then
   echo "Validation Failed for  ${instance}"
fi