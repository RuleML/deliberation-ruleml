#!/bin/bash
# Auto-generate XSD from MYNG RNC
# Prerequisites:
#  Installation of curl
#  See also rnc2xsd for additional dependencies.
# This script will remove the contents of sibling directories named /xsd and /xsd_min.
# Instructions:
# run this script from the command line
# then apply the XSLT transformations in http://deliberation.ruleml.org/1.02/xslt/rnc2xsd:
#  1. rnc2xsd.xslt to all the file in the xsd directory, in place
#  2. rnc2xsd_min.xslt to all the files in the xsd_min directory, write output into xsd directory
shopt -s nullglob
BASH_HOME=~/Repositories/RuleML/Github/deliberation-ruleml/bash
RNC4XSD_HOME=${BASH_HOME}/../relaxng/rnc4xsd 
XSD_HOME=${BASH_HOME}/../xsd 
# 

${BASH_HOME}/batch_config2rnc4xsd.sh >> /dev/null 2>&1
if [ "$?" -ne "0" ]; then
   echo "Configuration of RNC4XSD Failed"
   exit 1
fi

# Download RNC and simplify, and validate
${BASH_HOME}/batch_rnc2xsd.sh
if [ "$?" -ne "0" ]; then
     echo "Validation Against Design Failed"
     exit 1
fi
   
# Validate Examples in XSD Test Suites
exit


