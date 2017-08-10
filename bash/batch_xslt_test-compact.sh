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

# creates the compactification test directory if they doesn't exist, and clears it, in case it already has contents
mkdir -p "${COMPACT_SUITE_HOME}"
rm "${COMPACT_SUITE_HOME}"* >> /dev/null 2>&1


  nschemaname="nafhologeq_normal.xsd"
  nfile="${XSD_HOME}${nschemaname}"       
  "${BASH_HOME}aux_valxsd.sh" "${nfile}"
  if [[ "$?" -ne "0" ]]; then
       echo "Schema Validation Failed for ${nschemaname}"
       exit 1
   fi   
  schemaname="nafhologeq_compact.xsd"
  sfile="${XSD_HOME}${schemaname}"       
  "${BASH_HOME}aux_valxsd.sh" "${sfile}"
  if [[ "$?" -ne "0" ]]; then
       echo "Schema Validation Failed for ${schemaname}"
       exit 1
   fi   
schemaname2="nafhologeq_compact.rnc"
  sfile2="${RNC_HOME}${schemaname2}"       
  "${BASH_HOME}aux_valrnc.sh" "${sfile2}"
  if [[ "$?" -ne "0" ]]; then
       echo "Schema Validation Failed for ${schemaname2}"
       exit 1
   fi   

# Apply compactification XSLT transforamtions
# transform files in TEST_SUITE_HOME ending in .ruleml
# output to COMPACT_SUITE_HOME
for f in "${XSD_TEST_SUITE_HOME}"*/*.ruleml "${XSD_TEST_SUITE_HOME}"*/*/*.ruleml
do
  filename=$(basename "$f")
  echo "Transforming  ${filename}"
  "${BASH_HOME}aux_xslt.sh" "${f}" "${COMPACT_XSLT_HOME}compactifier.xslt" "${COMPACT_SUITE_HOME}${filename}"
  if [[ "$?" -ne "0" ]]; then
     echo "XSLT Transformation Failed for  ${filename}"
     exit 1
   fi
done

for file in "${COMPACT_SUITE_HOME}"*.ruleml
do
  filename=$(basename "${file}")
  echo "File ${filename}"
    "${BASH_HOME}aux_valxsd.sh" "${nfile}" "${file}"
    exitvalue=$?
    if [[ "${exitvalue}" -ne "1" ]]; then
          echo "Normal Validation Succeeded for Compact ${file}"
          exit 1
    fi       
    "${BASH_HOME}aux_valxsd.sh" "${sfile}" "${file}"
    exitvalue=$?
    if [[ ! "${file}" =~ fail ]] && [[ "${exitvalue}" -ne "0" ]]; then
          echo "Validation Failed for Compact ${file}"
          exit 1
    fi       
    "${BASH_HOME}aux_valrnc.sh" "${sfile2}" "${file}"
    exitvalue=$?
    if [[ ! "${file}" =~ fail ]] && [[ "${exitvalue}" -ne "0" ]]; then
          echo "Validation Failed for Compact ${file}"
          exit 1
    fi       
done
