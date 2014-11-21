#!/bin/bash
# Validate an RNC schema, and optionally an XML instance of it, using Jing
# Prerequisites:
#   Installation of Java and Jing. See https://code.google.com/p/jing-trang/
# Note: change the APP_HOME path according to your path to the Jing/Trang library
# Dependencies:
# Jing
# FIXME use configuration script to set path variables
APP_HOME=~/Library/
LIB=${APP_HOME}Java/Extensions/
CP1=${LIB}jing-20091111/jing.jar

# Finds the filename without extension
filename1=$(basename $1)
echo "${filename1}"
extension1="${filename1##*.}"
#filename1NE="${filename1%.*}"

# Verifies that input schema name ends in ".rnc"
if [ "${extension1}" != "rnc" ];then
   echo "Extension of ${filename1} is not .rnc"
   exit 1
fi

# Validate
if [ -z "${2+xxx}" ]; then
  java -jar "${CP1}" -c  "$1"
else  
  java -jar "${CP1}" -c  "$1" "$2"
fi