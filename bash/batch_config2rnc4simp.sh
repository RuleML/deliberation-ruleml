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
RNC4SIMP_HOME=${RNC_HOME}/rnc4simp

# creates the output directories if they don't exist, and clears them of RNC files, in case they already have contents
mkdir -p "${RNC4SIMP_HOME}"
rm ${RNC4SIMP_HOME}/*.rnc

while read line
do
    echo "Text read from file - $line"
    tokens=( $line )
    ${BASH_HOME}/aux_myng2rnc.sh "${tokens[1]}" "${RNC4SIMP_HOME}/${tokens[0]}_normal.rnc" >> /dev/null 2>&1
    ${BASH_HOME}/aux_myng2rnc.sh "${tokens[2]}" "${RNC4SIMP_HOME}/${tokens[0]}_relaxed.rnc" >> /dev/null 2>&1
done < config_rnc4simp.txt


for file in ${RNC4SIMP_HOME}/*.rnc
do
  ${BASH_HOME}/aux_valrnc.sh $file
  if [ "$?" -ne "0" ]; then
     echo "Validation Failed for " "${file}"
     exit 1
   fi
done
