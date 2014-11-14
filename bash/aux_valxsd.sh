#!/bin/bash
# Validate an XSD schema, and optionally an XML instance of it, using Xerces
# Prerequisites:
#   Installation of Java and Jing. See https://code.google.com/p/jing-trang/
# Note: change the APP_HOME path according to your path to the Jing/Trang library
APP_HOME=~/Library/
LIB=${APP_HOME}Java/Extensions/
CP3=${LIB}xerces-2_11_0
# Finds the filename without extension
filename=$(basename "$1")
extension="${filename##*.}"
#filenameNE="${filename%.*}"

# Verifies that input schema name ends in ".xsd"
if [ "${extension}" != "xsd" ];then
   echo "Extenstion is not .xsd"
   exit 1
fi

# Validate
java -jar "${CP1}" $1 $2
