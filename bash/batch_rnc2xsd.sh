#!/bin/bash
# Prerequisites:see aux_rnc2xsd.sh
shopt -s nullglob
BASH_HOME=~/Repositories/RuleML/Github/deliberation-ruleml/bash
RNC4XSD_HOME=${BASH_HOME}/../relaxng/rnc4xsd 
XSD_HOME=${BASH_HOME}/../xsd 
OXY_HOME=/Applications/oxygen
SAX_HOME=${OXY_HOME}/lib
XSLT_HOME=${BASH_HOME}/../xslt/rnc2xsd
#
# creates the xsd and xsd_min directory if they don't exist, and clears them, in case they already have contents
mkdir -p ${XSD_HOME}
mkdir -p "${XSD_HOME}_min"
rm ${XSD_HOME}/*.xsd
rm ${XSD_HOME}_min/*.xsd

# applies the script rnc2xsd.sh to all RNC4XSD schemas
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
# transform in place for files in XSD_HOME
for f in ${XSD_HOME}/*.xsd
do
  java -jar ${SAX_HOME}/saxon9ee.jar -s:${f} -xsl:${XSLT_HOME}/rnc2xsd.xslt  -o:${f}
done
# transform and shift for files in XSD_HOME_min
for f in ${XSD_HOME}_min/*.xsd
do
  filename=$(basename "$f")
  java -jar ${SAX_HOME}/saxon9ee.jar -s:${f} -xsl:${XSLT_HOME}/rnc2xsd_min.xslt -o:${XSD_HOME}/${filename}
done

# Validate the resulting XSD schemas
