#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
# Prerequisites: batch_rnc2xsd.sh
# Dependecies: 
# aux_valxsd.sh
#  Validate RuleML instances by XSD
# Instructions:
# run this script from the command line or another script after batch_rnc2xsd.sh
#
# globstar is only available in bash 4
#shopt -s globstar
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";

for file in "${XSD_TEST_SUITE_HOME}"*/*.ruleml "${XSD_TEST_SUITE_HOME}"*/*/*.ruleml
do
  filename=$(basename "${file}")
  echo "File ${filename}"
  while read -r; do
     echo "Line ${REPLY}"
     if [[ ${REPLY} =~ schemaLocation=\"http://ruleml.org/spec ]]
     then     
       tail=${REPLY#*spec }
       echo "Tail ${tail}"
       sfile=${tail%\"*} 
       echo "File ${sfile}"
       schemaname=${sfile##*/}
       echo "Schema ${schemaname}"
       sfile="${XSD_HOME}${schemaname}"       
       echo "Begin JAXB Validation of ${file}" 
       "${BASH_HOME}aux_valxsd.sh" "${sfile}"
       if [[ "$?" -ne "0" ]]; then
         echo "Schema Validation Failed for ${schemaname}"
         exit 1
       fi   
       "${BASH_HOME}aux_valxsd.sh" "${sfile}" "${file}"
       exitvalue=$?
       if [[ ! ${file} =~ fail ]] && [[ "${exitvalue}" -ne "0" ]]; then
          echo "Validation Failed for ${file}"
          exit 1
       else
         if [[ ${file} =~ fail ]] && [[ "${exitvalue}" == "0" ]]; then
           echo "Validation Succeeded for Failure Test ${file}"
           exit 1
         fi
       fi
       break
     fi
  done < "${file}"
done
