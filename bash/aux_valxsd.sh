#!/bin/bash
# Validate an XSD schema, and optionally an XML instance of it
# Prerequisites:
#   Installation of Java, JAXB, xmllint
# Note: change the JAXB_HOME path according to your path to the JAXB library
# Dependencies:
# JAXB
# xmllint
# FIXME use configuration scripts to set path variables
JAXB_HOME=/Library/Java/JAXB/jaxb-ri-2.2.6/
# Finds the filename without extension
filename=$(basename "$1")
extension=${filename##*.}
#filenameNE=${filename%.*}

# Verifies that input schema name ends in ".xsd"
if [ "${extension}" != "xsd" ];then
   echo "Extension" "$extension"  "is not .xsd"
   exit 1
fi

# Validate schema against JAXB
  java -jar "${JAXB_HOME}lib/jaxb-xjc.jar" "$1" -disableXmlSecurity -d "${TMPDIR}"  >> /dev/null 2>&1
  if [ "$?" -ne "0" ]; then
     echo "Validation Failed for schema " "$1"
     exit 1
   fi
    
 # Validate (using xmllint) the second argument as an instance, if the file exists  
 if [[ -e $2 ]]; then
   xmllint -noout --schema "$1" "$2"   >> /dev/null 2>&1
   if [ "$?" -ne "0" ]; then
     echo "Validation Failed for instance " "$2"
     exit 1
   fi

 fi  