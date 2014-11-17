#!/bin/bash
shopt -s nullglob
BASH_HOME=~/Repositories/RuleML/Github/deliberation-ruleml/bash

# Download RNC and test
${BASH_HOME}/build_web2rnc.sh
if [ "$?" -ne "0" ]; then
     echo "Local Testing of RNC Schemas Failed"
     exit 1
fi
# Download RNC and convert to XSD
${BASH_HOME}/build_web2xsd.sh
if [ "$?" -ne "0" ]; then
     echo "Local Testing of XSD Schemas Failed"
     exit 1
fi
# If everything validates, then build the documentation
# ${BASH_HOME}/build_xsd2doc.sh