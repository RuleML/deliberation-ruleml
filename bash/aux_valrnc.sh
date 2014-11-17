#!/bin/bash
# Validate an RNC schema, and optionally an XML instance of it, using Jing
# Prerequisites:
#   Installation of Java and Jing. See https://code.google.com/p/jing-trang/
# Note: change the APP_HOME path according to your path to the Jing/Trang library
APP_HOME=~/Library/
LIB=${APP_HOME}Java/Extensions/
CP1=${LIB}jing-20091111/jing.jar

# Finds the filename without extension
filename=$(basename "$1")
extension="${filename##*.}"
#filenameNE="${filename%.*}"

# Verifies that input schema name ends in ".rnc"
if [ "${extension}" != "rnc" ];then
   echo "Extenstion is not .rnc"
   exit 1
fi

# Validate
java -jar "${CP1}" -c  $1 $2
