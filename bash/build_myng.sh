#!/bin/bash
# Dependencies
# build_myng2rnc.sh
# build_myng2xsd.sh
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/

# Test RNC locally
${BASH_HOME}build_myng2rnc.sh
if [ "$?" -ne "0" ]; then
     echo "Local Testing of RNC Schemas Failed"
     exit 1
fi
# Build XSD locally and test
${BASH_HOME}build_myng2xsd.sh
if [ "$?" -ne "0" ]; then
     echo "Local Testing of XSD Schemas Failed"
     exit 1
fi
