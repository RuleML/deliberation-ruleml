#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
# Dependencies: 
# aux_web2rnc.sh
# config_xsd.txt
# config_xsd_min.txt
# aux_valrnc.sh
# FIXME use named pipes to avoid writing temporary files
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";

# creates the output directories if they don't exist, and clears them of RNC files, in case they already have contents
mkdir -p "${RNC4XSD_HOME}"
mkdir -p "${RNC4XSD_MIN_HOME}"
rm "${RNC4XSD_HOME}"*.rnc >> /dev/null 2>&1
rm "${RNC4XSD_MIN_HOME}"*.rnc >> /dev/null 2>&1

while read line
do
    echo "Text read from file - $line"
    tokens=( $line )
    "${BASH_HOME}aux_web2rnc.sh" "${tokens[1]}" "${RNC4XSD_HOME}${tokens[0]}_normal.rnc"
    "${BASH_HOME}aux_web2rnc.sh" "${tokens[2]}" "${RNC4XSD_HOME}${tokens[0]}.rnc"
done < "${BASH_HOME}config_xsd.txt"

for file in "${RNC4XSD_HOME}"*.rnc
do
  "${BASH_HOME}aux_valrnc.sh" "$file"
  if [ "$?" -ne "0" ]; then
     echo "Validation Failed for " "${file}"
     exit 1
   fi

done

while read line
do
    echo "Text read from file - $line"
    tokens=( $line )
    "${BASH_HOME}aux_web2rnc.sh" "${tokens[1]}" "${RNC4XSD_MIN_HOME}${tokens[0]}_normal.rnc"
    "${BASH_HOME}aux_web2rnc.sh" "${tokens[2]}" "${RNC4XSD_MIN_HOME}${tokens[0]}.rnc"
done < "${BASH_HOME}config_xsd_min.txt"

for file in "${RNC4XSD_MIN_HOME}"*.rnc
do
  "${BASH_HOME}aux_valrnc.sh" "${file}"
  if [ "$?" -ne "0" ]; then
     echo "Validation Failed for " "${file}"
     exit 1
   fi

done
