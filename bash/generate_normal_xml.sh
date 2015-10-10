#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
# See ReadMe.text for instructions on running this script.

shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";
mkdir -p "${INSTANCE_NORMAL_HOME}"
rm "${INSTANCE_NORMAL_HOME}"*.ruleml  >> /dev/null 2>&1
mkdir -p "${INSTANCE_COMPACT_HOME}"
rm "${INSTANCE_COMPACT_HOME}"*.ruleml  >> /dev/null 2>&1

family="naffologeq_"
nschemanameNE="${family}normal"
cschemanameNE="${family}compact"
nschemaname="${nschemanameNE}.xsd"
nxsfile="${XSD_NORMAL}${nschemaname}"       

# Validate XSD schema
  echo "Start XSD Schema Validation"
  "${BASH_HOME}aux_valxsd.sh" "${nxsfile}"
  exitvalue=$?
  echo ${exitvalue}
  if [[ "${exitvalue}" -ne "0" ]]; then
       echo "Schema Validation Failed for ${schemaname}"
       exit 1
   fi   

#   use oxygen to generate XML instances according to the configuration file for the normal-serialization driver"
echo "Start Instance Generation"
"$GENERATE_SCRIPT" "$NORMAL_CONFIG"

# Validate RNC schema
  echo "Start RNC Schema Validation"
  nschemaname="${nschemanameNE}.rnc"
  nsfile="${DRIVER_HOME}${nschemaname}"       
  "${BASH_HOME}aux_valrnc.sh" "${nsfile}"
  exitvalue=$?
  echo ${exitvalue}
  if [[ "${exitvalue}" -ne "0" ]]; then
       echo "Schema Validation Failed for ${nschemaname}"
       exit 1
   fi   

# Apply XSLT transforamtions - instance postprocessing
# transform in place for files in INSTANCE_NORMAL_HOME
# FIXME write an aux script for the xslt call
for f in "${INSTANCE_NORMAL_HOME}"*.ruleml
do
  filename=$(basename "$f")
  echo "Completing  ${filename}"
  java -jar "${SAX_HOME}saxon9ee.jar" -s:"${f}" -xsl:"${XSLT_HOME}instance-postprocessor/1.02_instance-postprocessor.xslt"  -o:"${f}"
  if [[ "$?" -ne "0" ]]; then
     echo "XSLT Transformation Failed for  ${filename}"
     exit 1
   fi
done

# Validate instances
for file in "${INSTANCE_NORMAL_HOME}"*.ruleml 
do
  filename=$(basename "${file}")
  echo "File ${filename}"
  "${BASH_HOME}aux_valrnc.sh" "${nsfile}" "${file}"
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

# Validate compact schema
  echo "Start RNC Schema Validation"
  cschemaname="${cschemanameNE}.rnc"
  csfile="${DRIVER_COMPACT_HOME}${cschemaname}"       
  "${BASH_HOME}aux_valrnc.sh" "${csfile}"
  exitvalue=$?
  echo ${exitvalue}
  if [[ "${exitvalue}" -ne "0" ]]; then
       echo "Schema Validation Failed for ${cschemaname}"
       exit 1
   fi   

# Apply XSLT transforamtions for compactifying
# transform files in INSTANCE_NORMAL_HOME into INSTANCE_COMPACT_HOME 
for f in "${INSTANCE_NORMAL_HOME}"*.ruleml
do
  filename=$(basename "$f")
  echo "Compactifying  ${filename}"
  fnew="${INSTANCE_COMPACT_HOME}${filename}"
  java -jar "${SAX_HOME}saxon9ee.jar" -s:"${f}" -xsl:"${XSLT_HOME}compactifier/1.02_compactifier_drop.xslt"  -o:"${fnew}"
  if [[ "$?" -ne "0" ]]; then
     echo "XSLT Transformation Failed for  ${filename}"
     exit 1
   fi
done

# Validate instances
for file in "${INSTANCE_COMPACT_HOME}"*.ruleml 
do
  filename=$(basename "${file}")
  echo "Validating File ${filename}"
  "${BASH_HOME}aux_valrnc.sh" "${csfile}" "${file}"
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

