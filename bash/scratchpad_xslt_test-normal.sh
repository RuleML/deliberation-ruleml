#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
# Prerequisites: batch_rnc2xsd.sh
# Dependecies: 
# aux_valxsd.sh
#  Validate RuleML instances by XSD
# Instructions:
# run this script from the command line or another script after batch_rnc2xsd.sh
#
# globstar is only available in bash 4
#shopt -s globstar
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";

# Apply normalization XSLT transforamtions
# transform selected file
# output to same directory to modified name
EXA_HOME="${REPO_HOME}exa/"
DATALOGPSOA_HOME="${EXA_HOME}DatalogPSOA/"
filename_ne="cyclic-purchasePSOA_bare"
filename="${filename_ne}.ruleml"
normal="${filename_ne}_normal.ruleml"
echo "Transforming  ${filename}"
"${BASH_HOME}aux_xslt.sh" "${DATALOGPSOA_HOME}${filename}" "${NORMAL_XSLT_HOME}normalizer.xslt" "${DATALOGPSOA_HOME}${normal}"
if [[ "$?" -ne "0" ]]; then
   echo "XSLT Transformation Failed for  ${filename}"
   exit 1
fi
