#!/bin/bash
# Formatter Laws Build Script
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";

# Test Formatters
"${BASH_HOME}generate_mixed_xml.sh"
if [[ "$?" -ne "0" ]]; then
     echo "Local Testing of RNC Schemas Failed"
     exit 1
fi
# Test NC Law
"${BASH_HOME}generate_normal_xml.sh"
if [[ "$?" -ne "0" ]]; then
     echo "Local Testing of RNC Schemas Failed"
     exit 1
fi
# Test CN Law for If-Then Compact Serialization
"${BASH_HOME}generate_compact-ifthen_xml.sh"
if [[ "$?" -ne "0" ]]; then
     echo "Local Testing of XSD Schemas Failed"
     exit 1
fi
# Test CN Law for Full Compact Serialization
"${BASH_HOME}generate_compact_xml.sh"
if [[ "$?" -ne "0" ]]; then
     echo "Local Testing of XSD Schemas Failed"
     exit 1
fi
