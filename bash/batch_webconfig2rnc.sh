#!/bin/bash
# Dependencies: 
# aux_web2rnc.sh
# config_rnc.txt
# config_rnc_myng.txt
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/
REPO_HOME="${BASH_HOME}../"
TEST_HOME=${REPO_HOME}relaxng/test/

# creates the output directories if they don't exist, and clears them of RNC files, in case they already have contents
mkdir -p "${TEST_HOME}"
rm ${TEST_HOME}*.rnc

while read line
do
    echo "Text read from file - $line"
    tokens=( $line )
    ${BASH_HOME}aux_web2rnc.sh "${tokens[1]}" "${TEST_HOME}${tokens[0]}_normal.rnc" >> /dev/null 2>&1
    ${BASH_HOME}aux_web2rnc.sh "${tokens[2]}" "${TEST_HOME}${tokens[0]}_relaxed.rnc" >> /dev/null 2>&1
done < ${BASH_HOME}config_rnc.txt

while read line
do
    echo "Text read from file - $line"
    tokens=( $line )
    ${BASH_HOME}aux_web2rnc.sh "${tokens[1]}" "${TEST_HOME}myng-${tokens[1]}.rnc" >> /dev/null 2>&1
    ${BASH_HOME}aux_web2rnc.sh "${tokens[2]}" "${TEST_HOME}myng-${tokens[2]}.rnc" >> /dev/null 2>&1
done < ${BASH_HOME}config_rnc_myng.txt

for file in ${TEST_HOME}*.rnc
do
  ${BASH_HOME}aux_valrnc.sh "$file"
  if [ "$?" -ne "0" ]; then
     echo "Validation Failed for " "${file}"
     exit 1
   fi
done
