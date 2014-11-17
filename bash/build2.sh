#!/bin/bash
shopt -s nullglob
BASH_HOME=~/Repositories/RuleML/Github/deliberation-ruleml/bash

# Validate Examples in XSD Test Suites
${BASH_HOME}/batch_xsd-test-suite.sh
if [ "$?" -ne "0" ]; then
     echo "Local Testing of RNC Schemas Failed"
     exit 1
fi
