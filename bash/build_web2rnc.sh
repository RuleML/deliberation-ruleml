#!/bin/bash
shopt -s nullglob
BASH_HOME=~/Repositories/RuleML/Github/deliberation-ruleml/bash
RNC_HOME=${BASH_HOME}/../relaxng
#
# Validate modules individually
for file in ${RNC_HOME}/indep_valid_modules/*.rnc
do
  ${BASH_HOME}/aux_valrnc.sh ${file} >> /dev/null 2>&1
  if [ "$?" -ne "0" ]; then
     echo "Module Validation Failed"
     exit 1
  fi
done
# Validate modules all together
for file in ${RNC_HOME}/all_*.rnc
do
  ${BASH_HOME}/aux_valrnc.sh ${file} >> /dev/null 2>&1
  if [ "$?" -ne "0" ]; then
     echo "Driver Validation Failed"
     exit 1
  fi
done
# Download RNC and convert to RNG, and validate
${BASH_HOME}/batch_rnc2rng.sh
if [ "$?" -ne "0" ]; then
     echo "Validation Against Design Failed"
     exit 1
fi
# Download RNC for Testing
${BASH_HOME}/batch_config2rnc.sh
if [ "$?" -ne "0" ]; then
     echo "Local Configuration of RNC Schemas Failed"
     exit 1
fi
# Validate Examples in Relax NG Test Suites
${BASH_HOME}/batch_rnc-test-suite.sh
if [ "$?" -ne "0" ]; then
     echo "Local Testing of RNC Schemas Failed"
     exit 1
fi
