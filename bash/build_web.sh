#!/bin/bash
# Dependencies
# build_web2rnc.sh
# build_web2xsd.sh
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/

# Download RNC and test
${BASH_HOME}build_web2rnc.sh
if [ "$?" -ne "0" ]; then
     echo "Local Testing of RNC Schemas Failed"
     exit 1
fi
# If everything validates, then build the documentation
${BASH_HOME}build_xsd2doc.sh