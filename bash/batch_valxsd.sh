#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
# Dependencies:
# aux_rnc2xsd.sh
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";

# Validate all XSD schemas in the XSD_HOME directory
for f in "${XSD_HOME}"*.xsd
do
  sleep 2
  filename=$(basename "$f")
  "${BASH_HOME}aux_valxsd.sh" "${f}"
  if [[ "$?" -ne "0" ]]; then
     echo "Validation Failed for  ${filename}"
     exit 1
   fi
done