# Apply XSLT transforamtions for normalizing
# transform files in INSTANCE_COMPACT_HOME
# The result is z = Px, where x is a random instance of the naffologeq_normal.
# where P = NC is the projection operator that enforces additional syntactic restrictions
# not expressible in the schemas.
# Law: z = Px validates against the normalized schemas.
# 
for f in "${INSTANCE_COMPACT_HOME}"*.ruleml
do
  filename=$(basename "$f")
  echo "Normalizing  ${filename}"
  fnew="${INSTANCE_NORMAL_HOME}ca-${filename}"
  java -jar "${SAX_HOME}saxon9ee.jar" -s:"${f}" -xsl:"${XSLT_HOME}normalizer/1.02_normalizer.xslt"  -o:"${fnew}"
  if [[ "$?" -ne "0" ]]; then
     echo "XSLT Transformation Failed for  ${filename}"
     exit 1
   fi
done

# Validate instances
for file in "${INSTANCE_NORMAL_HOME}ca-"*.ruleml 
do
  filename=$(basename "${file}")
  echo "Validating File ${filename}"
  "${BASH_HOME}aux_valrnc.sh" "${nsfile}" "${file}"
  "${BASH_HOME}aux_valxsd.sh" "${nxsfile}"
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

# Apply XSLT transforamtions for canonicalizing (strip whitespace)
# transform in place for files in INSTANCE_NORMAL_HOME
for f in "${INSTANCE_NORMAL_HOME}ca-"*.ruleml
do
  filename=$(basename "$f")
  echo "Canonicalizing  ${filename}"
  java -jar "${SAX_HOME}saxon9ee.jar" -s:"${f}" -xsl:"${XSLT_HOME}instance-postprocessor/1.02_instance-postprocessor-stripwhitespace.xslt"  -o:"${f}"
  if [[ "$?" -ne "0" ]]; then
     echo "XSLT Transformation Failed for  ${filename}"
     exit 1
   fi
done

# Validate instances
for file in "${INSTANCE_NORMAL_HOME}ca-"*.ruleml 
do
  filename=$(basename "${file}")
  echo "File ${filename}"
  "${BASH_HOME}aux_valrnc.sh" "${nsfile}" "${file}"
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

# Apply XSLT transforamtions for normalizing
# transform in place for files in INSTANCE_NORMAL_HOME
# Law: If y = Px, then Ny = y
for f in "${INSTANCE_NORMAL_HOME}ca-"*.ruleml
do
  filename=$(basename "$f")
  echo "Re-Normalizing  ${filename}"
  fnew="${INSTANCE_NORMAL_HOME}re-${filename}"
  java -jar "${SAX_HOME}saxon9ee.jar" -s:"${f}" -xsl:"${XSLT_HOME}normalizer/1.02_normalizer.xslt"  -o:"${fnew}"
  java -jar "${SAX_HOME}saxon9ee.jar" -s:"${fnew}" -xsl:"${XSLT_HOME}instance-postprocessor/1.02_instance-postprocessor-stripwhitespace.xslt"  -o:"${fnew}"
  read -r firstlineold<"${f}"
  read -r firstlinenew<"${fnew}"
  echo "Re-Normalized Comparing  ${filename}"
  if [[ "${firstlineold}" != "${firstlinenew}" ]]; then
     echo "Re-Normalization Failed for  ${filename}"
     diff -q "${f}" "${fnew}" 
     exit 1
   fi
done

# Apply XSLT transforamtions - compactify, then normalize
# transform into new file with "rt-" prefix for files in INSTANCE_NORMAL_HOME
# Law: P is idempotent (PP = P)
for f in "${INSTANCE_NORMAL_HOME}ca-"*.ruleml
do
  filename=$(basename "$f")
  echo "Round-Trip Transforming  ${filename}"
  fnew="${INSTANCE_NORMAL_HOME}rt-${filename}"
  java -jar "${SAX_HOME}saxon9ee.jar" -s:"${f}" -xsl:"${XSLT_HOME}compactifier/1.02_compactifier.xslt"  -o:"${fnew}"
  java -jar "${SAX_HOME}saxon9ee.jar" -s:"${fnew}" -xsl:"${XSLT_HOME}normalizer/1.02_normalizer.xslt"  -o:"${fnew}"
  java -jar "${SAX_HOME}saxon9ee.jar" -s:"${fnew}" -xsl:"${XSLT_HOME}instance-postprocessor/1.02_instance-postprocessor-stripwhitespace.xslt"  -o:"${fnew}"
  read -r firstlineold<"${f}"
  read -r firstlinenew<"${fnew}"
  echo "Round-Trip Comparing  ${filename}"
  if [[ "${firstlineold}" != "${firstlinenew}" ]]; then
     echo "XSLT Round Trip Failed for  ${filename}"
     diff -q "${f}" "${fnew}" 
     exit 1
   fi
done
