#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
# Configures and validates local driver RNC schemas, generated locally by the MYNG engine, for producing the content model as a simplified RNC grammar.
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";

# creates the output directories if they don't exist, and clears them of RNC files, in case they already have contents
mkdir -p "${RNC4SIMP_HOME}"
rm "${RNC4SIMP_HOME}"*.rnc

while read line
do
    echo "Text read from file - $line"
    tokens=( $line )
    "${BASH_HOME}aux_myng2rnc.sh" "${tokens[1]}" "${RNC4SIMP_HOME}${tokens[0]}_normal.rnc"
    "${BASH_HOME}aux_myng2rnc.sh" "${tokens[2]}" "${RNC4SIMP_HOME}${tokens[0]}_relaxed.rnc"
done < "${BASH_HOME}config_rnc4simp.txt"

cp "${RNC_HOME}nafhologeq_relaxed4simp.rnc" "${RNC4SIMP_HOME}nafhologeq_relaxed.rnc"
cp "${RNC_HOME}nafhologeq_normal4simp.rnc" "${RNC4SIMP_HOME}nafhologeq_normal.rnc"

for file in "${RNC4SIMP_HOME}"*.rnc
do
  "${BASH_HOME}aux_valrnc.sh" "$file"
  if [[ "$?" -ne "0" ]]; then
     echo "Validation Failed for ${file}"
     exit 1
   fi
done

for file in "${RNC_HOME}"*"4simp.rnc"
do
  filename=$(basename "$file")
  newfilename="${filename/4simp/}"
  cp "${file}" "${RNC4SIMP_HOME}${newfilename}"
done
