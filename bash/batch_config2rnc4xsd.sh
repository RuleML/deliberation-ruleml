#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";

# clears the output directories
rm "${RNC4XSD_HOME}"*.rnc >> /dev/null 2>&1
rm "${RNC4XSD_MIN_HOME}"*.rnc >> /dev/null 2>&1

while read line
do
    echo "Text read from file - $line"
    tokens=( $line )
    "${BASH_HOME}aux_myng2rnc.sh" "${tokens[1]}" "${RNC4XSD_HOME}${tokens[0]}_normal.rnc"
    "${BASH_HOME}aux_myng2rnc.sh" "${tokens[2]}" "${RNC4XSD_HOME}${tokens[0]}.rnc"
done < "${BASH_HOME}config_xsd.txt"

for file in "${RNC4XSD_HOME}"*.rnc
do
  "${BASH_HOME}aux_valrnc.sh" "${file}"
  if [ "$?" -ne "0" ]; then
     echo "Validation Failed for " "${file}"
     exit 1
   fi

done

while read line
do
    echo "Text read from file - $line"
    tokens=( $line )
    "${BASH_HOME}aux_myng2rnc.sh" "${tokens[1]}" "${RNC4XSD_MIN_HOME}${tokens[0]}_normal.rnc"
    "${BASH_HOME}aux_myng2rnc.sh" "${tokens[2]}" "${RNC4XSD_MIN_HOME}${tokens[0]}.rnc"
done < "${BASH_HOME}config_xsd_min.txt"

for file in "${RNC4XSD_MIN_HOME}"*.rnc
do
  "${BASH_HOME}aux_valrnc.sh" "${file}"
  if [ "$?" -ne "0" ]; then
     echo "Validation Failed for " "${file}"
     exit 1
   fi

done

cp "${RNC_HOME}naffologeq_compact4xsd.rnc" "${RNC4XSD_HOME}"

