#!/bin/bash
# Dependencies: 
# aux_myng2rnc.sh
# config_xsd.txt
# config_xsd_min.txt
# aux_valrnc.sh
# FIXME use named pipes to avoid writing temporary files
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/
REPO_HOME="${BASH_HOME}../"
RNC4XSD_HOME=${REPO_HOME}relaxng/rnc4xsd/ 
RNC4XSD_MIN_HOME=${REPO_HOME}relaxng/rnc4xsd_min/ 

# creates the output directories if they don't exist, and clears them of RNC files, in case they already have contents
mkdir -p ${RNC4XSD_HOME}
mkdir -p ${RNC4XSD_MIN_HOME}
rm ${RNC4XSD_HOME}*.rnc
rm ${RNC4XSD_MIN_HOME}*.rnc

while read line
do
    echo "Text read from file - $line"
    tokens=( $line )
    ${BASH_HOME}aux_myng2rnc.sh "${tokens[1]}" "${RNC4XSD_HOME}${tokens[0]}_normal.rnc" >> /dev/null 2>&1
    ${BASH_HOME}aux_myng2rnc.sh "${tokens[2]}" "${RNC4XSD_HOME}${tokens[0]}.rnc" >> /dev/null 2>&1
done < ${BASH_HOME}config_xsd.txt

for file in ${RNC4XSD_HOME}*.rnc
do
  ${BASH_HOME}aux_valrnc.sh $file
  if [ "$?" -ne "0" ]; then
     echo "Validation Failed for " "${file}"
     exit 1
   fi

done

while read line
do
    echo "Text read from file - $line"
    tokens=( $line )
    ${BASH_HOME}aux_myng2rnc.sh "${tokens[1]}" "${RNC4XSD_MIN_HOME}${tokens[0]}_normal.rnc" >> /dev/null 2>&1
    ${BASH_HOME}aux_myng2rnc.sh "${tokens[2]}" "${RNC4XSD_MIN_HOME}${tokens[0]}.rnc" >> /dev/null 2>&1
done < ${BASH_HOME}config_xsd_min.txt

for file in ${RNC4XSD_MIN_HOME}*.rnc
do
  ${BASH_HOME}aux_valrnc.sh $file
  if [ "$?" -ne "0" ]; then
     echo "Validation Failed for " "${file}"
     exit 1
   fi

done
