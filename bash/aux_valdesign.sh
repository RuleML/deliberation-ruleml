#!/bin/bash
# Validate an RNG schema against the design pattern
# Prerequisites:
#   Installation of Java and Jing. See https://code.google.com/p/jing-trang/
# Note: change the APP_HOME path according to your path to the Jing/Trang library
APP_HOME=~/Library/
BASH_HOME=~/Repositories/RuleML/Github/deliberation-ruleml/bash
LIB=${APP_HOME}Java/Extensions/
CP1=${LIB}jing-20091111/jing.jar

# Finds the filename without extension
filename=$(basename "$1")
extension="${filename##*.}"
#filenameNE="${filename%.*}"

# Verifies that input file name ends in ".rng"
if [ "${extension}" != "rng" ];then
   echo "Extenstion is not .rng"
   exit 1
fi

#Validate
java -jar "${CP1}"  "${BASH_HOME}/../designPattern/include_expansion_schema.rng" $1
