#!/bin/bash
# Dependencies: 
# aux_web2rnc.sh
# config_rnc4simp.txt
# aux_valrnc.sh
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/
REPO_HOME="${BASH_HOME}../"
RNC4SIMP_HOME=${REPO_HOME}relaxng/rnc4simp/

# creates the output directories if they don't exist, and clears them of RNC files, in case they already have contents
mkdir -p "${RNC4SIMP_HOME}"
rm ${RNC4SIMP_HOME}*.rnc

while read line
do
    echo "Text read from file - $line"
    tokens=( $line )
    ${BASH_HOME}aux_web2rnc.sh "${tokens[1]}" "${RNC4SIMP_HOME}${tokens[0]}_normal.rnc" >> /dev/null 2>&1
    ${BASH_HOME}aux_web2rnc.sh "${tokens[2]}" "${RNC4SIMP_HOME}${tokens[0]}_relaxed.rnc" >> /dev/null 2>&1
done < ${BASH_HOME}config_rnc4simp.txt


for file in ${RNC4SIMP_HOME}*.rnc
do
  ${BASH_HOME}aux_valrnc.sh "$file"
  if [ "$?" -ne "0" ]; then
     echo "Validation Failed for " "${file}"
     exit 1
   fi
done
