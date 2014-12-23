#!/bin/bash
# Fully cloud test script for XSD
# Dependencies
# batch_webconfig2rnc4xsd.sh
# batch_rnc2xsd.sh
# webserver
# FIXME Download test suite from cloud to temporary directory
# FIXME Download drivers from cloud to temporary directory
# FIXME Output generated files into temporary directories
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/

# Downlad RNC
${BASH_HOME}batch_webconfig2rnc4xsd.sh >> /dev/null 2>&1
if [ "$?" -ne "0" ]; then
   echo "Configuration of RNC4XSD Failed"
   exit 1
fi

# Generate XSD and validate
${BASH_HOME}batch_rnc2xsd.sh
if [ "$?" -ne "0" ]; then
     echo "Generation of XSD Failed"
     exit 1
fi
   
# Validate Examples in XSD Test Suites
${BASH_HOME}batch_xsd-test-suite.sh  >> /dev/null 2>&1
if [ "$?" -ne "0" ]; then
     echo "Cloud Testing of XSD Schemas Failed"
     exit 1
fi


