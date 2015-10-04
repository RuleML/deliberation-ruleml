#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";
#
# creates the xsd and xsd_min directory if they don't exist, and clears them of any compact schemas, in case they already exist
mkdir -p "${XSD_HOME}"
rm "${XSD_HOME}"*compact.xsd >> /dev/null 2>&1

# simplify before converting
#simplify=true
# 
# don't simplify before converting
# instead, flatten after converting
simplify=false
# applies the script rnc2xsd.sh to all RNC4XSD schemas
# for debugging, do not remove the temporary RNG
finish=false
# for a clean build, remove the temporary RNG
# finish=true
#
# applies the script rnc2xsd.sh to all compact schemas
# Apply XSLT transforamtions
for f in "${RNC_HOME}"*4xsd.rnc
do
  filename=$(basename "$f")
  filenameNE=$(expr "${filename%.*}" : '\(.*\)4xsd' )
  fxsd="${XSD_HOME}${filenameNE}.xsd"
  "${BASH_HOME}rnc2xsd.sh" "$f" "${fxsd}" "{$simplify}" "{$finish}"
  java -jar "${SAX_HOME}saxon9ee.jar" -s:"${fxsd}" -xsl:"${XSLT2_HOME}rnc2xsd.xslt"  -o:"${fxsd}"
  if [[ "$?" -ne "0" ]]; then
     echo "Post-processing Failed for  ${fxsd}"
     exit 1
   fi
  "${BASH_HOME}aux_valxsd.sh" "${fxsd}"
  if [[ "$?" -ne "0" ]]; then
     echo "Validation Failed for ${fxsd}"
     exit 1
   fi
done
