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
TEST_SUITE_HOME=${RNC_HOME}/../test/rnc-test-suites

#for file in ${TEST_HOME}/*.rnc
#do
#  ${BASH_HOME}/aux_valrnc.sh $file
#  if [ "$?" -ne "0" ]; then
#     echo "Validation Failed for " "${file}"
#     exit 1
#   fi
#done

for file in ${TEST_SUITE_HOME}/**/*.ruleml
do
  #echo "File "${file}
  while read -r; do
     #echo "Line ${REPLY}"
     if [[ ${REPLY} =~ ^..xml-model ]]
     then     
       tail=${REPLY#*\"}
       #echo "Tail ${tail}"
       url=${tail%%\"*}
       #echo "URL ${url}"
       schemaname=${url##*/}
       #echo "Schema ${schemaname}"       
       ${BASH_HOME}/aux_valrnc.sh ${TEST_HOME}/${schemaname}
       exitvalue=$?
       if [ "${exitvalue}" -ne "0" ]; then
          echo "Schema Validation Failed for " "${file}"
          exit 1
       fi   
       ${BASH_HOME}/aux_valrnc.sh ${TEST_HOME}/${schemaname} ${file}
       exitvalue=$?
       if [[ ! ${file} =~ fail ]] && [ "${exitvalue}" -ne "0" ]; then
          echo "Validation Failed for " "${file}"
          exit 1
       else
         if [[ ${file} =~ fail ]] && [ "${exitvalue}" == "0" ]; then
           echo "Validation Succeeded for Failure Test " "${file}"
           exit 1
         fi
       fi
       break
     fi
  done < "${file}"
done
