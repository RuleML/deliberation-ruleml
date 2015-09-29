#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
# See ReadMe.text for instructions on running this script.
# 
#
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";
rm "${INSTANCE_COMPACT_HOME}"*.ruleml  >> /dev/null 2>&1

#   use oxygen to generate XML instances according to the configuration file for the naffologeq-normal driver
sh "$GENERATE_SCRIPT" "$COMPACT_CONFIG"

# Apply XSLT transforamtions
# transform in place for files in INSTANCE_HOME
# FIXME write an aux script for the xslt call
for f in "${INSTANCE_COMPACT_HOME}"*.ruleml
do
  filename=$(basename "$f")
  echo "Transforming  ${filename}"
  java -jar "${SAX_HOME}saxon9ee.jar" -s:"${f}" -xsl:"${XSLT_HOME}instance-postprocessor/1.02_instance-postprocessor-compact.xslt"  -o:"${f}"
  java -jar "${SAX_HOME}saxon9ee.jar" -s:"${f}" -xsl:"${XSLT_HOME}compactifier/1.02_compactifier_stripwhitespace.xslt"  -o:"${f}"
  if [[ "$?" -ne "0" ]]; then
     echo "XSLT Transformation Failed for  ${filename}"
     exit 1
   fi
done

  schemaname="naffologeq_compact.rnc"
  sfile="${TEST_HOME}${schemaname}"       
  "${BASH_HOME}aux_valrnc.sh" "${sfile}"
  exitvalue=$?
  echo ${exitvalue}
  if [[ "${exitvalue}" -ne "0" ]]; then
       echo "Schema Validation Failed for ${schemaname}"
       exit 1
   fi   

for file in "${INSTANCE_COMPACT_HOME}"*.ruleml 
do
  filename=$(basename "${file}")
  echo "File ${filename}"
  "${BASH_HOME}aux_valrnc.sh" "${sfile}" "${file}"
  exitvalue=$?
  if [[ ! "${file}" =~ fail ]] && [[ "${exitvalue}" -ne "0" ]]; then
          echo "Validation Failed for ${file}"
          exit 1
   else
         if [[ "${file}" =~ fail ]] && [[ "${exitvalue}" == "0" ]]; then
           echo "Validation Succeeded for Failure Test ${file}"
           exit 1
         fi
  fi       
done

# Apply XSLT transforamtions - compactify, then normalize
# transform into new file with "rt-" prefix for files in INSTANCE_COMPACT_HOME
# FIXME write an aux script for the xslt call
for f in "${INSTANCE_COMPACT_HOME}"*.ruleml
do
  filename=$(basename "$f")
  echo "Round-Trip Transforming  ${filename}"
  fnew="${INSTANCE_COMPACT_HOME}rt-${filename}"
  java -jar "${SAX_HOME}saxon9ee.jar" -s:"${fnew}" -xsl:"${XSLT_HOME}normalizer/1.02_normalizer_stripwhitespace.xslt"  -o:"${fnew}"
  java -jar "${SAX_HOME}saxon9ee.jar" -s:"${f}" -xsl:"${XSLT_HOME}compactifier/1.02_compactifier_stripwhitespace.xslt"  -o:"${fnew}"
  read -r firstlineold<"${f}"
  read -r firstlinenew<"${fnew}"
  echo "Round-Trip Comparing  ${filename}"
  if [[ "${firstlineold}" != "${firstlinenew}" ]]; then
     echo "XSLT Round Trip Failed for  ${filename}"
     diff -q "${f}" "${fnew}" 
     exit 1
   fi
done
