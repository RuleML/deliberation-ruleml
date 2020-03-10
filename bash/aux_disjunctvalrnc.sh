#!/bin/bash
# dc:rights [ 'Copyright 2020 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
#
# RNC validation with multiple maximal elements
#
DEBUG=false
if ! BASH_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/"
then
     echo "BASH_HOME assignment failed"
     exit 1
fi
if ! . "${BASH_HOME}path_config.sh"
then
     echo "Path configuration failed"
     exit 1
fi
# Create TMPDIR if it does not exist. If it does exist, fail silently and continue.
mkdir -p "${TMPDIR}"
# The first input parameter is the filename of (or relative path to) the configuration file (a text file containing the anchor filename (without serialization suffix or extension) of each schema to be employed).
# The second input parameter is the instance file.
# The optional third input parameter is a string with the suffix for the serialization - "relaxed"(default) or  "normal".
# POSTPONED: The third input parameter can also be "compact".
echo $1
echo $2
echo $3
while read line
do
    echo "Text read from file - $line"
    schemafilewoserialization="${DRIVER_HOME}$line"
    if [[ "$3" == "normal" ]]; then
      schemafile="${schemafilewoserialization}_normal.rnc"
    elif [[ "$3" == "compact" ]]; then
      schemafile="${schemafilewoserialization}_compact.rnc"
    elif [[ "$3" == "relaxed" ]] || [[ "$#" -eq 2 ]]; then
      schemafile="${schemafilewoserialization}_relaxed.rnc"
    else
	  echo "Invalid third parameter in call to aux_disjunctvalrnc.sh"
    fi
    echo "Schema file - $schemafile"
    if [[ "$DEBUG" == true ]]; then
      "${BASH_HOME}aux_valrnc.sh" "${schemafile}" "$2"
    else
      "${BASH_HOME}aux_valrnc.sh" "${schemafile}" "$2">/dev/null 2>&1
    fi
    if [[ "$?" -ne 1 ]]; then
      echo "$?"
      echo "Validation Succeeded"
      exit 0 
    fi
    echo "Validation Failed"    
done < $1
echo "Validation failed against all maximal schemas"
exit 1
