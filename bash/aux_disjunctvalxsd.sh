#!/bin/bash
# dc:rights [ 'Copyright 2019 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
#
# XSD validation with multiple maximal elements
#
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";
mkdir -p "${TMPDIR}"
# The first input parameter is the filename of (or relative path to) the configuration file (a text file containing the anchor filename (without serialization suffix or extension) of each schema to be employed).
# The second input parameter is the instance file.
# The third input parameter is a string with the suffix for the serialization ("relaxed", "normal" or "compact").
echo $1
echo $2
echo $3
while read line
do
    echo "Text read from file - $line"
    schemafilewoserialization="${XSD_HOME}$line"
    if [[ "$3" == "normal" ]]; then
      schemafile="${schemafilewoserialization}_normal.xsd"
    elif [[ "$3" == "compact" ]]; then
      schemafile="${schemafilewoserialization}_compact.xsd"
    elif [[ "$3" == "mixed" ]] || [[ "$#" -eq 2 ]]; then
      schemafile="${schemafilewoserialization}.xsd"
    else
	  echo "Invalid third parameter in call to aux_disjunctvalxsd.sh"
    fi
    echo "Schema file - $schemafile"
    "${BASH_HOME}aux_valxsd.sh" "${schemafile}" "$2">/dev/null 2>&1
    if [[ "$?" -ne 1 ]]; then
      echo "$?"
      echo "Validation Succeeded"
      exit 0 
    fi
    echo "Validation Failed"    
done < $1
echo "Validation failed against all maximal schemas"
exit 1
