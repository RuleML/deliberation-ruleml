#!/bin/bash
# Prerequisites:
#  curl
# Download RNC schemas from MYNG for auto-generation of XSD
# This script will remove the contents of a sibling directory named /relaxng/rnc4xsd.
# Instructions:
# run this script from the command line
# Notes
# 1. The parameter serial=x10 or serial=x12 includes a "pivot" bit for customizing the RNC schema for conversion to XSD.
#
shopt -s nullglob
BASH_HOME=~/Repositories/RuleML/Github/deliberation-ruleml/bash
RNC_HOME=${BASH_HOME}/../relaxng
TEST_HOME=${RNC_HOME}/test
TEST_SUITE_HOME=${RNC_HOME}/../test/rnc-test-suite
APP_HOME=/Users/taraathan/Library/
LIB=${APP_HOME}Java/Extensions/
CP1=${LIB}jing-20091111/jing.jar

# creates the output directories if they don't exist, and clears them of RNC files, in case they already have contents
mkdir -p "${TEST_HOME}"
rm ${TEST_HOME}/*.rnc

while read line
do
    echo "Text read from file - $line"
    tokens=( $line )
    ${BASH_HOME}/aux_myng2rnc.sh "${tokens[1]}" "${TEST_HOME}/${tokens[0]}_normal.rnc" >> /dev/null 2>&1
    ${BASH_HOME}/aux_myng2rnc.sh "${tokens[2]}" "${TEST_HOME}/${tokens[0]}_relaxed.rnc" >> /dev/null 2>&1
done < config_rnc.txt

while read line
do
    echo "Text read from file - $line"
    tokens=( $line )
    ${BASH_HOME}/aux_myng2rnc.sh "${tokens[1]}" "${TEST_HOME}/myng-${tokens[1]}.rnc" >> /dev/null 2>&1
    ${BASH_HOME}/aux_myng2rnc.sh "${tokens[2]}" "${TEST_HOME}/myng-${tokens[2]}.rnc" >> /dev/null 2>&1
done < config_rnc_myng.txt

for file in ${TEST_HOME}/*.rnc
do
  ${BASH_HOME}/aux_valrnc.sh $file
  if [ "$?" -ne "0" ]; then
     echo "Validation Failed for " "${file}"
     exit 1
   fi
done
