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
# creates the xsd and xsd_min directory if they don't exist, and clears them, in case they already have contents
mkdir -p ${XSD_HOME}
mkdir -p "${XSD_HOME}_min"
rm ${XSD_HOME}/*.xsd
rm ${XSD_HOME}_min/*.xsd

${BASH_HOME}/batch_config2rnc4xsd.sh >> /dev/null 2>&1
if [ "$?" -ne "0" ]; then
   echo "Configuration of RNC4XSD Failed"
   exit 1
fi
   
for f in ${RNC4XSD_HOME}/*.rnc
do
  filename=$(basename "$f")
  extension="${filename##*.}"
  filenameNE="${filename%.*}"
  ${BASH_HOME}/rnc2xsd.sh "$f" ${XSD_HOME}/"$filenameNE".xsd
done

for f in ${RNC4XSD_HOME}_min/*.rnc
do
  filename=$(basename "$f")
  extension="${filename##*.}"
  filenameNE="${filename%.*}"
  ${BASH_HOME}/rnc2xsd.sh "$f" ${XSD_HOME}_min/"$filenameNE".xsd
done

rm ${XSD_HOME}/xml.xsd
# Apply XSLT transforamtions
# java  -jar dir/saxon9ee.jar
# Validate Examples XSD Test Suites
# @@@
# Validate Examples in Relax NG Test Suites
exit


