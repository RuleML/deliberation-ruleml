#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
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
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";

# creates the compactification test directory if they doesn't exist, and clears it, in case it already has contents
mkdir -p "${COMPACT_SUITE_HOME}"
rm "${COMPACT_SUITE_HOME}"* >> /dev/null 2>&1


  nschemaname="naffologeq_normal.xsd"
  nfile="${XSD_HOME}${nschemaname}"       
  "${BASH_HOME}aux_valxsd.sh" "${nfile}"
  exitvalue=$?
  echo ${exitvalue}
  if [[ "${exitvalue}" -ne "0" ]]; then
       echo "Schema Validation Failed for ${nschemaname}"
       exit 1
   fi   
  schemaname="naffologeq_compact4xsd.xsd"
  sfile="${XSD_HOME}${schemaname}"       
  "${BASH_HOME}aux_valxsd.sh" "${sfile}"
  exitvalue=$?
  echo ${exitvalue}
  if [[ "${exitvalue}" -ne "0" ]]; then
       echo "Schema Validation Failed for ${schemaname}"
       exit 1
   fi   
schemaname2="naffologeq_compact.rnc"
  sfile2="${RNC_HOME}${schemaname2}"       
  "${BASH_HOME}aux_valrnc.sh" "${sfile2}"
  exitvalue=$?
  echo ${exitvalue}
  if [[ "${exitvalue}" -ne "0" ]]; then
       echo "Schema Validation Failed for ${schemaname2}"
       exit 1
   fi   

# Apply compactification XSLT transforamtions
# transform files in TEST_SUITE_HOME ending in .ruleml
# output to COMPACT_SUITE_HOME
# FIXME write an aux script for the xslt call
for f in "${XSD_TEST_SUITE_HOME}"*/*.ruleml "${XSD_TEST_SUITE_HOME}"*/*/*.ruleml
do
  filename=$(basename "$f")
  echo "Transforming  ${filename}"
  java -jar "${SAX_HOME}saxon9ee.jar" -s:"${f}" -xsl:"${COMPACT_XSLT_HOME}1.02_compactifier.xslt"  -o:"${COMPACT_SUITE_HOME}${filename}"
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
