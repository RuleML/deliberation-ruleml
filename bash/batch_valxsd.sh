#!/bin/bash
# Dependencies:
# aux_rnc2xsd.sh
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/
REPO_HOME="${BASH_HOME}../"
XSD_HOME=${REPO_HOME}xsd/
#
# Validate all XSD schemas in the XSD_HOME directory
for f in ${XSD_HOME}*.xsd
do
  filename=$(basename "$f")
  "${BASH_HOME}aux_valxsd.sh" "${f}"
  if [ "$?" -ne "0" ]; then
     echo "Validation Failed for " "${filename}"
     exit 1
   fi
done
