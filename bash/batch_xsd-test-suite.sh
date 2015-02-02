#!/bin/bash
# Prerequisites: batch_rnc2xsd.sh
# Dependecies: 
# aux_valxsd.sh
#  Validate RuleML instances by XSD
# Instructions:
# run this script from the command line or another script after batch_rnc2xsd.sh
# FIXME use configuration script to validate test files against multiple schemas, including fail tests
# This will remove the fragile schema detection method now implemented.
#
# globstar is only available in bash 4
#shopt -s globstar
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/
REPO_HOME="${BASH_HOME}../"
XSD_HOME=${REPO_HOME}xsd/
TEST_SUITE_HOME=${REPO_HOME}test/xsd-test-suites/

for file in ${TEST_SUITE_HOME}*/*.ruleml ${TEST_SUITE_HOME}*/*/*.ruleml
do
  filename=$(basename "${file}")
  echo "File ${filename}"
  while read -r; do
     echo "Line ${REPLY}"
     if [[ ${REPLY} =~ ^.*schemaLocation=\"http://ruleml.org/spec ]]
     then     
       tail=${REPLY#*spec }
       echo "Tail ${tail}"
       sfile=${tail%\"*} 
       echo "File ${sfile}"
       schemaname=${sfile##*/}
       echo "Schema ${schemaname}"
       sfile=${XSD_HOME}${schemaname}       
       ${BASH_HOME}aux_valxsd.sh "${sfile}"
       exitvalue=$?
       echo ${exitvalue}
       if [ "${exitvalue}" -ne "0" ]; then
          echo "Schema Validation Failed for ${schemaname}"
          exit 1
       fi   
       ${BASH_HOME}aux_valxsd.sh "${sfile}" "${file}"
       exitvalue=$?
       if [[ ! ${file} =~ fail ]] && [ "${exitvalue}" -ne "0" ]; then
          echo "Validation Failed for ${file}"
          exit 1
       else
         if [[ ${file} =~ fail ]] && [ "${exitvalue}" == "0" ]; then
           echo "Validation Succeeded for Failure Test ${file}"
           exit 1
         fi
       fi
       break
     fi
  done < "${file}"
done
