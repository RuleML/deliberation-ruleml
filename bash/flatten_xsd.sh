#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
# flatten
# Instructions:
# apply the XSLT transformation in xslt/rnc2xsd after flattening
#
# configure the path to the oxygen installation
OXYGEN_HOME=/Applications/oxygen

#   use oxygen to flatten the XSD driver in the $TMP directory and output to the $XSD_HOME directory
sh "$OXYGEN_HOME"/flattenSchemaMac.sh "$1" "$2"

