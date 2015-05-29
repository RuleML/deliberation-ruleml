#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
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